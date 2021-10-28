//
//  VideoTableHeaderView.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/10/28.
//

import UIKit

class VideoTableHeaderView: UIView {
    
    public var storyList: [Story] = []
    private var typeList: [String] = ["전체", "오늘", "이어서 시청하기", "시청하지 않음", "실시간", "게시물" ]
    
    
    private var storyCollectionView: UICollectionView!
    private var typeCollectionView: UICollectionView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initStoryCollectionView()
        initTypeCollectionView()
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initStoryCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let frame = self.frame
        storyCollectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        storyCollectionView.dataSource = self
        storyCollectionView.delegate = self
        storyCollectionView.backgroundColor = .white
        storyCollectionView.showsVerticalScrollIndicator = false
        storyCollectionView.showsHorizontalScrollIndicator = false
        storyCollectionView.register(cell: StoryCollectionViewCell.self)
    }
    
    private func initTypeCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let frame = self.frame
        typeCollectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        typeCollectionView.dataSource = self
        typeCollectionView.delegate = self
        typeCollectionView.backgroundColor = .white
        typeCollectionView.showsVerticalScrollIndicator = false
        typeCollectionView.showsHorizontalScrollIndicator = false
        typeCollectionView.register(cell: TypeCollectionViewCell.self)
    }
    
    public func updateData(storyList: [Story]) {
        self.storyList = storyList
    }
}

extension VideoTableHeaderView {
    private func setLayouts() {
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        addSubviews(storyCollectionView, typeCollectionView)
    }
    
    private func setConstraints() {
        storyCollectionView.snp.makeConstraints {
            $0.height.equalTo(104)
            $0.top.leading.trailing.equalToSuperview()
        }
        
        typeCollectionView.snp.makeConstraints {
            $0.height.equalTo(48)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
}

extension VideoTableHeaderView: UICollectionViewDelegate {

}

extension VideoTableHeaderView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case storyCollectionView:
            return storyList.count
        case typeCollectionView:
            return typeList.count
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case storyCollectionView:
            let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as StoryCollectionViewCell
            cell.updateData(story: storyList[indexPath.row])
            return cell
        case typeCollectionView:
            let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as TypeCollectionViewCell
            cell.updateData(text: typeList[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension VideoTableHeaderView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case storyCollectionView:
            return CGSize(width: 72, height: 104)
        case typeCollectionView:
            return CGSize(width: typeList[indexPath.item].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)]).width + 20, height: 48)
        default:
            return CGSize(width: 0, height: 0)
        }
       
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch collectionView {
        case storyCollectionView:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        case typeCollectionView:
            return UIEdgeInsets(top: 0, left: 9, bottom: 0, right: 0)
        default:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case storyCollectionView:
            return 0
        case typeCollectionView:
            return 9
        default:
            return 0
        }
    }
    
}
