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
        } else {
            contentView.numberLabel.textColor = .customGreen
        }
    }
}
