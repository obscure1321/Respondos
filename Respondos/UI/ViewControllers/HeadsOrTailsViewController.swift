//
//  HeadsOrTailsViewController.swift
//  Respondos
//
//  Created by Miras Maratov on 24.01.2024.
//

import UIKit

final class HeadsOrTailsViewController: UIViewController {
    // MARK: - properties
    private let contentView = HeadsOrTailsView()
    
    // MARK: - lifecycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        view = contentView
        setLabelColor()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setUpNavBar(contentView, NSLocalizedString("navbarHeadsOrTails", comment: "navbar title for heads or tails"))
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setLabelColor()
    }
}

// MARK: - extension for text color changing funcs
private extension HeadsOrTailsViewController {
    func isDarkModeEnabled() -> Bool {
         return traitCollection.userInterfaceStyle == .dark
     }
    
    func setLabelColor() {
        let isDarkMode = isDarkModeEnabled()
        
        if isDarkMode {
            contentView.coinLabel.textColor = .white
        } else {
            contentView.coinLabel.textColor = .customGreen
        }
    }
}
