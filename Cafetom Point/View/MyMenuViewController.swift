//
//  MyMenuViewController.swift
//  Cafetom Point
//  これはGithub管理したソース
//  Created by lion on 2020/04/29.
//  Copyright © 2020 lion. All rights reserved.
//

import UIKit

class MyMenuViewController: UIViewController {

    @IBOutlet weak var listTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /**
     スキャン追加
     */
    @IBAction func scanAddMemCardBtn(_ sender: Any) {
        // スキャン追加画面に遷移[MemberCardEnterView]
        SysCom.barcodeNo = ""
        SysCom.pageUrl = "MemberCardEnterView"
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "BarCodeReaderView")
        self.present(nextVC!, animated: true, completion: nil)
        self.navigationController?.pushViewController(nextVC!, animated: true)
        
    }
    
    /**
    手入力追加
    */
    @IBAction func inputAddMemCardBtn(_ sender: Any) {
        // 手動追加画面に遷移
        SysCom.barcodeNo = ""
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "MemberCardEnterView")
        self.present(nextVC!, animated: true, completion: nil)
        self.navigationController?.pushViewController(nextVC!, animated: true)
        
    }
    
}
