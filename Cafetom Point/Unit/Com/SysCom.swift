//
//  SysCom.swift
//  Cafetom Point
//
//  Created by lion on 2020/05/07.
//  Copyright © 2020 lion. All rights reserved.
//

import Foundation

class SysCom{
    
    //操作コード
    static var operationCode = ""
    
    //ショップID
    static var shopId = ""
    
    //スキャンされたバーコード
    static var barcodeNo:String = ""
    
    //スキャンされたメンバータイプ
    static var barcodeType:String = ""
    
    //スキャンされた遷移元
    static var pageUrl:String = ""
    
    // URLエンコード
    static func urlEncode(string: String) -> String {
        return string.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
    }
    
    
}
