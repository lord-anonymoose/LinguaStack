//
//  SFSymbolCustomModifier.swift
//  LinguaStack
//
//  Created by Philipp Lazarev on 01.09.2024.
//

import Foundation
import SwiftUI


struct BouncingSFSymbol: ViewModifier {
    @Binding var isSymbolAnimating: Bool

    func body(content: Content) -> some View {
        content
            .font(.system(size: 50))
            .symbolRenderingMode(.multicolor)
            .symbolEffect(.bounce.up.byLayer, value: isSymbolAnimating)
            .padding(.bottom, 20)
    }
}

struct PulsingSFSymbol: ViewModifier {
    @Binding var isSymbolAnimating: Bool

    func body(content: Content) -> some View {
        content
            .font(.system(size: 50))
            .symbolRenderingMode(.multicolor)
            .symbolEffect(.pulse.byLayer, value: isSymbolAnimating)
            .padding(.bottom, 20)
    }
}

extension Image {
    func bouncingSFSymbol(isSymbolAnimating: Binding<Bool>) -> some View {
        self.modifier(BouncingSFSymbol(isSymbolAnimating: isSymbolAnimating))
    }
    
    func pulsingSFSymbol(isSymbolAnimating: Binding<Bool>) -> some View {
        self.modifier(PulsingSFSymbol(isSymbolAnimating: isSymbolAnimating))
    }
}
