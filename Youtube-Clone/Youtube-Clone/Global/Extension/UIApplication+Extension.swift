//
//  UIApplication+Extension.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/10/28.
//

import UIKit.UIApplication

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


