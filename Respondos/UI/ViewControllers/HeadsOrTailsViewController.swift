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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setUpNavBar(self.view, "Heads or Tails")
    }
}
