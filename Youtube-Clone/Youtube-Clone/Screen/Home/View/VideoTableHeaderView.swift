//
//  VideoTableHeaderView.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/10/28.
//

import UIKit

class VideoTableHeaderView: UIView {
    
    private var collectionView: UICollectionView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initConllectionView()
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initConllectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let frame = self.frame
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(cell: StoryCollectionViewCell.self)
    }
}

extension VideoTableHeaderView {
    private func setLayouts() {
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        addSubviews(collectionView)
    }
    
    private func setConstraints() {
        collectionView.snp.makeConstraints {
            $0.height.equalTo(104)
            $0.leading.trailing.equalToSuperview()
        }
    }
}

extension VideoTableHeaderView: UICollectionViewDelegate {
    
}

extension VideoTableHeaderView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as StoryCollectionViewCell
        cell.updateData(image: "wesoptiOSPartProfile", text: "iOS짱")
        return cell
    }
    
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension VideoTableHeaderView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 72, height: 104)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
