//
//  Reusable.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/10/27.
//

import Foundation

protocol Reusable: AnyObject {
  static var reuseIdentifier: String { get }
}

extension Reusable {
  static var reuseIdentifier: String {
    return String(describing: self)
  }
}
