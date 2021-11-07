//
//  APIService.swift
//  Youtube-Clone
//
//  Created by 김윤서 on 2021/11/08.
//

import Foundation

import Alamofire
import RxSwift

enum APIClientError: Error {
    case makeRequestFailed
}

enum APIClientEncodingType {
    case JSONEncodingDefault
    
    func encoding() -> ParameterEncoding{
        switch self {
        case .JSONEncodingDefault:
            return JSONEncoding.default
        }
    }
}

final class APIClient {
    static let shared = APIClient()
    
    public func makeRequest(_ url: URLConvertible, method: Alamofire.HTTPMethod, parameters: Parameters? = nil, encodingType: APIClientEncodingType, headers: HTTPHeaders? = nil) -> URLRequest? {
        var urlRequest: URLRequest
        do {
            urlRequest = try URLRequest(url: url.asURL(), cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
            urlRequest.httpMethod = method.rawValue
            
            urlRequest = try encodingType.encoding().encode(urlRequest, with: parameters)
            return urlRequest
        } catch {
            print("make request failed")
            return nil
        }
    }
    
    public func request<T: Codable>(urlRequest: URLRequest, _ responseType: T.Type) -> Observable<NetworkResult<Any>>{
        var dataRequest = urlRequest
        dataRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return Observable<NetworkResult<Any>>.create { observer in
               let request = AF.request(dataRequest)
                .responseData { response in
                    switch response.result {
                    case .success:
                        guard let statusCode = response.response?.statusCode else {return}
                        guard let value = response.value else {return}
                        let networkResult = self.judgeStatus(by: statusCode, value, T.self)
                        
                        observer.onNext(networkResult)
                        
                    case .failure(let err):
                        observer.onError(err)
                    }
                    
                    observer.onCompleted()
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
    
    private func judgeStatus<T: Codable>(by statusCode: Int, _ data: Data, _ responseType: T.Type) -> NetworkResult<Any> {

        let decoder = JSONDecoder()

        guard let decodedData = try? decoder.decode(GenericResponse<T>.self, from: data)
        else {
            return .pathErr
        }

        switch statusCode {

        case 200: return .success(decodedData.data as Any)
        case 400: return .requestErr(decodedData.message)
        case 500: return .serverErr
        default: return .networkFail
        }
    }

}
