//
//  TabBarController.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/10/22.
//

import UIKit

class TabBarController: UITabBarController {
    
// MARK: - View Life Cycle
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

// MARK: - set TabBar
extension TabBarController {
    private func setTabBarItems() {
        let viewControllers = [HomeViewController(), ShortsViewController(), AdditionViewController(), SubscriptionViewController(), LibraryViewController()]
        setViewControllers(viewControllers, animated: true)
        
        for (index, item) in viewControllers.enumerated() {
            item.tabBarItem.title = TabBarItem(rawValue: index)?.getTitle()
            item.tabBarItem.image = TabBarItem(rawValue: index)?.getImage()
            item.tabBarItem.selectedImage = TabBarItem(rawValue: index)?.getSelectedImage()
        }
    }
    
    private func setTabBarUI() {
        tabBar.tintColor = .Black
        tabBar.unselectedItemTintColor = .Black
        UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 12, weight: .regular)], for: .normal)
    }
}
