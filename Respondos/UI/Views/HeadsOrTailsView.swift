//
//  HeadsOrTailsView.swift
//  Respondos
//
//  Created by Miras Maratov on 24.01.2024.
//

import UIKit
import AVFoundation
import SnapKit

final class HeadsOrTailsView: UIView {
    // MARK: - properties
    private var player: AVAudioPlayer!
    
    private let vibroGenerator = UIImpactFeedbackGenerator(style: .soft)
    private var headsOrTailsButton = GeneralButton()
    
    var coinLabel: UILabel = {
        let element = UILabel()
        element.numberOfLines = 1
        element.textAlignment = .center
        element.text = "H E A D S"
        element.textColor = .customGreen
        element.font = UIFont.boldSystemFont(ofSize: 24)
        element.adjustsFontSizeToFitWidth = true
        element.minimumScaleFactor = 0.7
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private var coinImageView: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleToFill
        element.clipsToBounds = true
        element.backgroundColor = .clear
        element.image = UIImage(named: "heads")
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    // MARK: - initialization
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
        vibroGenerator.prepare()
    }
    
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
}

// MARK: - extension for flow funcs
private extension HeadsOrTailsView {
    func addViews() {
        addSubview(headsOrTailsButton)
        addSubview(coinImageView)
        addSubview(coinLabel)
    }
    
    func setConstraints() {
        coinLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(40)
            $0.trailing.equalToSuperview().offset(-40)
            $0.top.greaterThanOrEqualTo(safeAreaLayoutGuide).offset(80)
            $0.bottom.equalTo(coinImageView.snp.top).offset(-40)
        }
        
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
        flip.duration = 0.1
        flip.repeatCount = 12
        view.layer.add(flip, forKey: "transition")
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "coinSound", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
        
    @objc func tossButton() {
        playSound()
        vibroGenerator.impactOccurred()
        headsOrTailsButton.isEnabled = false
        animateFlip(coinImageView)
        coinLabel.text = "♗♗♗"
        
        let status = Int.random(in: 0 ... 100)
        
        if status % 2 == 0 {
            coinImageView.image = UIImage(named: "heads")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                self.coinLabel.text = "H E A D S"
                self.headsOrTailsButton.isEnabled = true
            }
        } else {
            coinImageView.image = UIImage(named: "tails")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                self.coinLabel.text = "T A I L S"
                self.headsOrTailsButton.isEnabled = true
            }
        }
    }
}
