//
//  MemberCardListViewController.swift
//  Cafetom Point
//
//  Created by lion on 2020/04/29.
//  Copyright © 2020 lion. All rights reserved.
//

import UIKit

class MemberCardListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var cardCountLbl: UILabel!
    @IBOutlet weak var listTV: UITableView!
    //Presenterを初期化する
    var bussinessPresenter = BussinessPresenter()
    //TableViewデータリスト
    var memberCardItems:[MemberCardDto] = [MemberCardDto]()
    //データ件数
    var dataCount:Int = 0
    
    static var memberCardNo:String = ""
    static var memberCardType:String = ""
    static var shopName:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initData();

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initData();
        listTV.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /**
     ステータスバー白文字にする
     */
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    /**
     画面データを読み込み
     */
    func initData(){
        //TableView初期設定
        listTV.delegate = self
        listTV.dataSource = self
        
        memberCardItems = bussinessPresenter.getMemberCardDataList()
        dataCount = memberCardItems.count
        cardCountLbl.text = String(memberCardItems.count)
    }
    
    /**
      データ件数
      */
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return dataCount
     }
     
     /**
      セルを表示する
      */
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: CardImgTVCell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! CardImgTVCell
        //かステムセルを設定する
        cell.setCell(cardInfo: memberCardItems[indexPath.row])
        
        return cell
     }

     //行選択イベント
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         //static変数を設定する
         MemberCardListViewController.shopName = memberCardItems[indexPath.row].shopName
         MemberCardListViewController.memberCardNo = memberCardItems[indexPath.row].memberCardNo
         MemberCardListViewController.memberCardType  =  memberCardItems[indexPath.row].memberCardType
        
         // バーコード表示画面に遷移
         let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "BarCodeCreateView")
         self.present(nextVC!, animated: true, completion: nil)
         self.navigationController?.pushViewController(nextVC!, animated: true) 
     }

}
