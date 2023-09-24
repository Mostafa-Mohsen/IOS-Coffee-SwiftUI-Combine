//
//  AddOrderViewModel.swift
//  4-Coffee
//
//  Created by User on 23/05/2023.
//

import Foundation
import SwiftUI
import Combine

class AddOrderViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var coffeeName: String = ""
    @Published var size = "small"
    var isAddOrderDisabled: Bool {
        return name.isEmpty || coffeeName.isEmpty
    }
    
    var coffeeList = CoffeeViewModel.coffeeList()
    private var cancellable: AnyCancellable?
    
    var totalPrice: String {
        return String(format: "%.2f", calculatePriceForSize())
    }
    
    private var sizePrice: Double {
        let price = ["small": 1.0, "medium": 1.5, "large": 2.0]
        return price[size] ?? 0.0
    }
    
    private func calculatePriceForSize() -> Double {
        guard let coffee = coffeeList.first(where: { $0.coffeName == coffeeName }) else { return 0.0 }
        return coffee.price * sizePrice
    }
    
    func addOrder() {
        let order = OrderModel(name: name, coffeeName: coffeeName, total: calculatePriceForSize(), size: size)
        cancellable = CoreNetwork.sharedInstance.addOrder(order: order)
            .catch { error -> AnyPublisher<Bool, Never> in
                return (Just(false)).eraseToAnyPublisher()
            }
            .sink() { value in
                
            }
    }
    
}
