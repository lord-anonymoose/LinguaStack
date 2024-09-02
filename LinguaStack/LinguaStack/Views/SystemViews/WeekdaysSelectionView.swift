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
    
    
    func numberToWeekday(_ number: Int) -> String {
        switch number {
        case 0:
            return String(localized: "Mon")
        case 1:
            return String(localized: "Tue")
        case 2:
            return String(localized: "Wed")
        case 3:
            return String(localized: "Thu")
        case 4:
            return String(localized: "Fri")
        case 5:
            return String(localized: "Sat")
        case 6:
            return String(localized: "Sun")
        default:
            return "???"
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(weekDays.indices, id: \.self) { index in
                    Button(numberToWeekday(index)) {
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
