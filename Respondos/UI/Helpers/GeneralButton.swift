//
//  GeneralButton.swift
//  Respondos
//
//  Created by Miras Maratov on 27.01.2024.
//

import UIKit

// MARK: - custom button class
final class GeneralButton: UIButton {
    // MARK: - initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpButton()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - extension for flow funcs
private extension GeneralButton {
    func setUpButton() {
        setTitleColor(.white, for: .normal)
        titleLabel?.adjustsFontSizeToFitWidth = true
        titleLabel?.minimumScaleFactor = 0.5
        backgroundColor = .customGreen
        layer.cornerRadius = 24
        translatesAutoresizingMaskIntoConstraints = false
    }
}
