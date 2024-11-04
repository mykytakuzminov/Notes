//
//  LocationsViewModel.swift
//  Attractions
//
//  Created by Mykyta Kuzminov on 03.11.24.
//

import Foundation
import SwiftUI
import MapKit

final class LocationsViewModel: ObservableObject {
    
    @Published var locations: [Location]
    
    @Published var mapCameraPosition: MapCameraPosition
    @Published var mapLocation: Location {
        didSet {
            updateMapCameraPosition(location: mapLocation)
        }
    }
    
    @Published var showLocationsList: Bool = false
    @Published var sheetLocation: Location?
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        let locations = LocationsDataService.locations
        
        mapCameraPosition = MapCameraPosition.region(MKCoordinateRegion(center: locations.first!.coordinates, span: mapSpan))
        
        self.locations = locations
        self.mapLocation = locations.first!
    }
    
    func toggleLocationsList() {
        withAnimation(.default) {
            showLocationsList.toggle()
        }
    }
    
    func showSelectedLocation(location: Location) {
        withAnimation(.default) {
            mapLocation = location
            showLocationsList = false
        }
    }
    
    func showNextLocation() {
        guard let currentIndex = locations.firstIndex(of: mapLocation) else { return }
        
        let nextIndex = currentIndex + 1
        
        guard locations.indices.contains(nextIndex)
        else {
            guard let firstLocation = locations.first else { return }
            showSelectedLocation(location: firstLocation)
            return
        }
        
        let nextLocation = locations[nextIndex]
        showSelectedLocation(location: nextLocation)
    }
    
    private func updateMapCameraPosition(location: Location) {
        withAnimation(.default) {
            let mapRegion = MKCoordinateRegion(center: location.coordinates, span: mapSpan)
            mapCameraPosition = .region(mapRegion)
        }
    }
}
