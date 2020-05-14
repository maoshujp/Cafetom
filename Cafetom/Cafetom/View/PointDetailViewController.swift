//
//  PointDetailViewController.swift
//  Cafetom Point
//
//  Created by lion on 2020/05/08.
//  Copyright © 2020 lion. All rights reserved.
//

import UIKit


class PointDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{

    
    @IBOutlet weak var listCV: UICollectionView!
    
    //Presenterを初期化する
    var bussinessPresenter = BussinessPresenter()
    //データリスト
    var pointDto = PointDto()
    //データ件数
    var dataCount:Int = 0
    //
    var dataIndex = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initData()
        
        // 下向きにスワイプした時のジェスチャーを作成
        let downSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.closeModalView))
        downSwipeGesture.direction = .down

        // 画面にジェスチャーを登録
        view.addGestureRecognizer(downSwipeGesture)
    }
    
    /**
     画面データを読み込み
     */
    func initData(){
        //TableView初期設定
        listCV.delegate = self
        listCV.dataSource = self
        
        pointDto = bussinessPresenter.getPointDataByShopId(schShopId: SysCom.shopId)
        dataCount = pointDto.shopPointCount
    }
    
    /**
     セル件数を戻す
     */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataCount
    }
    
    /**
     データを表示する
     */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DataCell", for: indexPath)
       //セル枠線
       cell.layer.borderWidth = 1
       cell.layer.borderColor = UIColor.gray.cgColor
        
       
       if let cell = cell as? PointDetailCVCell {
        //データ加工
        var madePoint = PointDto()
        madePoint = pointDto
        //ポイント < データindexの場合、スタンプなし、次のポイント値を表示する
        if madePoint.point < dataIndex{
            madePoint.shopLogoImg = ""
            madePoint.pointNum = dataIndex
        }
        //データindex
        dataIndex = dataIndex + 1
        
        cell.setupCell(pointInfo: madePoint)
       }

       return cell
    }
    
    //セルの配置について決める
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let horizontalSpace : CGFloat = 4
        let cellSize : CGFloat = self.view.bounds.width / 6 - horizontalSpace
       
        return CGSize(width: cellSize, height: cellSize)
    }
    
    /**
     閉じる
     */
    @IBAction func backBtn(_ sender: Any) {
        SysCom.shopId = ""
        // 自画面閉じる
        closeModalView()
    }
    
    // 画面を閉じる
    @objc func closeModalView() {
        dismiss(animated: true, completion: nil)
    }
    
    
}
