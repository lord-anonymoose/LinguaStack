//
//  JailbreakView.swift
//  LinguaStack
//
//  Created by Philipp Lazarev on 01.09.2024.
//

import SwiftUI

struct JailbreakView: View {
    @State private var isSymbolAnimating = false
    
    var body: some View {
        Spacer()
        
        Image(systemName: "wrongwaysign.fill")
            .pulsingSFSymbol(isSymbolAnimating: $isSymbolAnimating)
            .onAppear {
                animateThreeTimes()
            }
        
        Text("It looks like your device has been jailbroken")
            .titleLabel()
        
        Spacer()
        
        Text("For safety and privacy reasons, we do not allow running LinguaStack App on devices with Jailbreak.")
            .mediumLabel()
        
        Text("If you would like to keep using our app, please mind switching to another device running supported iOS Version.")
            .mediumLabel()
        
        Spacer()
    }
    
    private func animateThreeTimes() {
        for i in 0..<3 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.6) {
                isSymbolAnimating.toggle()
            }
        }
    }
}

#Preview {
    JailbreakView()
}
