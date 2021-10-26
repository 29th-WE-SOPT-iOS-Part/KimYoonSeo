//
//  UIStackView+Extension.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/10/21.
//

import UIKit.UIStackView

extension UIStackView{
    func addArrangedSubviews(_ views:UIView...){
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
