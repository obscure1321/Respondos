//
//  YesOrNoViewController.swift
//  Respondos
//
//  Created by Miras Maratov on 24.01.2024.
//

import UIKit

final class YesOrNoViewController: UIViewController {
    // MARK: - properties
    private let contentView = YesOrNoView()
    
    // MARK: - lifecycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        view = contentView
        setLabelColor()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setUpNavBar(contentView, NSLocalizedString("navbarYesOrNo", comment: "navbar title for yesOrNo VC"))
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setLabelColor()
    }
}

// MARK: - extension for text color changing funcs
private extension YesOrNoViewController {
    func isDarkModeEnabled() -> Bool {
         return traitCollection.userInterfaceStyle == .dark
     }
    
    func setLabelColor() {
        let isDarkMode = isDarkModeEnabled()
        
        if isDarkMode {
            contentView.answerLabel.textColor = .white
        } else {
            contentView.answerLabel.textColor = .customGreen
        }
    }
}
