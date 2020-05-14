//
//  PathComViewController.swift
//  Cafetom Point
//
//  Created by lion on 2020/05/04.
//  Copyright © 2020 lion. All rights reserved.
//

import UIKit

class PathComViewController: UIViewController {
    
    //UserDefaults のインスタンス生成
    let userDefaults = UserDefaults.standard

    // ドキュメントディレクトリの「ファイルURL」（URL型）定義
    var documentDirectoryFileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

    // ドキュメントディレクトリの「パス」（String型）定義
    let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    
    //①画像を保存する関数の部分
    func saveImage(imageView:UIImageView,imageName:String) {
        createLocalDataFile(imageName:imageName)
        //pngで保存する場合
        let pngImageData = imageView.image!.pngData()
        do {
            try pngImageData!.write(to: documentDirectoryFileURL)
            //②「Documents下のパス情報をUserDefaultsに保存する」
            userDefaults.set(documentDirectoryFileURL, forKey: "userImage")
        } catch {
            //エラー処理
            print("エラー: \(imageName)" )
        }
    }
    
    //②保存するためのパスを作成する
    func createLocalDataFile(imageName:String) {
        // 作成するテキストファイルの名前
        let fileName = imageName
        // DocumentディレクトリのfileURLを取得
        if documentDirectoryFileURL != nil {
            // ディレクトリのパスにファイル名をつなげてファイルのフルパスを作る
            let path = documentDirectoryFileURL.appendingPathComponent(fileName)
            documentDirectoryFileURL = path
            print("path: \(path)" )
         }
     }
    
    /**
     会員カード画像を取得する
     */
    func getMemberCardIV(memberCardNoImgName:String) ->UIImage!{
        let noimage = UIImage(named: "no_image")
        let fileURL = URL(fileURLWithPath: filePath).appendingPathComponent(memberCardNoImgName)
        let path = String(describing: UserDefaults.standard.url(forKey: "userImage"))
        if let image = UIImage(contentsOfFile: fileURL.path) {
            let image = UIImageView(image: image)
            return image.image!
        }else{
            print("指定されたファイル\(memberCardNoImgName)が見つかりません")
        }
        return noimage
    }
}
