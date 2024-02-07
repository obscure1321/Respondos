//
//  RandomizerView.swift
//  Respondos
//
//  Created by Miras Maratov on 24.01.2024.
//

import UIKit

final class RandomizerView: UIView {
    private var randomizerButton = GeneralButton()
    
    private lazy var randomNumber = Int()
    
    private var numberLabel: UILabel = {
        let element = UILabel()
        element.numberOfLines = 1
        element.textAlignment = .center
        element.text = "505"
        element.textColor = #colorLiteral(red: 0.005332739092, green: 0.1982556581, blue: 0.1359425783, alpha: 1)
        element.font = UIFont.boldSystemFont(ofSize: 40)
        element.adjustsFontSizeToFitWidth = true
        element.minimumScaleFactor = 0.7
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
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
        randomNumber = Int.random(in: 0 ... 100)
        numberLabel.text = "\(randomNumber)"
    }
}
