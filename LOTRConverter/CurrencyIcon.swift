//
//  CurrencyIcon.swift
//  LOTRConverter
//
//  Created by Vincent Hunter on 2/18/25.
//

import SwiftUI

struct CurrencyIcon: View {
    let CurrencyImage: ImageResource
    let CurrencyName: String
    
    var body: some View {
        
        //Currency Icons
        ZStack(alignment: .bottom) {
            //Currency Image
            Image(CurrencyImage)
                .resizable()
                .scaledToFit()
            
            //Currency Name
            Text(CurrencyName)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(.brown.opacity(0.75))
            
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 25))
        
    }
}

#Preview {
    CurrencyIcon(CurrencyImage: .goldpiece, CurrencyName: "Gold Piece")
}


