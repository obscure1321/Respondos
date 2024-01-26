//
//  HeadsOrTailsViewController.swift
//  Respondos
//
//  Created by Miras Maratov on 24.01.2024.
//

import UIKit

final class HeadsOrTailsViewController: UIViewController {
    
    private let contentView = HeadsOrTailsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = contentView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.parent?.title = "Heads or Tails"
        setUpNavBar()
    }
}

extension HeadsOrTailsViewController {
    private func setUpNavBar() {
        self.parent?.navigationItem.largeTitleDisplayMode = .always
        self.parent?.navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.005332739092, green: 0.1982556581, blue: 0.1359425783, alpha: 1)
        self.parent?.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.parent?.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}
