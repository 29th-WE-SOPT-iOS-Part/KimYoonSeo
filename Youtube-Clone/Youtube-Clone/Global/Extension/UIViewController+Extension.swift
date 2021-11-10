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
    
    func makeAlert(title : String,
                  message : String,
                  okAction : ((UIAlertAction) -> Void)? = nil,
                  completion : (() -> Void)? = nil) {

       let alertViewController = UIAlertController(title: title,
                                                   message: message,
                                                   preferredStyle: .alert)
       
       let okAction = UIAlertAction(title: "확인",
                                    style: .default,
                                    handler: okAction)

       alertViewController.addAction(okAction)
       self.present(alertViewController, animated: true, completion: completion)
   }
}
