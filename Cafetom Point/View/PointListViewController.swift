//
//  PointListViewController.swift
//  Cafetom Point
//
//  Created by lion on 2020/05/08.
//  Copyright © 2020 lion. All rights reserved.
//

import UIKit


class PointListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var cardCountLbl: UILabel!
    @IBOutlet weak var listTV: UITableView!
    //Presenterを初期化する
    var bussinessPresenter = BussinessPresenter()
    //TableViewデータリスト
    var pointItems:[PointDto] = [PointDto]()
    //データ件数
    var dataCount:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initData();
        //bussinessPresenter.deletePointData()
        //bussinessPresenter.createPointData()
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
        
        pointItems = bussinessPresenter.getPointList()
        dataCount = pointItems.count
        //カード枚数
        cardCountLbl.text = String(dataCount)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: PointTVCell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! PointTVCell
        //かステムセルを設定する
        cell.setCell(pointInfo: pointItems[indexPath.row])
        
        return cell
    }
    
     /*
        Cellが選択された際に呼び出される.
     */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
        SysCom.shopId = pointItems[indexPath.row].shopId
         // 表示画面に遷移
         let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "PointDetailView")
         self.present(nextVC!, animated: true, completion: nil)
         self.navigationController?.pushViewController(nextVC!, animated: true) 
    }
    
}
