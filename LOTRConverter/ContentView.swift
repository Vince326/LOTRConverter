//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Vincent Hunter on 12/29/24.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showCurrencySelected = false
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    let currencyTip = CurrencyTip()
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    
    
    var body: some View {
        ZStack {
            
            //Background Image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                //Image (prancing pony)
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                //TextView (currency exchange)
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                //conversion section
                HStack {
                    //Left Conversion Section
                    VStack {
                        //Currency
                        
                        HStack {
                            //Currency Image
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            //Currency Text
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showCurrencySelected.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        .popoverTip(currencyTip, arrowEdge: .bottom)
                        
                        //TextField Left
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                        
                        
                    }
                    
                    //Equals Sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    //Right Conversion Section
                    
                    VStack {
                        //Currency
                        HStack {
                            //Currency Text
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            //Currency Image
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showCurrencySelected.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        
                        // Right TextField
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping)
                        
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                .keyboardType(.decimalPad)
                
                Spacer()
                
                //Info Button
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                        
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                }
            }
            
                .task {
                    try? Tips.configure()
                }
                .onChange(of: leftAmount){
                    if leftTyping {
                        rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
                    }
                }
                .onChange(of: rightAmount) {
                    if rightTyping {
                        leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
                    }
                }
                .onChange(of: leftCurrency){
                    leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
                }
                .onChange(of: rightCurrency){
                    rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
                }
                
                .sheet(isPresented: $showExchangeInfo) {
                    ExchangeInfo()
                }
                .sheet(isPresented: $showCurrencySelected) {
                    SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}
