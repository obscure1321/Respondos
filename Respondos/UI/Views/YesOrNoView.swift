//
//  YesOrNoView.swift
//  Respondos
//
//  Created by Miras Maratov on 24.01.2024.
//

import UIKit
import SnapKit

final class YesOrNoView: UIView {
    // MARK: - properties
    private var yesOrNoButton = GeneralButton()
    
    var answerLabel: UILabel = {
        let element = UILabel()
        element.numberOfLines = 1
        element.textAlignment = .center
        element.text = "Yes/No"
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
                  button: yesOrNoButton,
                  title: "A N S W E R",
                  bottom: 80,
                  side: 120)
        
        yesOrNoButton.addTarget(self, action: #selector(answerButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
}

// MARK: - extension for flow funcs
private extension YesOrNoView {
    func addViews() {
        addSubview(yesOrNoButton)
        addSubview(answerLabel)
    }
    
    func setConstraints() {
        answerLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    @objc func answerButton() {
        let number = Int.random(in: 0 ... 100)

        if number % 2 == 0 {
            self.answerLabel.text = " Y E S "
        } else {
            self.answerLabel.text = " N O "
        }
    }
}
