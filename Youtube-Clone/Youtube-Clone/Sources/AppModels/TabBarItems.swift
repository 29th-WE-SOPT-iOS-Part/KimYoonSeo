//
//  TabBarItems.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/10/22.
//

import UIKit

/// tabBarItem
enum TabBarItem: Int {
    case home = 0
    case shorts
    case addition
    case subscription
    case library
    
    func getTitle() -> String? {
        switch self {
        case .home:
            return "홈"
        case .shorts:
            return "Shorts"
        case .addition:
            return "추가"
        case .subscription:
            return "구독"
        case .library:
            return "보관함"
        }
    }
    
    func getImage() -> UIImage {
        switch self {
        case .home:
            return Const.Image.home_line
        case .shorts:
            return Const.Image.shorts_line
        case .addition:
            return Const.Image.plus_circle_line
        case .subscription:
            return Const.Image.subscription_line
        case .library:
            return Const.Image.library_line
        }
    }
    
    func getSelectedImage() -> UIImage {
        switch self {
        case .home:
            return Const.Image.home_filled
        case .shorts:
            return Const.Image.shorts_filled
        case .addition:
            return Const.Image.plus_circle_line
        case .subscription:
            return Const.Image.subscription_filled
        case .library:
            return Const.Image.library_filled
        }
    }
}
