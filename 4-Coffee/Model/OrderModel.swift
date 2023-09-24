//
//  OrderModel.swift
//  4-Coffee
//
//  Created by User on 22/05/2023.
//

import Foundation

struct OrderModel: Codable {
    let name: String
    let coffeeName: String
    let total: Double
    let size: String
}

extension OrderModel {
    func dictRepresentation() -> [String: AnyObject] {
        let dict: [String: AnyObject] = [
            "name": name as AnyObject,
            "coffeeName": coffeeName as AnyObject,
            "total": total as AnyObject,
            "size": size as AnyObject
        ]
        return dict
    }
}
