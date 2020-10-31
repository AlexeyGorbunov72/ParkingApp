//
//  EmptyLotView.swift
//  ParkingApp
//
//  Created by Alexey on 01.11.2020.
//

import UIKit

class EmptyLotView: UIView {

    @IBOutlet var pic: UIImageView?
    @IBOutlet var label: UILabel?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    func setup(){
        let viewFromXib = Bundle.main.loadNibNamed("EmptyLotView", owner: self, options: nil)![0] as! UIView
        let viewToAdd = viewFromXib.subviews[0]
        viewToAdd.frame = self.bounds
        viewToAdd.layer.cornerRadius = 10
        addSubview(viewToAdd)
       // let tapGestoreRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapOnMe(_ : )))
        
        //self.addGestureRecognizer(tapGestoreRecognizer)
    }
    @objc func tapOnMe(_ gestue: UITapGestureRecognizer){
       print("it's work!")
    }
}
