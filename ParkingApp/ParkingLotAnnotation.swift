//
//  ParkingLotAnnotation.swift
//  ParkingApp
//
//  Created by Alexey on 01.11.2020.
//

import MapKit
class ParkingLotAnnotation: NSObject, MKAnnotation
{
    var coordinate: CLLocationCoordinate2D
    
    var info: ParkingLotInfo
    required init(info: ParkingLotInfo, position: CLLocationCoordinate2D)
    {
        
        coordinate = position
        self.info = info
    }
}
