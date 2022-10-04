//
//  LocationPreviewView.swift
//  SwiftUIMap (iOS)
//
//  Created by Shailendra Singh on 16/09/22.
//

import SwiftUI
@available(iOS 15, macOS 11.0, *)
struct LocationPreviewView: View {
    
    var location:Location
    @EnvironmentObject private var vm:LocationViewModal
    
    var body: some View {
        
        HStack(alignment:.bottom,spacing: 0){
            
            VStack(spacing:16){
                imageSection
                titleSection
            }
            Spacer()
            
            VStack(spacing:16){
                learnMoreButton
                NextButton
            }
        }
        
         //.background(Color.gray)
        .cornerRadius(10)
        .padding(20)
        .background(){
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y:65)
        }
        .cornerRadius(10)
        
    }
}
@available(iOS 15, macOS 11.0, *)
struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack{
            Color.green.ignoresSafeArea()
            LocationPreviewView(location: LocationsDataService.locations.first!)
                .padding()
        }.environmentObject(LocationViewModal())
    }
}
@available(iOS 15, macOS 11.0, *)
extension LocationPreviewView{
    
    var imageSection:some View{
        
        ZStack{
            if let image = location.imageNames.first{
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }
    
    private var titleSection:some View{
        
        VStack(alignment:.leading,spacing: 4){
            Text(location.name)
                .font(.headline)
            Text(location.cityName)
                .font(.subheadline)
            
        }
    }
    
    // learnMoreButton
    private var learnMoreButton:some View{
        // learn more button
        Button {
            
        } label: {
            Text("Learn More")
                .font(.headline)
                .frame(width:125,height:25)
        }
        .buttonStyle(.borderedProminent)
        
    }
    // Next Button
    private var NextButton:some View{
        
        // second button
        Button {
            vm.nextButtonPressed()
        } label: {
            Text("Next")
                .font(.headline)
                .frame(width:125,height:25)
        }
        .buttonStyle(.bordered)
    }
}
