//
//  ContentView.swift
//  4-Coffee
//
//  Created by User on 21/05/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var orderListVM = OrdersListViewModel()
    @State var isPresented = false
    
    var body: some View {
        NavigationView {
            OrdersListView(ordersList: orderListVM.ordersList)
                .navigationTitle("Coffee")
                .navigationBarItems(leading: Button(action: refreshView) {
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(.white)
                }, trailing: Button(action: showAddOrderView) {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                })
                .sheet(isPresented: $isPresented) {
                    AddOrderView(isPresented: $isPresented)
                }
        }
    }
    
    private func refreshView() {
        orderListVM.getOrders()
    }
      
    private func showAddOrderView() {
        isPresented = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
