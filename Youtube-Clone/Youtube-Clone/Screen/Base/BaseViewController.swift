//
//  BaseViewController.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/10/21.
//

import UIKit

import RxSwift

class BaseViewController: UIViewController {
    
    public let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        render()
    }
    
    private func render() {
        view.backgroundColor = .white
    }

}
