//
//  LocationListView.swift
//  SwiftUIMap (iOS)
//
//  Created by Shailendra Singh on 15/09/22.
//

import SwiftUI

@available(iOS 15, macOS 11.0, *)
struct LocationListView: View {
    
    @EnvironmentObject private var vm:LocationViewModal
    var body: some View {
       
        List{
            ForEach(vm.locations){ location in
                Button {
                    vm.showNextLocation(location: location)
                } label: {
                    locationListRow(location: location)
                }

                    .padding(.vertical, 4)
            }
            //.listStyle(.plain)
                
        }
        
    }
}

@available(iOS 15, macOS 11.0, *)
struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView().environmentObject(LocationViewModal())
    }
}
@available(iOS 15, macOS 11.0, *)
extension LocationListView{
    
    func locationListRow(location:Location)-> some View{
        HStack{
            
            if let image =  location.imageNames.first{
                Image(image)
                    .resizable()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            
            VStack(alignment:.leading){
                Text(location.name)
                    .font(.headline)
                    .foregroundColor(Color.black)
                Text(location.cityName)
                    .font(.subheadline)
                    .foregroundColor(Color.black)
                    
            }
            .frame(maxWidth:.infinity, alignment:.leading)
        }
        
    }
}
