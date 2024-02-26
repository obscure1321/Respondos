//
//  SetUpNavBarFunc.swift
//  Respondos
//
//  Created by Miras Maratov on 27.01.2024.
//

import UIKit

// MARK: - func to add custom navBar and cpnfigure it
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
    navigationBar.backgroundColor = .customGreen
    navigationBar.prefersLargeTitles = true
    navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    
    view.addSubview(navigationBar)
}

// MARK: - func to set title and constraints to button
public func setButton(view: UIView, button: UIButton, title: String, bottom: Int, side: Int) {
    button.setTitle(title, for: .normal)
    
    if UIDevice.current.userInterfaceIdiom == .pad {
        button.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-bottom)
            $0.leading.equalToSuperview().offset(side)
            $0.trailing.equalToSuperview().offset(-side)
            $0.height.equalTo(180)
        }
    } else {
        button.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-bottom)
            $0.leading.equalToSuperview().offset(side)
            $0.trailing.equalToSuperview().offset(-side)
            $0.height.equalTo(button.snp.width).multipliedBy(0.4)
        }
    }
 
}
