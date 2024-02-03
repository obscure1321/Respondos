//
//  HeadsOrTailsView.swift
//  Respondos
//
//  Created by Miras Maratov on 24.01.2024.
//

import UIKit

final class HeadsOrTailsView: UIView {
    private var headsOrTailsButton = GeneralButton()
    
    private var coinImageView: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleToFill
        element.clipsToBounds = true
        element.backgroundColor = .clear
        element.image = UIImage(named: "heads")
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        addViews()
        setButton(view: self,
                  button: headsOrTailsButton,
                  title: "T O S S",
                  bottom: 80,
                  side: 120)
        setConstraints()
        
        headsOrTailsButton.addTarget(self, action: #selector(tossButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
}

private extension HeadsOrTailsView {
    func addViews() {
        addSubview(headsOrTailsButton)
        addSubview(coinImageView)
    }
    
    func setConstraints() {
        coinImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(80)
            $0.trailing.equalToSuperview().offset(-80)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(coinImageView.snp.width)
        }
    }
    
    func animateFlip(_ view: UIImageView) {
        let flip = CATransition()
        flip.startProgress = 0.0
        flip.endProgress = 1.0
        flip.type = CATransitionType(rawValue: "flip")
        flip.subtype = CATransitionSubtype(rawValue: "fromRight")
        flip.duration = 0.18
        flip.repeatCount = 5
        view.layer.add(flip, forKey: "transition")
    }
        
    @objc func tossButton() {
        animateFlip(coinImageView)
        print("sdasd")
        let status = Bool.random()
        
        if status {
            coinImageView.image = UIImage(named: "heads")
        } else {
            coinImageView.image = UIImage(named: "tails")
        }
    }
}
