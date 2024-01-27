//
//  YesOrNoViewController.swift
//  Respondos
//
//  Created by Miras Maratov on 24.01.2024.
//

import UIKit

final class YesOrNoViewController: UIViewController {
    
    private let contentView = YesOrNoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = contentView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setUpNavBar(self.view, "Yes or No")
    }
}
