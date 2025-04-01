//
//  LiveChatScreen.swift
//  BudgetSense
//
//  Created by english on 2025-04-01.
//

import SwiftUI

struct LiveChatScreen: View {
    @State private var userMessage: String = ""
    @State private var messages: [Message] = [
        Message(id: UUID(), sender: .system, content: "Hello! How can I help you today?"),
        Message(id: UUID(), sender: .user, content: "I need help with my account.")
    ]
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    // Action to go back to the previous screen
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.green)
                }
                
                Spacer()
                
                Text("Live Chat")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                
                Spacer()
            }
            .padding()
            .overlay(
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(.gray.opacity(0.5)), alignment: .bottom
            )
            
            ScrollView {
                ForEach(messages) { message in
                    HStack {
                        if message.sender == .user {
                            Spacer()
                        }
                        
                        VStack(alignment: message.sender == .user ? .trailing : .leading) {
                            Text(message.content)
                                .padding()
                                .background(message.sender == .user ? Color.green : Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .frame(maxWidth: 300, alignment: message.sender == .user ? .trailing : .leading)
                            
                            Text(message.sender == .user ? "You" : "Support")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal)
                    }
                }
            }
            
            HStack {
                TextField("Type a message", text: $userMessage)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.top, 10)
                
                Button(action: sendMessage) {
                    Image(systemName: "paperplane.fill")
                        .font(.title2)
                        .foregroundColor(.green)
                        .padding(.trailing)
                }
            }
            .padding(.bottom)
            .overlay(
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(.gray.opacity(0.5)), alignment: .top
            )
            .padding(.bottom, 10)
        }
        .navigationTitle("Live Chat")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func sendMessage() {
        guard !userMessage.isEmpty else { return }
        
        messages.append(Message(id: UUID(), sender: .user, content: userMessage))
        
        userMessage = ""
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            messages.append(Message(id: UUID(), sender: .system, content: "This is an automated response. How can I assist you further?"))
        }
    }
}

struct Message: Identifiable {
    var id: UUID
    var sender: Sender
    var content: String
}

enum Sender {
    case user
    case system
}

#Preview {
    LiveChatScreen()
}
