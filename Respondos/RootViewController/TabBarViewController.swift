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
            title: "Yes/No",
            image: UIImage(systemName: "eyes.inverse")!,
            selectedImage: UIImage(systemName: "eyes")!
        ),
        ViewModel(
            vc: ProsNConsViewController(),
            title: "Pros&Cons",
            image: UIImage(systemName: "bitcoinsign.circle")!,
            selectedImage: UIImage(systemName: "bitcoinsign.circle.fill")!
        ),
        ViewModel(
            vc: RandomizerViewController(),
            title: "Randomizer",
            image: UIImage(systemName: "cube.transparent")!,
            selectedImage: UIImage(systemName: "cube.transparent.fill")!
        )]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC(viewModels: viewModels)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewControllers = vcArray
        self.selectedIndex = 1
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
}

extension TabBarViewController {
    struct ViewModel {
        var vc: UIViewController
        var title: String
        var image: UIImage
        var selectedImage: UIImage
    }
}
