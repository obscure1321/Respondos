//
//  TabBarViewController.swift
//  Respondos
//
//  Created by Miras Maratov on 24.01.2024.
//

import UIKit

final class TabBarViewController: UITabBarController {
    var vcArray: [UIViewController]?
    var viewModels = [
        ViewModel(
            vc: YesOrNoViewController(),
            title: nil,
            image: UIImage(systemName: "eyes.inverse")!,
            selectedImage: UIImage(systemName: "eyes")!
        ),
        ViewModel(
            vc: ProsNConsViewController(),
            title: nil,
            image: UIImage(systemName: "bitcoinsign.circle")!,
            selectedImage: UIImage(systemName: "bitcoinsign.circle.fill")!
        ),
        ViewModel(
            vc: RandomizerViewController(),
            title: nil,
            image: UIImage(systemName: "cube.transparent")!,
            selectedImage: UIImage(systemName: "cube.transparent.fill")!
        )]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC(viewModels: viewModels)
        drawBezier()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewControllers = vcArray
        self.selectedIndex = 1
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}

private extension TabBarViewController {
    private func configureVC(viewModels: [ViewModel]) {
        vcArray = viewModels.map { viewModel in
            let vc = viewModel.vc
            
            vc.tabBarItem.title = viewModel.title
            vc.tabBarItem.image = viewModel.image
            vc.tabBarItem.selectedImage = viewModel.selectedImage
            
            return vc
        }
    }
    
    private func drawBezier() {
        let roundLayer = CAShapeLayer()
        
        let xPos: CGFloat = 24
        let yPos: CGFloat = -8
        let width = tabBar.frame.width - xPos * 2
        let height = tabBar.frame.height + 5
        
        let bezierPath = UIBezierPath(roundedRect: CGRect(
            x: xPos,
            y: yPos,
            width: width,
            height: height),
            cornerRadius: 24)
        
        roundLayer.path = bezierPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemPositioning = .centered
        tabBar.itemWidth = 80
        
        roundLayer.fillColor = UIColor.darkGray.cgColor
        roundLayer.shadowColor = UIColor.green.cgColor
        roundLayer.shadowOpacity = 1
        roundLayer.shadowOffset = CGSize(width: 0, height: 0)
        roundLayer.shadowRadius = 8
    }
}

extension TabBarViewController {
    struct ViewModel {
        var vc: UIViewController
        var title: String?
        var image: UIImage
        var selectedImage: UIImage
    }
}
