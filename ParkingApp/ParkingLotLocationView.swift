//
//  ParkingLotLocationView.swift
//  ParkingApp
//
//  Created by Alexey on 01.11.2020.
//

import MapKit
class ParkingLotLocationView: MKAnnotationView{

    var view: EmptyLotView
    required override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        view = EmptyLotView()
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        setupUI()
        
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        view.countFreeSpaces = Int.random(in: -100..<100)
        self.addSubview(view)
        self.frame = view.bounds
       
    }

}
