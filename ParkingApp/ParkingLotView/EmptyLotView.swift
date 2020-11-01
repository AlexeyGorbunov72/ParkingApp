//
//  EmptyLotView.swift
//  ParkingApp
//
//  Created by Alexey on 01.11.2020.
//

import UIKit

class EmptyLotView: UIView {
    var isOpenFull = false
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
        self.label?.text = "\(countFreeSpaces)"
        self.frame.size = pic!.frame.size
        self.frame.size.height += 5
        UIView.animate(withDuration: 0.3, delay: 0.0, options: [.preferredFramesPerSecond60, .transitionFlipFromLeft], animations: {
            self.layoutIfNeeded()
            self.backgroundView!.backgroundColor = .green
        }, completion: nil)
        
    }
    private func setOccupated(){
        self.label?.text = ""
        self.frame.size = pic!.frame.size
        self.frame.size.height += 5
        UIView.animate(withDuration: 0.3, delay: 0.0, options: [.preferredFramesPerSecond60, .layoutSubviews, .curveEaseOut], animations: {
            self.layoutIfNeeded()
            self.backgroundView!.backgroundColor = .systemPink
        }, completion: nil)
       
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        
    }
    convenience init(){
        self.init(frame: CGRect(x: 0, y: 0, width: 73, height: 64))
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setup(){
        let viewFromNib = Bundle.main.loadNibNamed("EmptyLotView", owner: self, options: nil)![0] as! UIView
        backgroundView = viewFromNib.subviews[0]
        backgroundView!.frame = self.bounds
        backgroundView!.layer.cornerRadius = 10
        backgroundView?.clipsToBounds = true
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
    private func openToFull(){
        self.frame.size = CGSize(width: 73, height: 101)
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: [.preferredFramesPerSecond60, .curveEaseOut], animations: {
            self.layoutIfNeeded()
        }, completion: nil)
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 5){
            DispatchQueue.main.async {
                self.setFree()
                self.isOpenFull = false
            }
        }
    }
    @objc func calloutTapped(_ sender: UITapGestureRecognizer) {
        if isOpenFull {
            setFree()
            isOpenFull = false
            
        } else if countFreeSpaces > 0{
            openToFull()
            isOpenFull = true
        }
                   
    }
}
