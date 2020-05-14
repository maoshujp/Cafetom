//
//  BarCodeCreateViewController.swift
//  Cafetom Point
//
//  Created by lion on 2020/04/30.
//  Copyright © 2020 lion. All rights reserved.
//

import UIKit

class BarCodeCreateViewController: UIViewController {

    @IBOutlet weak var memberCardNoLbl: UILabel!
    @IBOutlet weak var shopNameLbl: UILabel!
    @IBOutlet weak var barcodeIV: UIImageView!
    @IBOutlet weak var frontIV: UIImageView!
    @IBOutlet weak var reverseIV: UIImageView!
    
    var pathComViewController = PathComViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        shopNameLbl.text = MemberCardListViewController.shopName
        memberCardNoLbl.text = MemberCardListViewController.memberCardNo
        //会員No.表示ラベルの間隔を装飾
        let attributedString = NSMutableAttributedString(string: MemberCardListViewController.memberCardNo)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: CGFloat(1.4), range: NSRange(location: 0, length: MemberCardListViewController.memberCardNo.count))

        memberCardNoLbl.attributedText = attributedString
               
        if MemberCardListViewController.memberCardType.contains("EAN-13"){
            barcodeIV.image = CreateCodeImageCom.generateEan13Barcode(string: MemberCardListViewController.memberCardNo)
        }else if MemberCardListViewController.memberCardType.contains("Code39"){
            barcodeIV.image = CreateCodeImageCom.generateCode39Barcode(string: MemberCardListViewController.memberCardNo)
        }else if MemberCardListViewController.memberCardType.contains("Code128"){
            barcodeIV.image = CreateCodeImageCom.generateCode128Barcode(string: MemberCardListViewController.memberCardNo)
        }

        frontIV.image = pathComViewController.getMemberCardIV(memberCardNoImgName: MemberCardListViewController.memberCardNo + "_front.jpeg")
        frontIV.contentMode = UIView.ContentMode.scaleAspectFill
        self.frontIV.layer.cornerRadius = self.frontIV.frame.size.width * 0.05
        self.frontIV.clipsToBounds = true
        
        reverseIV.image = pathComViewController.getMemberCardIV(memberCardNoImgName: MemberCardListViewController.memberCardNo + "_reverse.jpeg")
        reverseIV.contentMode = UIView.ContentMode.scaleAspectFill
        self.reverseIV.layer.cornerRadius = self.reverseIV.frame.size.width * 0.05
        self.reverseIV.clipsToBounds = true
        
        // 下向きにスワイプした時のジェスチャーを作成
        let downSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.closeModalView))
        downSwipeGesture.direction = .down

        // 画面にジェスチャーを登録
        view.addGestureRecognizer(downSwipeGesture)
    }
    
    @IBAction func closeBtn(_ sender: Any) {
        
        closeModalView()
    }
    
    // 画面を閉じる
    @objc func closeModalView() {
        dismiss(animated: true, completion: nil)
    }
}
