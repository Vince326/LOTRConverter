//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Vincent Hunter on 2/18/25.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            //Parchment Backgorund Image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea(.all)
                .background(.brown)
            VStack {
                //Text
                Text("Select the currency you're starting with:")
                    .fontWeight(.bold)
                    
                //Currency Icons
                LazyVGrid(columns:[GridItem(),GridItem(), GridItem()]) {
                    ForEach(0..<5){ _ in
                        CurrencyIcon(CurrencyImage: .copperpenny, CurrencyName: "Copper Penny")
                    }
                }
                
               
                
                
                //Text
                Text("Select the currency you'd like to convert to:")
                    .fontWeight(.bold)
                    
                
                //Currency Icons
                
                //Done Button
                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SelectCurrency()
}


