//
//  Image.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/10/21.
//

import UIKit.UIImage

extension Const {
    enum Image {
        static let logo = UIImage(named: "logo")!
        
        /// TabBar Icon
        static let library_line = UIImage(named: "LibraryIcon")!
        static let library_filled = UIImage(named: "LibraryIconFill")!
        
        static let home_line = UIImage(named: "homeIcon")!
        static let home_filled = UIImage(named: "homeIconFill")!
        
        static let plus_circle_line = UIImage(named: "plueCircleIcon")!
        
        static let shorts_line = UIImage(named: "shortsIcon")!
        static let shorts_filled = UIImage(named: "shortsIconFill")!
        
        static let subscription_line = UIImage(named: "subscriptionsIcon")!
        static let subscription_filled = UIImage(named: "subscriptionsIconFill")!
        
        /// NavigationBar Icon
        static let premium_logo = UIImage(named: "premiumLogo")!
        static let search = UIImage(named: "SearchIcon")!
        static let notification = UIImage(named: "notificationIcon")!
        static let menu = UIImage(named: "moreMenuIcon")!
        static let sharing = UIImage(named: "windowSharingIcon")!
    }
}
