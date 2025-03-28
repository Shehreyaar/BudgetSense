//
//  Document.swift
//  Finance
//
//  Created by english on 2025-03-11.
//

import Foundation

// Document Model
struct Document {
    var documentName: String
    var documentType: String // ID, Utility Bill, etc.
    var uploadDate: String
}

// Sample Documents
let sampleDocuments: [Document] = [
    Document(documentName: "Passport", documentType: "ID", uploadDate: "2024-01-15"),
    Document(documentName: "Driver's License", documentType: "ID", uploadDate: "2023-08-12"),
    Document(documentName: "Electricity Bill", documentType: "Utility Bill", uploadDate: "2025-02-20")
]
