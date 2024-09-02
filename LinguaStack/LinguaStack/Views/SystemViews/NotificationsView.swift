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
    
    @State private var notificationDayss = [true, true, true, true, true, true, true]

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
            
            HStack {
                Button("Mon") {
                    notificationDays[0].toggle()
                }
                .buttonStyle(ConditionalButtonStyle(isActive: notificationDays[0]))
                
                Button("Tue") {
                    notificationDays[1].toggle()
                }
                .buttonStyle(ConditionalButtonStyle(isActive: notificationDays[1]))

                Button("Wed") {
                    notificationDays[2].toggle()
                }
                .buttonStyle(ConditionalButtonStyle(isActive: notificationDays[2]))

                Button("Thu") {
                    notificationDays[3].toggle()
                }
                .buttonStyle(ConditionalButtonStyle(isActive: notificationDays[3]))

                Button("Fri") {
                    notificationDays[4].toggle()
                }
                .buttonStyle(ConditionalButtonStyle(isActive: notificationDays[4]))

                Button("Sat") {
                    notificationDays[5].toggle()
                }
                .buttonStyle(ConditionalButtonStyle(isActive: notificationDays[5]))

                Button("Sun") {
                    notificationDays[6].toggle()
                }
                .buttonStyle(ConditionalButtonStyle(isActive: notificationDays[6]))
            }
            .padding(.leading, 10)
            .padding(.trailing, 10)
            
            HStack {
                Button("All") {
                    for i in 0...notificationDays.count - 1 {
                        notificationDays[i] = true
                    }
                }
                .buttonStyle(ConditionalButtonStyle(isActive: !notificationDays.contains(false)))
                
                Button("None") {
                    for i in 0...notificationDays.count - 1 {
                        notificationDays[i] = false
                    }
                }
                .buttonStyle(ConditionalButtonStyle(isActive: !notificationDays.contains(true)))
            }
            
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

