//
//  LocationMapAnnotationView.swift
//  SwiftUIMap (iOS)
//
//  Created by Shailendra Singh on 16/09/22.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    
    let accent = Color("AccentColor")
    var body: some View {
      
        VStack(spacing:0){
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .font(.headline)
                .padding(6)
                .background(accent)
                .cornerRadius(36)
            
            Image(systemName: "triangle.fill")
                .resizable()
                .foregroundColor(accent)
                .frame(width: 10, height: 10)
                .scaledToFit()
                .rotationEffect(Angle(degrees: 180))
                .offset(y:-4)
                .padding(.bottom,35)
        }
    }
}

struct LocationMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack{
            Color.black.ignoresSafeArea()
            LocationMapAnnotationView()
        }
    }
}
