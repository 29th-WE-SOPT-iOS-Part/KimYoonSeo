//
//  UIView+Extension.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/10/21.
//

import UIKit.UIView

extension UIView{
    func addSubviews(_ views:UIView...){
        for view in views {
            self.addSubview(view)
        }
    }
}
