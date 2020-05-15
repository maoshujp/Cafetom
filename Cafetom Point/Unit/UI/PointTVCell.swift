//
//  PointTVCell.swift
//  Cafetom Point
//
//  Created by lion on 2020/05/08.
//  Copyright © 2020 lion. All rights reserved.
//

import UIKit

class PointTVCell: UITableViewCell {

    @IBOutlet weak var shopLogoImgIV: UIImageView!
    @IBOutlet weak var shopNameLbl: UILabel!
    @IBOutlet weak var shopMessageLbl: UILabel!
    @IBOutlet weak var pointLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(pointInfo :PointDto) {
        // 角丸にする
        self.shopLogoImgIV.layer.cornerRadius = self.shopLogoImgIV.frame.size.width * 0.1
        self.shopLogoImgIV.clipsToBounds = true
        
        self.shopNameLbl.text = pointInfo.shopName
        self.shopMessageLbl.text = pointInfo.shopMessage
        self.pointLbl.text = ""
        if pointInfo.point > 0 {
            self.pointLbl.text = "积分:" + String(pointInfo.point)
        }
        //ローカルの画像
        self.shopLogoImgIV.image = UIImage(named: pointInfo.shopLogoImg)
    
        /**
        // ネット画像で表示する
        var logoImgUrl:String = "http://www.cafetom.com/images/shopLogo/" + pointInfo.shopLogoImg + ".jpg"
        let url = NSURL(string:logoImgUrl);
        do {
            let imageData :NSData = try NSData(contentsOf: url! as URL, options: NSData.ReadingOptions.mappedIfSafe)
            self.shopLogoImgIV.image = UIImage(data:imageData as Data)
            }catch {
                // エラー処理
            }
         */
    }

}
