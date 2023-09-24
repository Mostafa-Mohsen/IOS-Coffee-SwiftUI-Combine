//
//  WebService.swift
//  4-Coffee
//
//  Created by User on 22/05/2023.
//

import Foundation
import Alamofire
import Combine

struct RequestParameters {
    let method: HTTPMethod
    let parameters: Parameters?
    let encoding: ParameterEncoding
    let headers: HTTPHeaders?
}

enum NetwordError: Error {
    case error(message: String)
}

class WebService {
    
    func request<T: Decodable>(urlPath: String, params: RequestParameters? = nil, type: T.Type) -> AnyPublisher<T, NetwordError> {
        return Future<T, NetwordError> { promise in
            guard let url = URL(string: urlPath) else {
                promise(.failure(NetwordError.error(message: "Invalid url")))
                return
            }
            let request = AF.request(url,
                       method: params?.method ?? .get,
                       parameters: params?.parameters,
                       encoding: params?.encoding ?? URLEncoding.default,
                       headers: params?.headers)
            request.validate()
            request.responseDecodable(of: T.self) { response in
                    switch response.result {
                        case .success(let json):
                        promise(.success(json))

                        case .failure(let error):
                            var errorString: String?
                            if let data = response.data {
                                if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: String] {
                                    errorString = json["error"]
                                }
                            }
                        promise(.failure(NetwordError.error(message: errorString ?? error.localizedDescription)))
                    }
                            
                }
        }.eraseToAnyPublisher()
    }
}
