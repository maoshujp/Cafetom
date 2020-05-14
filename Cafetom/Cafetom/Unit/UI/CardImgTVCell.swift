//
//  CardImgTVCell.swift
//  Cafetom Point
//
//  Created by lion on 2020/05/06.
//  Copyright © 2020 lion. All rights reserved.
//

import UIKit

class CardImgTVCell: UITableViewCell {

    @IBOutlet weak var cardIV: UIImageView!
    @IBOutlet weak var shopNameLbl: UILabel!
    
    //ローカル画像を表示する
    var pathComViewController = PathComViewController()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(cardInfo :MemberCardDto) {
        // 角丸にする
        self.cardIV.layer.cornerRadius = self.cardIV.frame.size.width * 0.1
        self.cardIV.clipsToBounds = true
        
        self.shopNameLbl.text = cardInfo.shopName
        //ローカルの画像
        self.cardIV.image = pathComViewController.getMemberCardIV(memberCardNoImgName: cardInfo.memberCardNo + "_front.jpeg")
        
        // ネット画像で表示する
        //let url = NSURL(string:point.shopLogoImgUrl);
        //do {
            //let imageData :NSData = try NSData(contentsOf: url! as URL, options: NSData.ReadingOptions.mappedIfSafe)
            //self.shopLogoImg.image = UIImage(data:imageData as Data)
         //   }catch {
                // エラー処理
         //   }
    }

}
