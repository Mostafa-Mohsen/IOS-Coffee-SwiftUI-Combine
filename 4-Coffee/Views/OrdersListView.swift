//
//  OrdersListView.swift
//  4-Coffee
//
//  Created by User on 22/05/2023.
//

import SwiftUI

struct OrdersListView: View {
    var ordersList: [OrderViewModel]
    
    var body: some View {
        List {
            ForEach(ordersList, id: \.id) { order in
                HStack {
                    Image(order.coffeeName)
                        .resizable()
                        .frame(width: 150, height: 150)
                        .cornerRadius(16)
                        .padding([.top, .bottom], 10)
                    
                    VStack(alignment: .leading) {
                        Text(order.name)
                            .font(.title)
                        
                        Text(order.coffeeName)
                            .lineLimit(nil)
                            .font(.body)
                            .foregroundColor(.white)
                            .padding(.all)
                            .background(Color.gray)
                            .cornerRadius(16)
                        
                        Text(order.size)
                            .lineLimit(nil)
                            .font(.body)
                            .foregroundColor(.white)
                            .padding(.all)
                            .background(Color.green)
                            .cornerRadius(16)
                    }
                    .padding([.leading], 10)
                }
            }
        }
    }
}

struct OrdersListView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersListView(ordersList: [OrderViewModel(order: OrderModel(name: "James", coffeeName: "Hot Coffee", total: 26.5, size: "Small"))])
    }
}
