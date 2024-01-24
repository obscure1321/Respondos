//
//  ProsNConsViewController.swift
//  Respondos
//
//  Created by Miras Maratov on 24.01.2024.
//

import UIKit

final class ProsNConsViewController: UIViewController {
    
    private let contentView = ProsNConsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = contentView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.parent?.title = "Pros and Cons"
    }
}
