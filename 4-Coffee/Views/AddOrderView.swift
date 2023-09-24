//
//  AddOrderView.swift
//  4-Coffee
//
//  Created by User on 23/05/2023.
//

import SwiftUI

struct AddOrderView: View {
    @Binding var isPresented: Bool
    @ObservedObject private var addOrderVM = AddOrderViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Information")) {
                        TextField("Enter Name", text: $addOrderVM.name)
                    }
                    
                    Section(header: Text("Select Coffee")) {
                        List(addOrderVM.coffeeList, id: \.coffeName) { coffee in
                            ZStack {
                                Button("") {
                                    selectCoffee(with: coffee.coffeName)
                                }
                                
                                HStack {
                                    Image(coffee.coffeName)
                                        .resizable()
                                        .frame(width: 75, height: 75)
                                        .cornerRadius(16)
                                    
                                    Text(coffee.coffeName)
                                        .font(.body)
                                    Spacer()
                                    Image(systemName: coffee.coffeName == addOrderVM.coffeeName ? "checkmark" : "")
                                }
                            }
                            
                        }
                    }
                    
                    Section(header: Text("Select Coffee"), footer: AddOrderFooterView(price: addOrderVM.totalPrice)) {
                        Picker(selection: $addOrderVM.size, label: Text("Select Coffee")) {
                            Text("Small").tag("small")
                            Text("Medium").tag("medium")
                            Text("Large").tag("large")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }
                
                HStack {
                    Button("Add Order", action: addOrder)
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding([.top, .bottom], 10)
                        .background(Color.blue)
                        .cornerRadius(16)
                        .disabled(addOrderVM.isAddOrderDisabled)
                }
                
            }
            .navigationTitle("Coffee")
        }
    }
    
    private func selectCoffee(with name: String) {
        addOrderVM.coffeeName = name
    }
    
    private func addOrder() {
        addOrderVM.addOrder()
        isPresented = false
    }
}

struct AddOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddOrderView(isPresented: .constant(true))
    }
}
