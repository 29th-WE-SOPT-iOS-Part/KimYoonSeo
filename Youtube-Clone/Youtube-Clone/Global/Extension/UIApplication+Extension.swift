//
//  UIApplication+Extension.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/10/28.
//

import UIKit

extension UIApplication {
    var statusBarHeight: CGFloat {
        connectedScenes
            .compactMap {
                $0 as? UIWindowScene
            }
            .compactMap {
                $0.statusBarManager
            }
            .map {
                $0.statusBarFrame
            }
            .map(\.height)
            .max() ?? 0
    }
}

import UIKit

extension UIViewController {

    var topbarHeight: CGFloat {
           return UIApplication.shared.statusBarHeight + 44
//            (navigationController?.navigationBar.frame.height ?? 0.0)
       }
}
