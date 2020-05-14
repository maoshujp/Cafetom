//
//  BarCodeReaderViewController.swift
//  Cafetom Point
//　Github管理するソース
// ソース整理
//  Created by lion on 2020/04/29.
//  Copyright © 2020 lion. All rights reserved.
//

import UIKit
import AVFoundation

class BarCodeReaderViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {

    //スキャンされたメンバーナンバー
    static var memberCardNo:String = ""
    
    //スキャンされたメンバータイプ
    static var memberCardType:String = ""
    
    //スキャンされた遷移元
    static var pageUrl:String = ""
    
    // カメラやマイクの入出力を管理するオブジェクトを生成
    private let session = AVCaptureSession()
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
    
        self.view.backgroundColor = .white
        //カメラやマイクのデバイスそのものを管理するオブジェクトを生成（ここではワイドアングルカメラ・ビデオ・背面カメラを指定）
        let discoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera],mediaType: .video,position: .back)
        // ワイドアングルカメラ・ビデオ・背面カメラに該当するデバイスを取得
        let devices = discoverySession.devices
        //　該当するデバイスのうち最初に取得したものを利用する
        if let backCamera = devices.first {
            do {
                
                // QRコードの読み取りに背面カメラの映像を利用するための設定
                let deviceInput = try AVCaptureDeviceInput(device: backCamera)
                    
                if self.session.canAddInput(deviceInput) {
                    self.session.addInput(deviceInput)
                    // 背面カメラの映像からQRコードを検出するための設定
                    let metadataOutput = AVCaptureMetadataOutput()
                    
                    if self.session.canAddOutput(metadataOutput) {
                        self.session.addOutput(metadataOutput)
                        metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
                        // 読み取りたいバーコードの種類を指定
                        metadataOutput.metadataObjectTypes = [.ean13,.code39,.code128,.qr]
                        // 読み取り可能エリアの設定を行う
                        // 画面の横、縦に対して、左が10%、上が40%のところに、横幅80%、縦幅20%を読み取りエリアに設定
                        let x: CGFloat = 0.1
                        let y: CGFloat = 0.4
                        let width: CGFloat = 0.8
                        let height: CGFloat = 0.2
                        metadataOutput.rectOfInterest = CGRect(x: y, y: 1 - x - width, width: height, height: width)
                        
                        // 背面カメラの映像を画面に表示するためのレイヤーを生成
                        let previewLayer = AVCaptureVideoPreviewLayer(session: self.session)
                        previewLayer.frame = self.view.bounds
                        previewLayer.videoGravity = .resizeAspectFill
                        self.view.layer.addSublayer(previewLayer)
                        
                        // 読み取り可能エリアに赤い枠を追加する
                        let detectionArea = UIView()
                        detectionArea.frame = CGRect(x: view.frame.size.width * x, y: view.frame.size.height * y, width: view.frame.size.width * width, height: view.frame.size.height * height)
                        detectionArea.layer.borderColor = UIColor.red.cgColor
                        detectionArea.layer.borderWidth = 3
                        view.addSubview(detectionArea)
                        
                        // 閉じるボタン
                        let closeBtn:UIButton = UIButton()
                        closeBtn.frame = CGRect(x: 20, y: 20, width: 100, height: 40)
                        closeBtn.setTitle("关闭", for: UIControl.State.normal)
                        closeBtn.backgroundColor = UIColor.lightGray
                        closeBtn.addTarget(self, action: #selector(closeTaped(sender:)), for: .touchUpInside)
                        self.view.addSubview(closeBtn)
                        // 読み取り開始
                        self.session.startRunning()
                        }
                    }
                } catch {
                    print("Error occured while creating video device input: \(error)")
                    }
            }
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /**
     バーコードを読む
     */
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
    
        for metadata in metadataObjects as! [AVMetadataMachineReadableCodeObject] {
            // バーコードの内容が空かどうかの確認
            if metadata.stringValue == nil { continue }
            // 読み取ったデータの値
            BarCodeReaderViewController.memberCardNo = metadata.stringValue!
            BarCodeReaderViewController.memberCardType = metadata.type.rawValue
            print(BarCodeReaderViewController.memberCardType)

            // 読み取り終了
            //let nextVC = storyboard?.instantiateViewController(withIdentifier: "MemberCardEnterView")
            if SysCom.operationCode == "QR-SCAN"{
                //遷移する
                let url = URL(string: SysCom.urlEncode(string: metadata.stringValue!))
                if( UIApplication.shared.canOpenURL(url!) ) {
                  UIApplication.shared.open(url!)
                }
            }else {
                let nextVC = storyboard?.instantiateViewController(withIdentifier: BarCodeReaderViewController.pageUrl)
                present(nextVC!, animated: true, completion: nil)
                self.navigationController?.pushViewController(nextVC!, animated: true)
            }
        }
    }
    // 閉じるが押されたら呼ばれます
    @objc func closeTaped(sender: UIButton) {
        // 読み取り終了
        self.session.stopRunning()
        self.dismiss(animated: true, completion: nil)
    }
}
