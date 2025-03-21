//
//  HelpCentreScreen.swift
//  BudgetSense
//
//  Created by english on 2025-03-21.
//

import SwiftUI

struct HelpCentreScreen: View {
    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HStack {
                    Button(action: {
                        // Action for going back to the (page with Help Centre Navigation) page
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.green)
                    }
                    
                    Spacer()
                    
                    Text("Help Centre")
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.green)
                        .padding()
                }
                                
                LazyVGrid(columns: columns, spacing: 20) {
                    Button(action: {
                        print("Frequently Asked Questions tapped")
                    }) {
                        VStack {
                            Image(systemName: "questionmark.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 80)
                                .foregroundColor(.white)
                            
                            Text("FAQ")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        .frame(width: 150, height: 150)
                        .background(Color.green)
                        .cornerRadius(25)
                    }
                    
                    Button(action: {
                        print("Live Chat tapped")
                    }) {
                        VStack {
                            Image(systemName: "message.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 80)
                                .foregroundColor(.white)
                            
                            Text("Live Chat")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        .frame(width: 150, height: 150)
                        .background(Color.green)
                        .cornerRadius(25)
                    }
                    
                    Button(action: {
                        print("Email Contact tapped")
                    }) {
                        VStack {
                            Image(systemName: "envelope.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 80)
                                .foregroundColor(.white)
                            
                            Text("Email Us")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        .frame(width: 150, height: 150)
                        .background(Color.green)
                        .cornerRadius(25)
                    }
                    
                    Button(action: {
                        print("Visit Locations tapped")
                    }) {
                        VStack {
                            Image(systemName: "map.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 80)
                                .foregroundColor(.white)
                            
                            Text("Visit Us")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        .frame(width: 150, height: 150)
                        .background(Color.green)
                        .cornerRadius(25)
                    }
                }
                .padding()
            }
            .padding()
            Spacer()
        }
    }
}

#Preview {
    HelpCentreScreen()
}

