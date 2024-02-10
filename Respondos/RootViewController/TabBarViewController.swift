//
//  TabBarViewController.swift
//  Respondos
//
//  Created by Miras Maratov on 24.01.2024.
//

import UIKit

final class TabBarViewController: UITabBarController {
    // MARK: - properties
    var vcArray: [UIViewController]?
    var viewModels = [
        ViewModel(
            vc: YesOrNoViewController(),
            image: UIImage(systemName: "eyes")!
        ),
        ViewModel(
            vc: HeadsOrTailsViewController(),
            image: UIImage(systemName: "bitcoinsign.circle.fill")!
        ),
        ViewModel(
            vc: RandomizerViewController(),
            image: UIImage(systemName: "cube.transparent.fill")!
        )]
    
    // MARK: - lifecycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC(viewModels: viewModels)
        changeColor()
        addShadow()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewControllers = vcArray
        self.selectedIndex = 1
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        changeRadiusOfTabbar()
        changeHeightOfTabbar()
    }
}

// MARK: - extesnion for flow funcs
private extension TabBarViewController {
    private func configureVC(viewModels: [ViewModel]) {
        vcArray = viewModels.map { viewModel in
            let vc = viewModel.vc
            
            vc.tabBarItem.image = viewModel.image
            
            return vc
        }
    }
    
    private  func changeRadiusOfTabbar(){
        self.tabBar.layer.masksToBounds = false
        self.tabBar.isTranslucent = true
        // checking device and setting corner raidus only for buttonless iPhones
        if UIDevice().userInterfaceIdiom == .phone {
            if let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow }),
               keyWindow.safeAreaInsets.bottom > 0 {
                self.tabBar.layer.cornerRadius = 50
                self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            }
        }
    }
    
    private func changeColor(){
        tabBar.backgroundColor = .customGreen
        self.tabBar.unselectedItemTintColor = .gray
        self.tabBar.tintColor = .white
    }
    
    private func addShadow() {
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 1
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 8
    }
    
    private func changeHeightOfTabbar(){
        if UIDevice().userInterfaceIdiom == .phone {
            if let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow }),
               keyWindow.safeAreaInsets.bottom > 0 {
                var tabFrame = tabBar.frame
                tabFrame.size.height = 100
                tabFrame.origin.y = view.frame.size.height - 100
                tabBar.frame = tabFrame
            }
        }
    }
    
    private func simpleAnnimationWhenSelectItem(_ item: UITabBarItem){
        guard let barItemView = item.value(forKey: "view") as? UIView else { return }
        
        let timeInterval: TimeInterval = 0.4
        let propertyAnimator = UIViewPropertyAnimator(duration: timeInterval, dampingRatio: 0.5) {
            barItemView.transform = CGAffineTransform.identity.scaledBy(x: 1.5, y: 1.5)
        }
        propertyAnimator.addAnimations({ barItemView.transform = .identity }, delayFactor: CGFloat(timeInterval))
        propertyAnimator.startAnimation()
    }
}

// MARK: - extension for delegate method
extension TabBarViewController {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.simpleAnnimationWhenSelectItem(item)
    }
}

// MARK: - extension for viewModel
extension TabBarViewController {
    struct ViewModel {
        var vc: UIViewController
        var image: UIImage
    }
}
