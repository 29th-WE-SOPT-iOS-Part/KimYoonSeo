//
//  GoogleButton.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/10/06.
//

import UIKit

class GoogleButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        makeButton()
    }
    
    private func makeButton() {
        backgroundColor = .Blue
        tintColor = .white
        clipsToBounds = true
        layer.cornerRadius = 10
    }

}
