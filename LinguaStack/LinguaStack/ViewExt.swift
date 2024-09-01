//
//  ViewExt.swift
//  LinguaStack
//
//  Created by Philipp Lazarev on 01.09.2024.
//

import Foundation
import SwiftUI

protocol AnimatingSymbol {
    var isSymbolAnimating: Bool
    
    private func animateThreeTimes() {
        for i in 0..<3 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.6) {
                isSymbolAnimating.toggle()
            }
        }
    }
}

