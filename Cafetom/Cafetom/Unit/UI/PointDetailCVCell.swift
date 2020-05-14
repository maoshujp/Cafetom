//
//  PointDetailCVCell.swift
//  Cafetom Point
//
//  Created by lion on 2020/05/08.
//  Copyright © 2020 lion. All rights reserved.
//

import UIKit

class PointDetailCVCell: UICollectionViewCell {
    @IBOutlet weak var shopStampImgIV: UIImageView!
    @IBOutlet weak var pointNumLbl: UILabel!
    
    func setupCell(pointInfo: PointDto) {
        if(!pointInfo.shopLogoImg.isEmpty){
            self.shopStampImgIV.image = UIImage(named: pointInfo.shopLogoImg)
        }else {
            self.pointNumLbl.text = String(pointInfo.pointNum)
        }
    }
    
}
