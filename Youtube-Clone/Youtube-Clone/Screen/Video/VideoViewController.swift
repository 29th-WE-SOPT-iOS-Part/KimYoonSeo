//
//  VideoViewController.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/12/18.
//

import UIKit

class VideoViewController: BaseViewController {
    
    private let previewImageView = UIImageView()
    
    private let profileImageView = UIImageView().then {
        $0.layer.cornerRadius = 18
        $0.clipsToBounds = true
    }
    
    private let titleLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: 15, weight: .regular)
        $0.textColor = Const.Color.black
    }
    
    private let subtitleLabel = UILabel().then {
        $0.numberOfLines = 1
        $0.font = .systemFont(ofSize: 13, weight: .regular)
        $0.textColor = Const.Color.gray
    }
    
    private let moreButton = UIButton().then {
        $0.setImage(Const.Image.menu, for: .normal)
    }
    
    private lazy var dismissButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        $0.tintColor = .white
        $0.addTarget(self, action: #selector(buttonDidTapped), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayouts()
    }
    
    public func updateData(data: Video) {
        titleLabel.text = data.title
        previewImageView.image = UIImage(named: data.preview)
        profileImageView.image = UIImage(named: data.profile)
        subtitleLabel.text = data.subtitle
    }
    
    @objc
    private func buttonDidTapped() {
        dismiss(animated: true, completion: nil)
    }
}

extension VideoViewController {
    private func setLayouts() {
        setViewHiearachy()
        setConstraints()
    }
    
    private func setViewHiearachy() {
        view.addSubviews(previewImageView, profileImageView, titleLabel, subtitleLabel, moreButton, dismissButton)
    }
    
    private func setConstraints() {
        
        dismissButton.snp.makeConstraints {
            $0.top.leading.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
        
        previewImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(previewImageView.snp.width).multipliedBy(0.56)
        }
        
        profileImageView.snp.makeConstraints {
            $0.width.height.equalTo(36)
            $0.top.equalTo(previewImageView.snp.bottom).offset(12)
            $0.leading.equalToSuperview().inset(12)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(previewImageView.snp.bottom).offset(12)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(12)
            $0.trailing.equalTo(moreButton.snp.leading).inset(20)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
        
        moreButton.snp.makeConstraints{
            $0.top.equalTo(previewImageView.snp.bottom).offset(7)
            $0.trailing.equalToSuperview()
            $0.width.height.equalTo(26)
        }
    }
}

