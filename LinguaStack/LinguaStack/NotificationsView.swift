//
//  NotificationsView.swift
//  LinguaStack
//
//  Created by Philipp Lazarev on 01.09.2024.
//

import SwiftUI

struct NotificationsView: View {
    
    @State private var notificationTime = Date.now
    @State private var isSymbolAnimating = false
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "bell.badge.fill")
                .bouncingSFSymbol(isSymbolAnimating: $isSymbolAnimating)
            Text("Notifications")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            Spacer()
            DatePicker("Please enter a date", selection: $notificationTime, displayedComponents: .hourAndMinute)
        }
        .onAppear {
            animateThreeTimes()
        }
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
    NotificationsView()
}
