//
//  BaseDto.swift
//  Cafetom Point
//
//  Created by lion on 2020/04/29.
//  Copyright © 2020 lion. All rights reserved.
//

import Foundation

class BaseDto{
    
    private var _shopId:String = ""
    private var _shopName:String = ""
    private var _shopOrder:Int = 0
    private var _shopLogoImg:String = ""
    private var _shopMessage:String = ""
    private var _customId:String = ""
    private var _effectiveFlg:Bool = true
    private var _effectiveStartDate:Date = Date()
    private var _effectiveEndDate:Date = Date()
    
    init() {
        
    }
  
    /**
       ショップID
     */
     var shopId: String {
        get {
            return _shopId
        }
        set {
            _shopId = newValue
        }
    }
    
    /**
       ショップname
     */
     var shopName: String {
        get {
            return _shopName
        }
        set {
            _shopName = newValue
        }
    }
    /**
       ショップ表示順
     */
     var shopOrder: Int {
        get {
            return _shopOrder
        }
        set {
            _shopOrder = newValue
        }
    }
    /**
       ショップロゴ
     */
     var shopLogoImg: String {
        get {
            return _shopLogoImg
        }
        set {
            _shopLogoImg = newValue
        }
    }
    
    /**
       ショップ メッセージ
     */
     var shopMessage: String {
        get {
            return _shopMessage
        }
        set {
            _shopMessage = newValue
        }
    }
    
    /**
       顧客ID
     */
     var customId: String {
        get {
            return _customId
        }
        set {
            _customId = newValue
        }
    }
    
    /**
       有効フラグ
     */
     var effectiveFlg: Bool {
        get {
            return _effectiveFlg
        }
        set {
            _effectiveFlg = newValue
        }
    }
    
    /**
       有効開始日
     */
     var effectiveStartDate: Date {
        get {
            return _effectiveStartDate
        }
        set {
            _effectiveStartDate = newValue
        }
    }
    
    /**
       有効終了日
     */
     var effectiveEndDate: Date {
        get {
            return _effectiveEndDate
        }
        set {
            _effectiveEndDate = newValue
        }
    }
    
}

