//
//  MemberCardEnterViewController.swift
//  Cafetom Point
//
//  Created by lion on 2020/04/29.
//  Copyright © 2020 lion. All rights reserved.
//

import UIKit

class MemberCardEnterViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var memberCardNoTxt: UITextField!
    @IBOutlet weak var shopNameTxt: UITextField!
    @IBOutlet weak var frontIV: UIImageView!
    @IBOutlet weak var reverseIV: UIImageView!
    
    var bussinessPresenter = BussinessPresenter()
    //写真フラグ(表面／裏面)
    var selPictuerFlg:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.memberCardNoTxt.text = SysCom.barcodeNo
        self.memberCardNoTxt.delegate = self
        self.shopNameTxt.delegate = self
        
        // 下向きにスワイプした時のジェスチャーを作成
        let downSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.closeModalView))
        downSwipeGesture.direction = .down

        // 画面にジェスチャーを登録
        view.addGestureRecognizer(downSwipeGesture)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /**
     キーボードを閉じる
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    /**
     閉じる
     */
    @IBAction func closeBtn(_ sender: Any) {
        closeModalView()
    }
    
    
    // 画面を閉じる
    @objc func closeModalView() {
        dismiss(animated: true, completion: nil)
    }
    
    /**
    画像を選択する
    */
    @IBAction func selectPictureBtn(_ sender: Any) {
        // カメラロールが利用可能か？
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            // 写真を選ぶビュー
            let pickerView = UIImagePickerController()
            // 写真の選択元をカメラロールにする
            // 「.camera」にすればカメラを起動できる
            pickerView.sourceType = .photoLibrary
            // デリゲート
            pickerView.delegate = self
            // ビューに表示
            self.present(pickerView, animated: true)
            //表面ビューに表示フラグ
            selPictuerFlg = "front"
        }
    }
    
    /**
     裏面写真を選択する
     */
    @IBAction func selectPictureRBtn(_ sender: Any) {
        // カメラロールが利用可能か？
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            // 写真を選ぶビュー
            let pickerView = UIImagePickerController()
            // 写真の選択元をカメラロールにする
            // 「.camera」にすればカメラを起動できる
            pickerView.sourceType = .photoLibrary
            // デリゲート
            pickerView.delegate = self
            // ビューに表示
            self.present(pickerView, animated: true)
            //表面ビューに表示フラグ
            selPictuerFlg = "reverse"
        }
    }
    
    
    
    /**
     確定ボタン
     */
    @IBAction func enterBtn(_ sender: Any) {
        let memberCardDto = MemberCardDto()
        //データ保存
        memberCardDto.memberCardNo = self.memberCardNoTxt.text!
        memberCardDto.shopName = self.shopNameTxt.text!
        memberCardDto.memberCardType = SysCom.barcodeType
        memberCardDto.frontImg = memberCardDto.memberCardNo + "_front.jpeg"
        memberCardDto.reverseImg = memberCardDto.memberCardNo + "_reverse.jpeg"
        bussinessPresenter.createMemberCard(newMemberCardDto: memberCardDto)
        //写真を保存する
        var pathComViewController = PathComViewController()
        pathComViewController.saveImage(imageView: frontIV,imageName: memberCardDto.frontImg)
        
        var pathComViewControllerR = PathComViewController()
        pathComViewControllerR.saveImage(imageView: reverseIV,imageName: memberCardDto.reverseImg)
        //閉じる
        self.dismiss(animated: true, completion: nil)
    }
}

/**
  写真を表示
 */
extension MemberCardEnterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // 写真を選んだ後に呼ばれる処理
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 選択した写真を取得する
        let image = info[.originalImage] as! UIImage
        if self.selPictuerFlg == "front"{
            // ビューに表示する
            frontIV.image = image
        }else {
            // ビューに表示する
            reverseIV.image = image
        }
        // 写真を選ぶビューを引っ込める
        self.dismiss(animated: true)
    }
}
