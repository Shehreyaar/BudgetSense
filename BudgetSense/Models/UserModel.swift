//
//  UserModel.swift
//  Finance
//
//  Created by english on 2025-03-11.
//

import Foundation

// User Model
struct User {
    var name: String
    var birthdate: String
    var gender: String
    var email: String
    var phoneNumber: String
    var address: String
    var profilePicture: String // Image asset name
}

// Sample User Data
let sampleUser = User(
    name: "Jonas Macroni",
    birthdate: "05 November 1993",
    gender: "Male",
    email: "jonas.macroni@example.com",
    phoneNumber: "+1 514-123-4567",
    address: "1234 Finance St, Montreal, QC",
    profilePicture: "profile_picture"
)
