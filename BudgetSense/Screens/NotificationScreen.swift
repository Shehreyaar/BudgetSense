//
//  NotificationScreen.swift
//  BudgetSense
//
//  Created by Shehreyaar Fawad on 2025-03-11.
//

import SwiftUI

// Dummy Notification Data
let DummyNotificationData = NotificationModel(notificationId: 1, imageName: "NDummy1", type: "Reminder", message: "Your Netflix subscription is expiring on 03/12/2025, please renew it soon", time: "2h ago")
let DummyNotificationData2 = NotificationModel(notificationId: 2, imageName: "NDummy2", type: "Warning", message: "Careful! You may exceed your budget!", time: "March 3")
let DummyNotificationData3 = NotificationModel(notificationId: 3, imageName: "NDummy3", type: "Reminder", message: "Reminder: Your electricity bill is due tomorrow.", time: "1 day ago")


struct NotificationScreen: View {
    var notifications: [NotificationModel]
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    // Action for going back to the (page with notification navigation) page
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.green)
                }
                
                Spacer()
                
                Text("Notifications")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.green)
                    .padding()
            }
            .padding(.horizontal)
            
            ForEach(notifications, id: \.notificationId) { notification in
                HStack {
                    Image(notification.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(notification.type)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                        
                        Text(notification.message)
                            .font(.body)
                            .lineLimit(2)
                            .foregroundColor(.black)
                        
                        Text(notification.time)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding()
                Divider()
            }
            Spacer()
        }
    }
}

#Preview {
    NotificationScreen(notifications: [DummyNotificationData, DummyNotificationData2, DummyNotificationData3])
}


