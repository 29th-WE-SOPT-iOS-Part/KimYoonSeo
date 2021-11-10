//
//  UserService.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/11/08.
//

import RxSwift

struct UserService{
    static let shared = UserService()
    
    func login(email : String,
               password : String) -> Observable<NetworkResult<Any>>{

        dump(email)
        dump(password)
        guard let urlRequest = APIClient.shared.makeRequest(
                url: APIConstants.User.loginURL,
                method: .post,
                parameters: [
                    "email" : email,
                    "password" : password
                ],
                encodingType: APIClientEncodingType.JSONEncodingDefault)
        else { return .error(APIClientError.makeRequestFailed) }

        return APIClient.shared.request(urlRequest: urlRequest, UserVO.self)
    }
    
    func signUp(email : String,
                password : String,
                name: String) -> Observable<NetworkResult<Any>>{

        guard let urlRequest = APIClient.shared.makeRequest(
                url: APIConstants.User.signUpURL,
                method: .post,
                parameters: ["email" : email,
                             "password" : password,
                             "name": name
                ],
                encodingType: APIClientEncodingType.JSONEncodingDefault) else {return .error(APIClientError.makeRequestFailed)}
        
        return APIClient.shared.request(urlRequest: urlRequest, UserVO.self)
    }
    
}
