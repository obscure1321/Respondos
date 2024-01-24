//
//  RandomizerViewController.swift
//  Respondos
//
//  Created by Miras Maratov on 24.01.2024.
//

import UIKit

final class RandomizerViewController: UIViewController {

    private let contentView = RandomizerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = contentView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.parent?.title = "Random number"
    }
}
