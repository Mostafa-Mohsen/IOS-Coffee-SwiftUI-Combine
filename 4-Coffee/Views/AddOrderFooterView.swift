//
//  AddOrderFooterView.swift
//  4-Coffee
//
//  Created by User on 23/05/2023.
//

import SwiftUI

struct AddOrderFooterView: View {
    var price: String
    
    var body: some View {
        HStack {
            Spacer()
            
            Text(price)
                .font(.largeTitle)
                .foregroundColor(.green)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: 75)
    }
}

struct AddOrderFooterView_Previews: PreviewProvider {
    static var previews: some View {
        AddOrderFooterView(price: "0.0")
    }
}
