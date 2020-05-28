//
//  GoodsToolsViewController.swift
//  Cafetom Point
//
//  Created by lion on 2020/05/06.
//  Copyright © 2020 lion. All rights reserved.
//

import UIKit

class GoodsToolsViewController: UIViewController{


    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /**
     ステータスバー白文字にする
     */
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    /**
     バーコードスキャン
     */
    @IBAction func barcodeScanBtn(_ sender: Any) {
        //操作フラグ バーコードからスキャン
        SysCom.operationCode = "Barcode-SCAN"
        // 比較価格画面に遷移[ShopSiteListView]
        SysCom.pageUrl = "ShopSiteListView"
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "BarCodeReaderView")
        self.present(nextVC!, animated: true, completion: nil)
        self.navigationController?.pushViewController(nextVC!, animated: true)
    }
    
    /**
     手動で検索
     */
    @IBAction func inputScanBtn(_ sender: Any) {
        //操作フラグ 手動でスキャン
        SysCom.operationCode = "Manual-SCAN"
        SysCom.barcodeNo = ""
        // 比較価格画面に遷移[ShopSiteListView]
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ShopSiteListView")
        self.present(nextVC!, animated: true, completion: nil)
        self.navigationController?.pushViewController(nextVC!, animated: true)
    }
    
    /**
     QRコードスキャン
     */
    @IBAction func qrcodeScanBtn(_ sender: Any) {
        //操作フラグ QRスキャン
       SysCom.operationCode = "QR-SCAN"
       //QRコード
       let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "BarCodeReaderView")
       self.present(nextVC!, animated: true, completion: nil)
       self.navigationController?.pushViewController(nextVC!, animated: true)
    }
    
}
