//
//  YesOrNoView.swift
//  Respondos
//
//  Created by Miras Maratov on 24.01.2024.
//

import UIKit
import AVFoundation

final class YesOrNoView: UIView {
    // MARK: - properties
    var player: AVAudioPlayer!
    
    private let vibroGenerator = UIImpactFeedbackGenerator(style: .soft)
    var yesOrNoButton = GeneralButton()
    
    var answerLabel: UILabel = {
        let element = UILabel()
        element.numberOfLines = 1
        element.textAlignment = .center
        element.text = NSLocalizedString("yesNoLabel", comment: "text on the main label in YesOrNoView")
        element.textColor = .customGreen
        element.font = UIFont.boldSystemFont(ofSize: 40)
        element.adjustsFontSizeToFitWidth = true
        element.minimumScaleFactor = 0.7
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    // MARK: - initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        addViews()
        setConstraints()
        setButton(view: self,
                  button: yesOrNoButton,
                  title: NSLocalizedString("answeButton", comment: "answer button title"),
                  bottom: 80,
                  side: 120)
        
        yesOrNoButton.addTarget(self, action: #selector(answerButton), for: .touchUpInside)
        vibroGenerator.prepare()
    }
    
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
}

// MARK: - extension for flow funcs
 extension YesOrNoView {
    func addViews() {
        addSubview(yesOrNoButton)
        addSubview(answerLabel)
    }
    
    func setConstraints() {
        answerLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "yesOrNoSound", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    @objc func answerButton() {
        vibroGenerator.impactOccurred()
        playSound()
        yesOrNoButton.isEnabled = false
        answerLabel.text = "♗"
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            let number = Int.random(in: 0 ... 100)
            
            if number % 2 == 0 {
                self.answerLabel.text = NSLocalizedString("yesLabel", comment: "label text when answer is Yes")
            } else {
                self.answerLabel.text = NSLocalizedString("noLabel", comment: "label text when answer is No")
            }
            
            self.yesOrNoButton.isEnabled = true
        }
    }
}
