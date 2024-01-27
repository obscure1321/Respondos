//
//  HeadsOrTailsView.swift
//  Respondos
//
//  Created by Miras Maratov on 24.01.2024.
//

import UIKit

final class HeadsOrTailsView: UIView {
    private var tossButton = GeneralButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        addViews()
        setButton(view: self,
                  button: tossButton,
                  title: "T O S S",
                  bottom: 80,
                  side: 120)
    }
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
}

private extension HeadsOrTailsView {
    func addViews() {
        addSubview(tossButton)
    }
}
