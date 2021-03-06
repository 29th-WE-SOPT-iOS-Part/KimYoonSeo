//
//  StoryCollectionViewCell.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/10/28.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
// MARK: - Properties
    private lazy var imageView = UIImageView().then {
        $0.layer.cornerRadius = 29
        $0.clipsToBounds = true
        $0.backgroundColor = .black
    }
    
    private let label = UILabel().then {
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.textColor = Const.Color.gray
    }
    
// MARK: - View Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image  = nil
        label.text = nil
    }
    
// MARK: - Public Functions
    public func updateData(story: Story) {
        imageView.image = UIImage(named: story.image)
        label.text = story.text
    }
}

// MARK: - Layout
extension StoryCollectionViewCell {
    private func setLayouts() {
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        contentView.addSubviews(imageView, label)
    }
    
    private func setConstraints() {
        imageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(58)
            $0.top.equalToSuperview().offset(14)
        }
        
        label.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(7)
            $0.top.equalTo(imageView.snp.bottom).offset(5)
        }
    }
}
