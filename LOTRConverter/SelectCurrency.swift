//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Vincent Hunter on 2/18/25.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var topCurrency: Currency
    @Binding var bottomCurrency: Currency
    
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
                IconGrid(currency: $topCurrency)
                
               
                //Text
                Text("Select the currency you'd like to convert to:")
                    .fontWeight(.bold)
                    .padding(.top)
                    
                
                //Currency Icons
                IconGrid(currency: $bottomCurrency)
                
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
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    @Previewable @State var topCurrency : Currency = .silverPenny
    
    @Previewable @State var bottomCurrency: Currency = .goldPenny
    
    SelectCurrency(topCurrency: $topCurrency, bottomCurrency: $bottomCurrency)
}


