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
    
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayouts()
        setDelegation()
    }
    
    private func setDelegation() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension HomeViewController: UITableViewDelegate {
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
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
