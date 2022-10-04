//
//  LocationViewModal.swift
//  SwiftUIMap (iOS)
//
//  Created by Shailendra Singh on 02/09/22.
//

import Foundation
import MapKit
import SwiftUI
@available(iOS 15, macOS 11.0, *)


class LocationViewModal:ObservableObject{
    
    // all loaded location
    @Published var locations:[Location]
    
    // current location on map
    @Published var mapLocation:Location {
        didSet{
            self.updateMapLocation(location: mapLocation)
        }
    }
    @Published var mapRegion = MKCoordinateRegion()
    @Published var mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    
    @Published var showLocationList:Bool = false
    
    init(){
      let location  = LocationsDataService.locations
       self.locations = location
        self.mapLocation = location.first!
        self.updateMapLocation(location: location.first!)
    }
    private func updateMapLocation(location:Location){
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(center: location.coordinates, span: mapSpan)
        }
    }
    
    func toggleLocationList(){
        
        withAnimation(.easeInOut){
            showLocationList = !showLocationList
        }
    }
    
    func showNextLocation(location:Location){
        withAnimation(.easeInOut){
            mapLocation = location
            showLocationList = false
        }
    }
    func nextButtonPressed(){
        
        // get the current index
        guard let currentIndex  = locations.firstIndex(where:{$0 == mapLocation}) else{
            print("Could not find the current index")
            return
        }
        // check if next index not valid
        let nextIndex  = currentIndex+1
        guard locations.indices.contains(nextIndex) else{
            // next index is not valid
            // restart from 0
            guard let firstIndex  =  locations.first else{return}
            showNextLocation(location: firstIndex)
            return
        }
        
        // next index is valid
        let nextLocation  = locations[nextIndex]
        showNextLocation(location: nextLocation)
        
        
    }
}
