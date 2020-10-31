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
        let view = EmptyLotView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let tapGestoreRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapOnMe(_ : )))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapGestoreRecognizer)
        addSubview(view)
    }
    @objc func tapOnMe(_ gestue: UITapGestureRecognizer){
       print("it's work!")
    }
}
