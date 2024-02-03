//
//  YesOrNoView.swift
//  Respondos
//
//  Created by Miras Maratov on 24.01.2024.
//

import UIKit
import SnapKit

final class YesOrNoView: UIView {
    // MARK: - properties
    private var yesOrNoButton = GeneralButton()
    
    // MARK: - initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        addViews()
        setButton(view: self,
                  button: yesOrNoButton,
                  title: "A N S W E R",
                  bottom: 80,
                  side: 120)
        
        yesOrNoButton.addTarget(self, action: #selector(answerButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
}

// MARK: - extension for flow funcs
private extension YesOrNoView {
    func addViews() {
        addSubview(yesOrNoButton)
    }
    
    @objc func answerButton() {
        print("yes or no")
    }
}
