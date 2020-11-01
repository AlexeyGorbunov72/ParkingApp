//
//  EmptyLotView.swift
//  ParkingApp
//
//  Created by Alexey on 01.11.2020.
//

import UIKit

class EmptyLotView: UIView {
   
    var backgroundView: UIView?
    @IBOutlet var pic: UIImageView?
    @IBOutlet var label: UILabel?
    var countFreeSpaces = 0 {
        didSet{
            if(countFreeSpaces > 0){
                self.setFree()
            } else {
                self.setOccupated()
            }
        }
    }
    private func setFree(){
        self.backgroundView!.backgroundColor = .green
        self.label?.text = "\(countFreeSpaces)"
    }
    private func setOccupated(){
        self.backgroundView!.backgroundColor = .systemPink
        self.label?.text = ""
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    convenience init(){
        self.init(frame: CGRect(x: 0, y: 0, width: 73, height: 101))
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setup(){
        let viewFromNib = Bundle.main.loadNibNamed("EmptyLotView", owner: self, options: nil)![0] as! UIView
        backgroundView = viewFromNib.subviews[0]
        backgroundView!.frame = self.bounds
        backgroundView!.layer.cornerRadius = 10
        addSubview(backgroundView!)
        NSLayoutConstraint.activate([
            backgroundView!.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            backgroundView!.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            backgroundView!.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            backgroundView!.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
        ])
        let gesture = UITapGestureRecognizer(target: self, action: #selector(calloutTapped(_:)))
        backgroundView!.addGestureRecognizer(gesture)
    }
    @objc func calloutTapped(_ sender: UITapGestureRecognizer) {
        print("fuck shit")
    }
}
