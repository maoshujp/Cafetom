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
    
    // URLエンコード
    static func urlEncode(string: String) -> String {
        return string.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
    }
    
    
}
