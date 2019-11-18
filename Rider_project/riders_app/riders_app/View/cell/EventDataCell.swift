//
//  EventDataCell.swift
//  riders_app
//
//  Created by admin on 8/31/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class EventDataCell: UICollectionViewCell {
    @IBOutlet weak var aImage: UIImageView!
    @IBOutlet weak var aTitle: UILabel!
    @IBOutlet weak var aDes: UILabel!
    @IBOutlet weak var aDes2: UILabel!
    

    
    
    
    func updateDataCell(data: EventData) {
        
        self.aImage.backgroundColor = .green
        self.aTitle.text = data.title!
        self.aDes.text = data.des!
        self.aDes2.text = data.des2!
        self.contentView.layer.cornerRadius = 10.0
        self.contentView.layer.borderWidth = 0.5
        self.contentView.layer.borderColor = UIColor.gray.cgColor
        self.contentView.clipsToBounds = true
        
//        self.aTitle.sizeToFit()
//        self.aTitle.setNeedsDisplay()
//        self.aDes.sizeToFit()
//        self.aDes.setNeedsDisplay()
//        self.aDes2.sizeToFit()
//        self.aDes2.setNeedsDisplay()
//        self.layoutIfNeeded()

    }
    
}
