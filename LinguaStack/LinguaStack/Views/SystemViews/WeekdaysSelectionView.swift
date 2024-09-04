//
//  WeekdaysSelectionView.swift
//  LinguaStack
//
//  Created by Philipp Lazarev on 02.09.2024.
//  Copyright © 2024 Filipp Lazarev. All rights reserved.
//

import SwiftUI

struct WeekdaysSelectionView: View {
    
    @Binding var weekDays: [Bool]
    
    var body: some View {
        VStack {
            HStack {
                ForEach(weekDays.indices, id: \.self) { index in
                    Button(index.weekday() ?? "???") {
                        weekDays[index].toggle()
                    }
                    .buttonStyle(ConditionalButtonStyle(isActive: weekDays[index]))
                }
            }
            
            HStack {
                Button("All") {
                    for i in 0...weekDays.count - 1 {
                        weekDays[i] = true
                    }
                }
                .buttonStyle(ConditionalButtonStyle(isActive: !weekDays.contains(false)))
                
                Button("None") {
                    for i in 0...weekDays.count - 1 {
                        weekDays[i] = false
                    }
                }
                .buttonStyle(ConditionalButtonStyle(isActive: !weekDays.contains(true)))
            }
        }
    }
}
