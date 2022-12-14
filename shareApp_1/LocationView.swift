//
//  LocationView.swift
//  shareApp_1
//
//  Created by ひがしもとあおい on 2022/12/14.
//

import SwiftUI
import MapKit

struct LocationView: View {
    
    @State var regin = MKCoordinateRegion(
    center: CLLocationCoordinate2D(
        latitude: 35.710057714926265,
        longitude: 139.81071829999996
    ),
    latitudinalMeters: 1000.0,
    longitudinalMeters: 1000.0
)
    
    var body: some View {
        Map(coordinateRegion: $regin)
            .edgesIgnoringSafeArea(.bottom)
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
