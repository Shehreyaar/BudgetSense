//
//  VisitUsScreen.swift
//  BudgetSense
//
//  Created by english on 2025-04-01.
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
        ZStack {
            Map(position: $camera) {
                ForEach(locations) { location in
                    Annotation(location.name, coordinate: location.coordinate) {
                        VStack {
                            Image(systemName: "mappin.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.red)
                            Text(location.name)
                                .font(.caption)
                                .foregroundColor(.black)
                                .padding(5)
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(radius: 3)
                        }
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    VStack(spacing: 10) {
                        Button {
                            goToUserLocation()
                        } label: {
                            Image(systemName: "location.fill")
                                .font(.title2)
                                .foregroundStyle(.black)
                                .padding()
                                .background(.ultraThinMaterial)
                                .clipShape(Circle())
                        }.shadow(radius: 4)
                    }
                    .padding()
                }
                Spacer()
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    VStack(spacing: 10) {
                        Button {
                            zoomIn()
                        } label: {
                            Image(systemName: "plus.magnifyingglass")
                                .font(.title2)
                                .foregroundStyle(.black)
                                .padding()
                                .background(.ultraThinMaterial)
                                .clipShape(Circle())
                        }.shadow(radius: 4)
                        
                        Button {
                            zoomOut()
                        } label: {
                            Image(systemName: "minus.magnifyingglass")
                                .font(.title2)
                                .foregroundStyle(.black)
                                .padding()
                                .background(.ultraThinMaterial)
                                .clipShape(Circle())
                        }.shadow(radius: 4)
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Visit Us")
        .navigationBarTitleDisplayMode(.inline)
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
