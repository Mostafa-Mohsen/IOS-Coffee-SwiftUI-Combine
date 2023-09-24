//
//  CoreNetwork.swift
//  4-Coffee
//
//  Created by User on 22/05/2023.
//

import Foundation
import Combine

class CoreNetwork {
    static let sharedInstance = CoreNetwork()
    private let webService: WebService
    
    private init() {
        self.webService = WebService()
    }
}

extension CoreNetwork {
    func getOrders() -> AnyPublisher<[OrderModel], NetwordError> {
        let requester = OrdersRequester(webService: webService)
        return requester.getOrders()
    }
    
    func addOrder(order: OrderModel) -> AnyPublisher<Bool, NetwordError> {
        let requester = OrdersRequester(webService: webService)
        return requester.addOrder(order: order)
    }
}
