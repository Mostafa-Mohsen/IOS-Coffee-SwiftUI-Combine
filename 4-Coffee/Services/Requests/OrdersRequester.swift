//
//  OrdersRequester.swift
//  4-Coffee
//
//  Created by User on 22/05/2023.
//

import Foundation
import Combine
import Alamofire

class OrdersRequester {
    let webService: WebService
    let url = "https://island-bramble.glitch.me/orders"
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    func getOrders() -> AnyPublisher<[OrderModel], NetwordError> {
        return webService.request(urlPath: url, params: nil, type: [OrderModel].self)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    func addOrder(order: OrderModel) -> AnyPublisher<Bool, NetwordError> {
        let params = RequestParameters(method: .post, parameters: order.dictRepresentation(), encoding: JSONEncoding.default, headers: nil)
        return webService.request(urlPath: url, params: params, type: addOrderResponse.self)
            .map { $0.success }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
