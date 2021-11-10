//
//  TabBarCoodinator.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/11/03.
//

import UIKit

protocol TabBarCoodinatorDelegate: AnyObject {
    func goToLoginViewController(_ coordinator: TabBarCoodinator)
}

class TabBarCoodinator: BaseCoodinator {
    var rootViewController: UIViewController {
        return self.presenter
    }
    
    var presenter: UINavigationController
    
    var childCoordinators: [Coordinator]

    weak var delegate: TabBarCoodinatorDelegate?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        self.childCoordinators = []
    }
    
    func start() {}

    func makeTabBar() -> TabBarController {
        let tabBarController = TabBarController()
        let vc = HomeViewController()
        vc.delegate = self

        let viewControllers = [vc, ShortsViewController(), AdditionViewController(), SubscriptionViewController(), LibraryViewController()]
        tabBarController.setViewControllers(viewControllers, animated: true)

        for (index, item) in viewControllers.enumerated() {
            item.tabBarItem.title = TabBarItem(rawValue: index)?.getTitle()
            item.tabBarItem.image = TabBarItem(rawValue: index)?.getImage()
            item.tabBarItem.selectedImage = TabBarItem(rawValue: index)?.getSelectedImage()
        }
        return tabBarController
    }
}

extension TabBarCoodinator: TabBarControllerDelegate {
    func profileButtonDidTapped(_ viewController: BaseViewController) {
        delegate?.goToLoginViewController(self)
    }

}
