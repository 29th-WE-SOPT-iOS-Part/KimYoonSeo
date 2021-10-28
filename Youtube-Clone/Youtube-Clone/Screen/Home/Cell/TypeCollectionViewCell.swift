//
//  TypeCollectionViewCell.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/10/29.
//

import UIKit

class TypeCollectionViewCell: UICollectionViewCell {
    
    private lazy var button = UIButton().then {
        $0.layer.cornerRadius = 16
        $0.layer.borderWidth = 0.5
        $0.layer.borderColor = Const.Color.gray.cgColor
        $0.clipsToBounds = true
        $0.setBackgroundColor(Const.Color.lightGray, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        $0.setTitleColor(Const.Color.black, for: .normal)
        $0.addTarget(self, action: #selector(buttonDidTapped), for: .touchUpInside)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func updateData(text: String) {
        button.setTitle("   \(text)   ", for: .normal)
    }
}

// MARK: - @objc Functions
extension TypeCollectionViewCell {
    @objc
    private func buttonDidTapped() {
        button.isSelected.toggle()
    }
}

// MARK: - Layout
extension TypeCollectionViewCell {
    private func setLayouts() {
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        contentView.addSubviews(button)
    }
    
    private func setConstraints() {
        button.snp.makeConstraints {
            $0.height.equalTo(32)
            $0.center.equalToSuperview()
        }
    }
}
