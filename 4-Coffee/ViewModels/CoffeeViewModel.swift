//
//  CoffeeViewModel.swift
//  4-Coffee
//
//  Created by User on 23/05/2023.
//

import Foundation

struct CoffeeViewModel {
    let coffeName: String
    let price: Double
    
    static func coffeeList() -> [CoffeeViewModel] {
        return [
            CoffeeViewModel(coffeName: "Expresso", price: 5.0),
            CoffeeViewModel(coffeName: "Frapachino", price: 6.0),
            CoffeeViewModel(coffeName: "Hot Coffee", price: 7.0)
        ]
    }
}
