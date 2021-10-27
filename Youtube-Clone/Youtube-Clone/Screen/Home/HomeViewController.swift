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
    
    private lazy var tableView = UITableView().then {
        $0.delegate = self
        $0.dataSource = self
        $0.registerReusableCell(VideoTableViewCell.self)
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = 300
    }
    
    private var viedoList: [Video] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayouts()
        updateData()
    }
    
    private func updateData() {
        let list = VideoListModel()
        self.viedoList = list.getVideoListModel()
    }
}

extension HomeViewController: UITableViewDelegate {
    
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
        setViewHiearachy()
        setConstraints()
    }
    
    private func setViewHiearachy() {
        view.addSubviews(tableView)
    }
    
    private func setConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
