//
//  MapModels.swift
//  shareApp_1
//
//  Created by ひがしもとあおい on 2022/12/14.
//

import Foundation
import MapKit


class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    //インスタンス化
    let manager = CLLocationManager()
    
    @Published var region = MKCoordinateRegion()
    
    override init() {
        super.init()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.distanceFilter = 3.0
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locations.last.map {
            let center = CLLocationCoordinate2D(
                latitude: $0.coordinate.latitude,
                longitude: $0.coordinate.longitude)
            
                region = MKCoordinateRegion(
                    center: center,
                    latitudinalMeters: 1000.0,
                    longitudinalMeters: 1000.0
            )
        }
    }
}
