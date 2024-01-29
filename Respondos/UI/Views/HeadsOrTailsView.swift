//
//  HeadsOrTailsView.swift
//  Respondos
//
//  Created by Miras Maratov on 24.01.2024.
//

import UIKit

final class HeadsOrTailsView: UIView {
    private var headsOrTailsButton = GeneralButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        addViews()
        setButton(view: self,
                  button: headsOrTailsButton,
                  title: "T O S S",
                  bottom: 80,
                  side: 120)
        headsOrTailsButton.addTarget(self, action: #selector(tossButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
}

private extension HeadsOrTailsView {
    func addViews() {
        addSubview(headsOrTailsButton)
    }
    
    @objc func tossButton() {
        print("heads or tails")
    }
}
