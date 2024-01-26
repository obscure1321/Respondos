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
            image: UIImage(systemName: "eyes")!
        ),
        ViewModel(
            vc: HeadsOrTailsViewController(),
            title: nil,
            image: UIImage(systemName: "bitcoinsign.circle.fill")!
        ),
        ViewModel(
            vc: RandomizerViewController(),
            title: nil,
            image: UIImage(systemName: "cube.transparent.fill")!
        )]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC(viewModels: viewModels)
        changeRadiusOfTabbar()
        changeColor()
        addShadow()
//        drawBezier()
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
            
            return vc
        }
    }
    
    private  func changeRadiusOfTabbar(){
        self.tabBar.layer.masksToBounds = false
        self.tabBar.isTranslucent = true
        self.tabBar.layer.cornerRadius = 50
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    private func changeColor(){
        tabBar.backgroundColor = #colorLiteral(red: 0.005332739092, green: 0.1982556581, blue: 0.1359425783, alpha: 1)
        self.tabBar.unselectedItemTintColor = .gray
        self.tabBar.tintColor = .white
    }
    
    private func addShadow() {
        tabBar.layer.shadowColor = UIColor.white.cgColor
        tabBar.layer.shadowOpacity = 1
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -8)
        tabBar.layer.shadowRadius = 8
    }
}

extension TabBarViewController {
    struct ViewModel {
        var vc: UIViewController
        var title: String?
        var image: UIImage
    }
}
