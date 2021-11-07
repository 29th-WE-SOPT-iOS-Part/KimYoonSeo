//
//  NetworkResult.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/11/08.
//

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case serverErr
    case networkFail
    case pathErr
}


