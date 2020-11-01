//
//  ViewController.swift
//  ParkingApp
//
//  Created by Alexey on 01.11.2020.
//

import UIKit
import MapKit
class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var parkingMap: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMap()
        addAnnotations()
        
        
    }
    private func setupMap(){
        parkingMap.delegate = self
        let location = CLLocationCoordinate2DMake(59.9394619, 30.3146286)
        let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        parkingMap.setRegion(region, animated: true)
        parkingMap.register(ParkingLotLocationView.self, forAnnotationViewWithReuseIdentifier: "parkingLot")
    }
    func addAnnotations(){
        var annotations: [ParkingLotAnnotation] = []
        let min = -0.01
        let max = 0.01
        for i in 0..<10{
            let bubbleLatitude = 59.9394619 + Double.random(in: min...max)
            let bubbleLongitude = 30.3146286 + Double.random(in: min...max)
            annotations.append(ParkingLotAnnotation(info: ParkingLotInfo(parkingLotUID: i), position: CLLocationCoordinate2D(latitude: bubbleLatitude, longitude: bubbleLongitude)))
        
        }
        parkingMap.addAnnotations(annotations)
        
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
        {
            
            if let annotation = annotation as? ParkingLotAnnotation{
                let annotationView = ParkingLotLocationView(annotation: annotation, reuseIdentifier: "parkingLot")
                return annotationView
            }
            
            
            return nil
    }
    
    
}

extension MKMapView{
    func visibleAnnotations() -> [ParkingLotAnnotation] {
        return self.annotations(in: self.visibleMapRect).map { obj -> ParkingLotAnnotation in return obj as! ParkingLotAnnotation }
    }
}
