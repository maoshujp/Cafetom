//
//  GoodsToolsViewController.swift
//  Cafetom Point
//
//  Created by lion on 2020/05/06.
//  Copyright © 2020 lion. All rights reserved.
//

import UIKit

class GoodsToolsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var listTV: UITableView!
    // Sectionで使用する配列を定義する.
    private let mySections: NSArray = ["比一比","聚划算"]
    // 価格
    private let customItems: NSArray = ["扫码比价","手动比价","扫二维码"]
    private let customIconItems: NSArray = ["barcode","square.and.pencil","qrcode.viewfinder"]
    //クーポン
    private let shopItems: NSArray = ["优惠券","积分卡"]
    private let shopIconItems: NSArray = ["rectangle.split.3x1","rectangle.split.3x3"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // DataSourceの設定をする.
        listTV.dataSource = self
        // Delegateを設定する.
        listTV.delegate = self

    }

    
    /*
     セクションの数を返す.
    */
    func numberOfSections(in tableView: UITableView) -> Int {
      return mySections.count
    }
         
     /*
        セクションのタイトルを返す.
     */
      func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
         return mySections[section] as? String
     }
      
      /*
      テーブルに表示する配列の総数を返す.
      */
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          if section == 0 {
              return customItems.count
          } else if section == 1 {
              return shopItems.count
          } else {
              return 0
          }
      }
      
      /*
        Cellに値を設定する.
      */
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
          
          if indexPath.section == 0 {
              cell.textLabel?.text = "\(customItems[indexPath.row])"
              cell.imageView?.image = UIImage(systemName: customIconItems[indexPath.row] as! String)
          } else if indexPath.section == 1 {
              cell.textLabel?.text = "\(shopItems[indexPath.row])"
              cell.imageView?.image = UIImage(systemName: shopIconItems[indexPath.row] as! String)
          }

          return cell
      }

         
     /*
        Cellが選択された際に呼び出される.
     */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
         if indexPath.section == 0 {
            // 画面に遷移
            if indexPath.row == 0{
                //操作フラグ バーコードからスキャン
                SysCom.operationCode = "Barcode-SCAN"
                // 比較価格画面に遷移[ShopSiteListView]
                BarCodeReaderViewController.pageUrl = "ShopSiteListView"
                let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "BarCodeReaderView")
                self.present(nextVC!, animated: true, completion: nil)
                self.navigationController?.pushViewController(nextVC!, animated: true)
            }else if indexPath.row == 1{
                //操作フラグ 手動でスキャン
                SysCom.operationCode = "Manual-SCAN"
                BarCodeReaderViewController.memberCardNo = ""
                // 比較価格画面に遷移[ShopSiteListView]
                let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ShopSiteListView")
                self.present(nextVC!, animated: true, completion: nil)
                self.navigationController?.pushViewController(nextVC!, animated: true)
            } else if indexPath.row == 2{
                //操作フラグ QRスキャン
                SysCom.operationCode = "QR-SCAN"
                //QRコード
                let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "BarCodeReaderView")
                self.present(nextVC!, animated: true, completion: nil)
                self.navigationController?.pushViewController(nextVC!, animated: true)
            }
         }
    }
}
