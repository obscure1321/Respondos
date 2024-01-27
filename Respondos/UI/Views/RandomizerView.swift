//
//  RandomizerView.swift
//  Respondos
//
//  Created by Miras Maratov on 24.01.2024.
//

import UIKit

final class RandomizerView: UIView {
    private var rollButton = GeneralButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        addViews()
        setButton(view: self,
                  button: rollButton,
                  title: "R O L L",
                  bottom: 80,
                  side: 120)
    }
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
}

private extension RandomizerView {
    func addViews() {
        addSubview(rollButton)
    }
}
