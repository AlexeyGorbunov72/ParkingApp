//
//  ParkingLotLocationView.swift
//  ParkingApp
//
//  Created by Alexey on 01.11.2020.
//

import MapKit
class ParkingLotLocationView: MKAnnotationView{

   
    required override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        setupUI()
        
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        let view = EmptyLotView()
        view.countFreeSpaces = Int.random(in: -100..<100)
        self.addSubview(view)
        self.frame = view.bounds
       
    }

}
