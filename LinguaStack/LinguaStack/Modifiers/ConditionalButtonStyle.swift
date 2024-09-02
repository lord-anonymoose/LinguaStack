//
//  ConditionalButtonStyle.swift
//  LinguaStack
//
//  Created by Philipp Lazarev on 02.09.2024.
//  Copyright © 2024 Filipp Lazarev. All rights reserved.
//

import SwiftUI

struct ConditionalButtonStyle: ButtonStyle {
    var isActive: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: (UIScreen.screenWidth - 80) / 7)
            .frame(height: 40)
            .background(isActive ? Color.blue : Color.gray)
            .foregroundColor(.white)
            .cornerRadius(8)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}
