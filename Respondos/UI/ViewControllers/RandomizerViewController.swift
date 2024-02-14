//
//  RandomizerViewController.swift
//  Respondos
//
//  Created by Miras Maratov on 24.01.2024.
//

import UIKit

final class RandomizerViewController: UIViewController {
    // MARK: - properties
    private let contentView = RandomizerView()
    
    // MARK: - lifecycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        view = contentView
        setLabelColor()
        setTextFiled()
        setButton()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setUpNavBar(contentView, "Random Number")
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setLabelColor()
    }
}

// MARK: - extension for text color changing funcs
private extension RandomizerViewController {
    func isDarkModeEnabled() -> Bool {
         return traitCollection.userInterfaceStyle == .dark
     }
    
    func setLabelColor() {
        let isDarkMode = isDarkModeEnabled()
        
        if isDarkMode {
            contentView.numberLabel.textColor = .white
            contentView.rangeLabel.textColor = .white
        } else {
            contentView.numberLabel.textColor = .customGreen
            contentView.rangeLabel.textColor = .customGreen
        }
    }
    
    func setTextFiled() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissNumPad))
        contentView.addGestureRecognizer(tapGesture)
        
        contentView.minTextField.delegate = self
        contentView.maxTextField.delegate = self
    }
    
    func setButton() {
        contentView.randomizerButton.addTarget(self, action: #selector(rollButton), for: .touchUpInside)
        contentView.vibroGenerator.prepare()
    }
    
    private func showAlert(title: String) {
        let alert = UIAlertController(title: title,
                                      message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    private func getRandomNumber() {
        contentView.vibroGenerator.impactOccurred()
        contentView.playSound()
        contentView.randomizerButton.isEnabled = false
        
        contentView.numberLabel.text = "♗"
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            let randomNumber = Int.random(in: self.contentView.minNumber! ... self.contentView.maxNumber!)
            self.contentView.numberLabel.text = "\(randomNumber)"
            self.contentView.randomizerButton.isEnabled = true
        }
    }
    
    @objc func rollButton() {
        if contentView.minNumber == nil && contentView.maxNumber == nil {
            showAlert(title: "You need to set the range")
        } else if contentView.minNumber == nil || contentView.maxNumber == nil {
            showAlert(title: "You need to set second border")
        }
        
        guard contentView.minNumber != nil, contentView.maxNumber != nil else { return }
        
        if contentView.minNumber! <= contentView.maxNumber! {
            getRandomNumber()
        } else {
            showAlert(title: "Minimum border must be lower or equal than maximum border")
        }
    }
    
    @objc func dismissNumPad() {
        contentView.endEditing(true)
    }
}

extension RandomizerViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 8
        guard let text = textField.text else { return true }
        let newLength = text.count + string.count - range.length
        
        if newLength > 1 && text == "0" && string != "" {
            return false
        }
        
        return newLength <= maxLength
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text, let number = Int(text) {
            if textField == contentView.minTextField {
                self.contentView.minNumber = number
            } else if textField == contentView.maxTextField {
                self.contentView.maxNumber = number
            }
        } else {
            if textField == contentView.minTextField {
                self.contentView.minNumber = nil
            } else if textField == contentView.maxTextField {
                self.contentView.maxNumber = nil
            }
        }
    }
}
