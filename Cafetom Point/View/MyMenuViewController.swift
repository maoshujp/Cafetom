//
//  MyMenuViewController.swift
//  Cafetom Point
//  Github 管理する
//  Created by lion on 2020/04/29.
//  Copyright © 2020 lion. All rights reserved.
//

import UIKit

class MyMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var listTV: UITableView!
    // Sectionで使用する配列を定義する.
    private let mySections: NSArray = ["我的会员卡", "高级设置"]
    // マイメニュー
    private let customItems: NSArray = ["扫码添加会员卡","手动添加会员卡"]
    private let customIconItems: NSArray = ["barcode","square.and.pencil"]
    
    //ショップメニュー
    private let shopItems: NSArray = ["添加比价网址","添加我的信息"]
    private let shopIconItems: NSArray = ["doc.text.viewfinder","rectangle.split.3x1"]
    

    
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
            // スキャン追加画面に遷移[MemberCardEnterView]
            BarCodeReaderViewController.memberCardNo = ""
            BarCodeReaderViewController.pageUrl = "MemberCardEnterView"
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "BarCodeReaderView")
            self.present(nextVC!, animated: true, completion: nil)
            self.navigationController?.pushViewController(nextVC!, animated: true)
          } else if indexPath.row == 1{
             // 手動追加画面に遷移
            BarCodeReaderViewController.memberCardNo = ""
            let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "MemberCardEnterView")
            self.present(nextVC!, animated: true, completion: nil)
            self.navigationController?.pushViewController(nextVC!, animated: true)
          } else if indexPath.row == 2{

          }
            
         } else if indexPath.section == 1 {
             // 画面に遷移
             if indexPath.row == 0{
             }else if indexPath.row == 1{
               
            }
         }
     }

}
