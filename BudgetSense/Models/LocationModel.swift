//
//  LocationModel.swift
//  BudgetSense
//
//  Created by english on 2025-04-01.
//

import Foundation
import MapKit

struct LocationModel: Identifiable {
    let id = UUID()
    let name: String
    let address: String
    let coordinate: CLLocationCoordinate2D
}
