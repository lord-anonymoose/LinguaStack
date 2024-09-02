//
//  TextModifiers.swift
//  LinguaStack
//
//  Created by Philipp Lazarev on 02.09.2024.
//  Copyright © 2024 Filipp Lazarev. All rights reserved.
//

import Foundation
import SwiftUI


struct TitleLabel: ViewModifier {

    func body(content: Content) -> some View {
        content
            .font(.title)
            .multilineTextAlignment(.center)
            .fontWeight(.bold)
            .padding(.bottom, 20)
    }
}

struct MediumLabel: ViewModifier {

    func body(content: Content) -> some View {
        content
            .font(.title3)
            .multilineTextAlignment(.center)
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .padding(.bottom, 20)
    }
}

extension Text {
    func titleLabel() -> some View {
        self.modifier(TitleLabel())
    }
    
    func mediumLabel() -> some View {
        self.modifier(MediumLabel())
    }
}
