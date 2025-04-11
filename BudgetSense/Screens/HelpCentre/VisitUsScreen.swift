//
//  VisitUsScreen.swift
//  BudgetSense
//
//  Created by Shehreyaar Fawad on 2025-04-01.
//

import SwiftUI
import MapKit

struct VisitUsScreen: View {
    @StateObject private var locationManager = LocationManager()
    @State private var camera: MapCameraPosition = .automatic
    @State private var zoomLevel: Double = 2000

    let locations = [
        LocationModel(name: "Main Office", address: "123 Main St, Cityville", coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)),
        LocationModel(name: "Subsidiary Office", address: "789 Oak St, Smalltown", coordinate: CLLocationCoordinate2D(latitude: 37.8044, longitude: -122.2711))
    ]

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Map(position: $camera) {
                ForEach(locations) { location in
                    Annotation(location.name, coordinate: location.coordinate) {
                        VStack(spacing: 4) {
                            Image(systemName: "mappin.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.red)
                                .shadow(radius: 2)

                            Text(location.name)
                                .font(.caption)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.white)
                                .cornerRadius(8)
                                .foregroundColor(.black)
                                .shadow(radius: 3)
                        }
                    }
                }
            }
            .ignoresSafeArea()

            VStack {
                controlButton(icon: "location.fill", action: goToUserLocation)
                Spacer()
                VStack(spacing: 12) {
                    controlButton(icon: "plus.magnifyingglass", action: zoomIn)
                    controlButton(icon: "minus.magnifyingglass", action: zoomOut)
                }
            }
            .padding()
        }
        .navigationTitle("Visit Us")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func controlButton(icon: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundStyle(.black)
                .padding(10)
                .background(.ultraThinMaterial)
                .clipShape(Circle())
                .shadow(radius: 4)
        }
    }

    private func zoomIn() {
        withAnimation {
            zoomLevel *= 0.8
            camera = .camera(MapCamera(centerCoordinate: locationManager.userLocation ?? locations[0].coordinate, distance: zoomLevel))
        }
    }

    private func zoomOut() {
        withAnimation {
            zoomLevel *= 1.2
            camera = .camera(MapCamera(centerCoordinate: locationManager.userLocation ?? locations[0].coordinate, distance: zoomLevel))
        }
    }

    private func goToUserLocation() {
        if let userLocation = locationManager.userLocation {
            withAnimation {
                camera = .camera(MapCamera(centerCoordinate: userLocation, distance: zoomLevel))
            }
        }
    }
}


class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    @Published var userLocation: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.last else { return }
        DispatchQueue.main.async {
            self.userLocation = latestLocation.coordinate
        }
    }
}

#Preview {
    VisitUsScreen()
}
