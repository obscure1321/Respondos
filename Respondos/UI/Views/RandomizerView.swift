//
//  RandomizerView.swift
//  Respondos
//
//  Created by Miras Maratov on 24.01.2024.
//

import UIKit
import AVFoundation

final class RandomizerView: UIView {
    // MARK: - properties
    var player: AVAudioPlayer!
    
    let vibroGenerator = UIImpactFeedbackGenerator(style: .soft)
    var randomizerButton = GeneralButton()
    
    var minNumber: Int? = 0
    var maxNumber: Int? = 100
    
    var rangeLabel: UILabel = {
        let element = UILabel()
        element.numberOfLines = 1
        element.textAlignment = .center
        element.text = "Set the range"
        element.textColor = .customGreen
        element.font = UIFont.boldSystemFont(ofSize: 24)
        element.adjustsFontSizeToFitWidth = true
        element.minimumScaleFactor = 0.7
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    var minTextField: UITextField = {
        let element = UITextField()
        element.backgroundColor = .customGreen
        element.textColor = .white
        element.text = "0"
        element.attributedPlaceholder = NSAttributedString(
            string: "min",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        element.borderStyle = .roundedRect
        element.keyboardType = .numberPad
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    var maxTextField: UITextField = {
        let element = UITextField()
        element.backgroundColor = .customGreen
        element.textColor = .white
        element.text = "100"
        element.attributedPlaceholder = NSAttributedString(
            string: "max",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        element.borderStyle = .roundedRect
        element.keyboardType = .numberPad
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    var numberLabel: UILabel = {
        let element = UILabel()
        element.numberOfLines = 1
        element.textAlignment = .center
        element.text = "505"
        element.textColor = .customGreen
        element.font = UIFont.boldSystemFont(ofSize: 40)
        element.adjustsFontSizeToFitWidth = true
        element.minimumScaleFactor = 0.7
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    // MARK: - initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        addViews()
        setConstraints()
        setButton(view: self,
                  button: randomizerButton,
                  title: "R O L L",
                  bottom: 80,
                  side: 120)
    }
    
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
}

// MARK: - extension for flow funcs
extension RandomizerView {
    func addViews() {
        addSubview(randomizerButton)
        addSubview(rangeLabel)
        addSubview(minTextField)
        addSubview(maxTextField)
        addSubview(numberLabel)
    }
    
    func setConstraints() {
        rangeLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(80)
            $0.leading.equalToSuperview().offset(40)
            $0.trailing.equalToSuperview().offset(-40)
            $0.height.equalTo(40)
        }
        
        minTextField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(40)
            $0.top.equalTo(rangeLabel.snp.bottom).offset(20)
            $0.height.equalTo(40)
            $0.width.equalToSuperview().multipliedBy(0.3)
        }
        
        maxTextField.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-40)
            $0.top.equalTo(rangeLabel.snp.bottom).offset(20)
            $0.height.equalTo(40)
            $0.width.equalToSuperview().multipliedBy(0.3)
        }
        
        numberLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "randomizerSound", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
