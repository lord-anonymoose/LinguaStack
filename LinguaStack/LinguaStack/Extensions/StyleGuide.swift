//
//  StyleGuide.swift
//  LinguaStack
//
//  Created by Philipp Lazarev on 25.10.2024.
//  Copyright © 2024 Filipp Lazarev. All rights reserved.
//

import Foundation
import SwiftUI



// 
struct MainBottomButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle(radius: 15.0))
            .padding(.horizontal)
            .padding(.bottom, 55)
    }
}

extension Button {
    func mainBottomButtonStyle() -> some View {
        modifier(MainBottomButtonStyle())
    }
}

struct MainBottomButtonLabelStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 17, weight: .semibold))
            .frame(maxWidth: .infinity)
            .frame(height: 38)
    }
}

extension Text {
    func mainBottomButtonLabelStyle() -> some View {
        modifier(MainBottomButtonLabelStyle())
    }
}
