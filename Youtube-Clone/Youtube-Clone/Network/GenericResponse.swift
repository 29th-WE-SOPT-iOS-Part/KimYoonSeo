//
//  GenericResponse.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/11/08.
//

struct GenericResponse<T: Codable>: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: T?
}
