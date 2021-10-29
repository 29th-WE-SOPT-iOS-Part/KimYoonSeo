//
//  UIViewController+Extension.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/10/29.
//

import UIKit.UIViewController

extension UIViewController {

    var topbarHeight: CGFloat {
           return UIApplication.shared.statusBarHeight + (navigationController?.navigationBar.frame.height ?? 0.0)
       }
}
