//
//  HomeViewController.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/10/22.
//

import UIKit

import SnapKit
import Then

protocol TabBarControllerDelegate: AnyObject {
    func profileButtonDidTapped(_ viewController: BaseViewController)
}

class HomeViewController: BaseViewController {
    
// MARK:- Properties
    weak var delegate: TabBarControllerDelegate?

    private var headerView = VideoTableHeaderView()
    
    private lazy var tableView = UITableView().then {
        $0.registerReusableCell(VideoTableViewCell.self)
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = 300
        $0.contentInset.top = headerViewHeight
        $0.setContentOffset(CGPoint(x: 0, y: -headerViewHeight), animated: false)
    }
    
    private let headerViewHeight: CGFloat = 152
    
    private var viedoList: [Video] = []

// MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayouts()
        setDelegation()
        updateData()
        registerNotificationCenter()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
// MARK:- Private Function
    private func setDelegation() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func updateData() {
        let videoList = VideoListModel()
        self.viedoList = videoList.getVideoListModel()
        
        let storyList = StoryListModel()
        headerView.updateData(storyList: storyList.getStoryListModel())
    }

    private func registerNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(goToLoginViewController(_:)), name: .touchProfileButton, object: nil)
    }
}

extension HomeViewController {
    @objc
    private func goToLoginViewController(_ notification: Notification) {
        delegate?.profileButtonDidTapped(self)
    }
}

extension HomeViewController: VideoTableViewCellDelegate {
    func previewImageViewDidTapped(_ videoTableViewCell: UITableViewCell, video: Video) {
        let vc = VideoViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.updateData(data: video)
        present(vc, animated: true, completion: nil)
    }
}


// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > -headerViewHeight && scrollView.contentOffset.y < 0 {
            headerView.isHidden = false
            headerView.snp.updateConstraints {
                $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(-scrollView.contentOffset.y-headerViewHeight)
            }
        } else if  scrollView.contentOffset.y <= -headerViewHeight {
            headerView.isHidden = false
            headerView.snp.updateConstraints {
                $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            }
        } else {
            headerView.isHidden = true
        }
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
       if scrollView.panGestureRecognizer.translation(in: scrollView).y < 0 {
          navigationController?.setNavigationBarHidden(true, animated: true)
       } else {
          navigationController?.setNavigationBarHidden(false, animated: true)
       }
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viedoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(indexPath: indexPath) as VideoTableViewCell
        cell.updateData(data: viedoList[indexPath.row])
        cell.delegate = self
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
            $0.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }

        headerView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(headerViewHeight)
        }
    }
}
