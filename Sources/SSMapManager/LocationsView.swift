//
//  LocationsView.swift
//  SwiftUIMap (iOS)
//
//  Created by Shailendra Singh on 02/09/22.
//

import SwiftUI
import MapKit

@available(iOS 15, macOS 11.0, *)
public struct SSMapManager: View {
    
    @EnvironmentObject private var vm:LocationViewModal
    
    public var body: some View {
        
        ZStack{
            Map(coordinateRegion: $vm.mapRegion, annotationItems: vm.locations, annotationContent: { location in
                MapAnnotation(coordinate: location.coordinates) {
                   LocationMapAnnotationView()
                        .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                        .shadow(radius: 10)
                        .onTapGesture {
                            vm.showNextLocation(location: location)
                        }
                
                }
            })
            
                .ignoresSafeArea()
            
            VStack(spacing:0){
                    Button(action: vm.toggleLocationList) {
                        
                        Text(vm.mapLocation.name + " " + vm.mapLocation.cityName)
                            .font(.title)
                            .foregroundColor(.primary)
                            .fontWeight(.black)
                            .frame(height:55)
                            .frame(maxWidth:.infinity)
                            .animation(.none
                                       , value: vm.mapLocation)
                            .overlay(alignment: .leading) {
                                Image(systemName: "arrow.down")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                    .padding()
                                    .rotationEffect(Angle(degrees: vm.showLocationList ? 180 : 0))
                            }
                    }
                    
                    if vm.showLocationList{
                        LocationListView()
                    }
                }
                
                .background(.thickMaterial)
                .cornerRadius(10)
                
                
                    .padding()
                Spacer()
                
                ZStack{
                    ForEach(vm.locations) { location in
                        
                        if vm.mapLocation == location{
                            LocationPreviewView(location: location)
                                .shadow(color: Color.black.opacity(0.3), radius: 20)
                                .padding()
                                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                        }
                      
                    }
                }
            }
            
        }
    }

@available(iOS 15, macOS 11.0, *)
struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        SSMapManager().environmentObject(LocationViewModal())
    }
}
//extension LocationsView{
//
//    var header:some View{
//
//        VStack {
//
//            Button(action: vm.toggleLocationList) {
//
//                Text(vm.mapLocation.name + " " + vm.mapLocation.cityName)
//                    .font(.title)
//                    .foregroundColor(.primary)
//                    .fontWeight(.black)
//                    .frame(height:55)
//                    .frame(maxWidth:.infinity)
//                    .animation(.none
//                               , value: vm.mapLocation)
//                    .overlay(alignment: .leading) {
//                        Image(systemName: "arrow.down")
//                            .font(.headline)
//                            .foregroundColor(.primary)
//                            .padding()
//                            .rotationEffect(Angle(degrees: vm.showLocationList ? 180 : 0))
//                    }
//            }
//
//            if vm.showLocationList{
//                LocationListView()
//            }
//        }
//
//        .background(.thickMaterial)
//        .cornerRadius(10)
//
//
//    }
    
//    private var mapView:some View{
//        Map(coordinateRegion: $vm.mapRegion, annotationItems: vm.locations, annotationContent: { location in
//            MapAnnotation(coordinate: location.coordinates) {
//               LocationMapAnnotationView()
//                    .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
//                    .shadow(radius: 10)
//                    .onTapGesture {
//                        vm.showNextLocation(location: location)
//                    }
//
//            }
//        })
//
//            .ignoresSafeArea()
//
//    }
//}
