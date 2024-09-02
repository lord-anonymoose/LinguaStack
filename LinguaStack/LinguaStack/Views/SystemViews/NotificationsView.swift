//
//  NotificationsView.swift
//  LinguaStack
//
//  Created by Philipp Lazarev on 01.09.2024.
//  Copyright © 2024 Filipp Lazarev. All rights reserved.
//


// Following view is used for setting daily notifications for the app

import SwiftUI

struct NotificationsView: View {
    
    @State private var notificationTime = Date.now
    @State private var isSymbolAnimating = false
    
    @State private var notificationDays = (0...6).map { _ in true}

    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button("Skip") {
                    
                }
                .padding(.trailing, 20)
            }
            
            Spacer()
            
            Image(systemName: "bell.badge.fill")
                .bouncingSFSymbol(isSymbolAnimating: $isSymbolAnimating)
                .onAppear {
                    animateThreeTimes()
                }
            
            Text("Notifications")
                .titleLabel()
            
            Spacer()
            
            Text("For learning effectively, we recommend reviewing your vocabulary on a daily basis.")
                .mediumLabel()
            
            Text("Set a daily reminder for checking the app.")
                .mediumLabel()
            
            Spacer()
            
            WeekdaysSelectionView(weekDays: $notificationDays)

            Spacer()
            
            DatePicker("", selection: $notificationTime, displayedComponents: .hourAndMinute)
                .labelsHidden()
                .padding(.leading, 50)
                .padding(.trailing, 50)
            
            Spacer()
            
            Button("Save settings") {
                let calendar = Calendar.current
                let components = calendar.dateComponents([.hour, .minute], from: notificationTime)
                NotificationService.scheduleNotifications(notificationDays, hour: components.hour ?? 19, minute: components.minute ?? 0)
            }
            .buttonStyle(.borderedProminent)
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

