//
//  GoogleButton.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/10/06.
//

import UIKit

enum GoogleButtonType {
    case filled
    case clear
}

class GoogleButton: UIButton {
    
    override var isHighlighted: Bool {
        didSet {
            switch type {
            case .filled:
                setBackgroundColor(isHighlighted ? Const.Color.blue.withAlphaComponent(0.7) : Const.Color.blue, for: .normal )
            case .clear:
                setTitleColor(isHighlighted ? Const.Color.blue : Const.Color.blue.withAlphaComponent(0.7), for: .normal)
            case .none:
                break
            }
        }
    }
    
    private var type: GoogleButtonType?
    
    convenience init(type: GoogleButtonType = .filled) {
        self.init(frame: CGRect.zero)
        self.type = type
        makeButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func makeButton() {
        adjustsImageWhenHighlighted = false
        titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        
        switch type {
        case .filled:
            setBackgroundColor(Const.Color.blue, for: .normal)
            setBackgroundColor(Const.Color.lightGray, for: .disabled)
            setTitleColor(Const.Color.white, for: [.normal, .disabled])
            tintColor = .white
            
        case .clear:
            setTitleColor(Const.Color.blue, for: .normal)
            
        case .none:
            break
        }
        
        clipsToBounds = true
        layer.cornerRadius = 10
        
        self.snp.makeConstraints {
            $0.height.equalTo(42)
        }
    }

}
