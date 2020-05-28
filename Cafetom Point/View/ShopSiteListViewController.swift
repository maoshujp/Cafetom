//
//  ShopSiteListViewController.swift
//  Cafetom Point
//
//  Created by lion on 2020/05/01.
//  Copyright © 2020 lion. All rights reserved.
//

import UIKit

class ShopSiteListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate{

    @IBOutlet weak var listTV: UITableView!
    @IBOutlet weak var keywordTxt: UITextField!
    
    var keyword:String = ""
    private let shopSiteItems: NSArray = ["雅虎","乐天","亚马逊","PayPay","最安値.Com","赤ちゃん本舗"]
    
    /**
     画面初期化する
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        // DataSourceの設定をする.
        listTV.dataSource = self
        // Delegateを設定する.
        listTV.delegate = self
        //バーコードNo.
        self.keywordTxt.text = SysCom.barcodeNo
        //キーを入れる
        keyword = self.keywordTxt.text!
        self.keywordTxt.delegate = self
        // 下向きにスワイプした時のジェスチャーを作成
        let downSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.closeModalView))
        downSwipeGesture.direction = .down

        // 画面にジェスチャーを登録
        view.addGestureRecognizer(downSwipeGesture)
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
     データ件数
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopSiteItems.count;
    }
    
    /**
     セルを表示する
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        // セルに表示する値を設定する
        cell.textLabel!.text = shopSiteItems[indexPath.row] as!String
           
        return cell
    }
    
    //行選択イベント
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        keyword = self.keywordTxt.text!
        
        var goodslink :String = "http://www.cafetom.com"
        
        if indexPath.row == 0 {
            //ヤフ
            goodslink = "https://shopping.yahoo.co.jp/search?first=1&tab_ex=commerce&fr=shp-prop&oq=&aq=&mcr=6b4aec3bd04cdacd73640ee2362e5dae&ts=1588307403&p=" + keyword + "&cid=&pf=&pt=&area=13&dlv=&sretry=1&sc_i=shp_pc_top_searchBox_2&sretry=1"
        }else if indexPath.row == 1 {
            //楽天市場
            goodslink = "https://search.rakuten.co.jp/search/mall/" + keyword + "/?f=1&grp=product"
        }else if indexPath.row == 2 {
            //アマゾン
            goodslink = "https://www.amazon.co.jp/s?k=" + keyword + "&ref=nb_sb_noss"
        }else if indexPath.row == 3 {
            //Paypay
            goodslink = "https://paypaymall.yahoo.co.jp/search?p=" + keyword + "&b=1"
        }else if indexPath.row == 4 {
            //最安値.com
            goodslink = "https://www.saiyasune.com/J" + keyword + ".html"
            if SysCom.barcodeNo.isEmpty{
                //スペースを置換
                var newStr = keyword.replacingOccurrences(of: " ", with: "+")
                newStr = keyword.replacingOccurrences(of: "　", with: "+")
                goodslink = "https://www.saiyasune.com/I1W" + newStr + ".html"
                print(goodslink)
            }
        }else if indexPath.row == 5 {
            //Paypay
            goodslink = "https://akachan.omni7.jp/search/?keyword=" + keyword + "&searchKeywordFlg=1&intpr=ah_frmng_top_headnav_schbox&userKeywordFlg=1"
        }
        //遷移する
        let url = URL(string: SysCom.urlEncode(string: goodslink))
        if( UIApplication.shared.canOpenURL(url!) ) {
          UIApplication.shared.open(url!)
        }
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
}

