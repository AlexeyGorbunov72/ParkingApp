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
        DispatchQueue.global(qos: .background).async{
            return
            while true{
                sleep(1)
                DispatchQueue.background(delay: 1, completion: {
                    self.fuck()
                })
            }
        }
        
        
    }
    func fuck(){
        let f = self.parkingMap.visibleAnnotations(parkingMap: self.parkingMap).randomElement()!
        f.view.countFreeSpaces = Int.random(in: -100...100)
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
    func visibleAnnotations(parkingMap: MKMapView) -> [ParkingLotLocationView] {
        var toReturn: [ParkingLotLocationView] = []
        for annotation in self.annotations{
            
            if let annotationView =  parkingMap.view(for: annotation) as? ParkingLotLocationView{
                toReturn.append(annotationView)
            }
        }
        return toReturn
    }
}
extension DispatchQueue {

    static func background(delay: Double = 0.0, background: (()->Void)? = nil, completion: (() -> Void)? = nil) {
        DispatchQueue.global(qos: .background).async {
            background?()
            if let completion = completion {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                    completion()
                })
            }
        }
    }

}
