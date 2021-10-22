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
                setBackgroundColor(isHighlighted ? .Blue.withAlphaComponent(0.7) : .Blue, for: .normal )
            case .clear:
                setTitleColor(isHighlighted ? .Blue : .Blue.withAlphaComponent(0.7), for: .normal)
            case .none:
                break
            }
        }
    }
    
    private var type: GoogleButtonType?
    
    init(type: GoogleButtonType = .filled){
        super.init(frame: CGRect.zero)
        self.type = type
        makeButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func makeButton() {
        adjustsImageWhenHighlighted = false
        titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        
        switch type {
        case .filled:
            setBackgroundColor(.Blue, for: .normal)
            setBackgroundColor(.LightGray, for: .disabled)
            setTitleColor(.White, for: [.normal, .disabled])
            tintColor = .white
            
        case .clear:
            setTitleColor(.Blue, for: .normal)
            
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
