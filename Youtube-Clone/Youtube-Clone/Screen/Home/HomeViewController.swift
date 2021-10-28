//
//  HomeViewController.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/10/22.
//

import UIKit

import SnapKit
import Then

class HomeViewController: BaseViewController {
    
    private lazy var headerView = VideoTableHeaderView()
    
    private lazy var tableView = UITableView().then {
        $0.registerReusableCell(VideoTableViewCell.self)
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = 300
        $0.contentInset.top = headerViewHeight
        $0.setContentOffset(CGPoint(x: 0, y: -headerViewHeight), animated: false)
    }
    
    private let headerViewHeight: CGFloat = 104
    
    private var viedoList: [Video] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayouts()
        setDelegation()
        updateData()
    }
    
    private func setDelegation() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func updateData() {
        let videoList = VideoListModel()
        self.viedoList = videoList.getVideoListModel()
        
        let storyList = StoryListModel()
        headerView.storyList = storyList.getVideoListModel()
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        if scrollView.contentOffset.y > -(topbarHeight+headerViewHeight) && scrollView.contentOffset.y < 0 {
            headerView.isHidden = false
            headerView.snp.updateConstraints {
                $0.top.equalToSuperview().offset(-scrollView.contentOffset.y-headerViewHeight)
            }
        } else if  scrollView.contentOffset.y <= -(topbarHeight+headerViewHeight) {
            headerView.isHidden = false
            headerView.snp.updateConstraints {
                $0.top.equalToSuperview().offset(self.topbarHeight)
            }
        } else {
            headerView.isHidden = true
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viedoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(indexPath: indexPath) as VideoTableViewCell
        cell.updateData(data: viedoList[indexPath.row])
        return cell
    }
    
}


// MARK: - Layout
extension HomeViewController {
    private func setLayouts() {
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        view.addSubviews(tableView, headerView)
    }
    
    private func setConstraints() {
        tableView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.bottom.equalToSuperview()
        }

        headerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(self.topbarHeight)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(headerViewHeight)
        }
    }
}
