//
//  UITextField+Extension.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/10/06.
//

import UIKit

extension UITextField {
    func addLeftPadding(with padding: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: self.frame.height))
        leftView = paddingView
        leftViewMode = ViewMode.always
    }
}
