//
//  RandomizerView.swift
//  Respondos
//
//  Created by Miras Maratov on 24.01.2024.
//

import UIKit

final class RandomizerView: UIView {
    // MARK: - properties
    private var randomizerButton = GeneralButton()
    
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
        randomizerButton.addTarget(self, action: #selector(rollButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
}

// MARK: - extension for flow funcs
private extension RandomizerView {
    func addViews() {
        addSubview(randomizerButton)
        addSubview(numberLabel)
    }
    
    func setConstraints() {
        numberLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    @objc func rollButton() {
        numberLabel.text = "♗"
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            let randomNumber = Int.random(in: 0 ... 100)
            self.numberLabel.text = "\(randomNumber)"
        }
    }
}
