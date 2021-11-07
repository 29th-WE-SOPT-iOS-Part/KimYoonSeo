//
//  APIConstant.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/11/08.
//

enum APIConstants {
    static let baseURL = "https://asia-northeast3-we-sopt-29.cloudfunctions.net/api/"
    enum User {
        private static let userURL = baseURL + "user"
        static let loginURL = userURL + "/login"
        static let signUpURL = userURL + "/signUp"
    }
}
