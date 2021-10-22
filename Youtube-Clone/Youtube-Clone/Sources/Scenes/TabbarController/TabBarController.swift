//
//  TabBarController.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/10/22.
//

import UIKit
import RxSwift

enum TabBarItem: String {
    case home = "홈"
    case shorts = "Shorts"
    case addition = "추가"
    case subscription = "구독"
    case library = "보관함"
}

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarItems()
        setTabBarUI()
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let itemView = item.value(forKey: "view") as? UIView else { return }
        let itemAnimator = UIViewPropertyAnimator(duration: 0.1, dampingRatio: 0.5) {
            itemView.transform = CGAffineTransform.identity.scaledBy(x: 1.2, y: 1.2)
        }
        
        itemAnimator.addAnimations({itemView.transform = .identity },delayFactor: 0.5)
        itemAnimator.startAnimation()
   }
}

extension TabBarController {
    private func setTabBarItems() {
        let homeVC = HomeViewController()
        let shortsVC = ShortsViewController()
        let additionVC = AdditionViewController()
        let subscriptionVC = SubscriptionViewController()
        let libraryVC = LibraryViewController()
        
        homeVC.tabBarItem.title = TabBarItem.home.rawValue
        homeVC.tabBarItem.image = Const.Image.home_line
        homeVC.tabBarItem.selectedImage = Const.Image.home_filled
        
        shortsVC.tabBarItem.title = TabBarItem.shorts.rawValue
        shortsVC.tabBarItem.image = Const.Image.shorts_line
        shortsVC.tabBarItem.selectedImage = Const.Image.shorts_filled
        
        additionVC.tabBarItem.title = TabBarItem.addition.rawValue
        additionVC.tabBarItem.image = Const.Image.plus_circle_line
        additionVC.tabBarItem.selectedImage = Const.Image.plus_circle_line
        
        subscriptionVC.tabBarItem.title = TabBarItem.subscription.rawValue
        subscriptionVC.tabBarItem.image = Const.Image.subscription_line
        subscriptionVC.tabBarItem.selectedImage = Const.Image.subscription_filled
        
        libraryVC.tabBarItem.title = TabBarItem.library.rawValue
        libraryVC.tabBarItem.image = Const.Image.library_line
        libraryVC.tabBarItem.selectedImage = Const.Image.library_filled
        
        setViewControllers([homeVC, shortsVC, additionVC, subscriptionVC, libraryVC], animated: true)
    }
    
    private func setTabBarUI() {
        tabBar.tintColor = .Black
        tabBar.unselectedItemTintColor = .Black
        UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 12, weight: .regular)], for: .normal)
    }
}
