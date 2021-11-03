//
//  Coordinator.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/11/03.
//

import UIKit

protocol Coordinator: AnyObject {
    var presenter: UINavigationController { get set }
    var childCoordinators: [Coordinator] {get set}

    func start()
}

extension Coordinator {
    public func addChildCoordinator(_ childCoordinator: Coordinator) {
        self.childCoordinators.append(childCoordinator)
    }

    public func removeChildCoordinator(_ childCoordinator: Coordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== childCoordinator }
    }
    
}


public protocol RootViewControllerProvider: AnyObject {
    var rootViewController: UIViewController { get }
}

typealias BaseCoodinator = Coordinator & RootViewControllerProvider
