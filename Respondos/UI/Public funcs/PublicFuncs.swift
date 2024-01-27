//
//  SetUpNavBarFunc.swift
//  Respondos
//
//  Created by Miras Maratov on 27.01.2024.
//

import UIKit

public func setUpNavBar(_ view: UIView, _ title: String) {
    let navigationBar = UINavigationBar(frame: CGRect(
        x: 0,
        y: 0,
        width: view.frame.size.width,
        height: (view.frame.height / 6.5)
    ))
    let navigationItem = UINavigationItem(title: title)
    
    navigationItem.largeTitleDisplayMode = .always
    navigationBar.items = [navigationItem]
    navigationBar.backgroundColor = #colorLiteral(red: 0.005332739092, green: 0.1982556581, blue: 0.1359425783, alpha: 1)
    navigationBar.prefersLargeTitles = true
    navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    
    view.addSubview(navigationBar)
}
