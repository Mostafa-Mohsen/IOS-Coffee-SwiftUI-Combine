//
//  OrdersListViewModel.swift
//  4-Coffee
//
//  Created by User on 22/05/2023.
//

import Foundation
import SwiftUI
import Combine

class OrdersListViewModel: ObservableObject {
    @Published var ordersList: [OrderViewModel] = []
    @Published var error = ""
    private var cancellable: AnyCancellable?
    
    func getOrders() {
        cancellable = CoreNetwork.sharedInstance.getOrders()
            .catch { error -> AnyPublisher<[OrderModel], Never> in
                switch error {
                case .error(let message):
                    print(message)
                }
                return Just([]).eraseToAnyPublisher()
            }
            .sink() { list in
                self.ordersList = list.map { OrderViewModel(order: $0) }
            }
    }
}

struct OrderViewModel: Identifiable {
    private let order: OrderModel
    
    let id = UUID()
    var name: String {
        return order.name
    }
    var coffeeName: String {
        return order.coffeeName
    }
    var size: String {
        return order.size
    }
    
    init(order: OrderModel) {
        self.order = order
    }
}
