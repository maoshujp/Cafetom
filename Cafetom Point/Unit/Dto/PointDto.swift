//
//  PointDto.swift
//  Cafetom Point
//
//  Created by lion on 2020/05/08.
//  Copyright © 2020 lion. All rights reserved.
//

import Foundation

class PointDto:BaseDto{
    
    private var _point:Int = 0
    private var _shopPointCount:Int = 0
    private var _pointNum:Int = 0
    
    /**
       ポイント
     */
     var point: Int {
        get {
            return _point
        }
        set {
            _point = newValue
        }
    }
    
    /**
       ポイントゴール数
     */
     var shopPointCount: Int {
        get {
            return _shopPointCount
        }
        set {
            _shopPointCount = newValue
        }
    }
    
    /**
       スタンプ数
     */
     var pointNum: Int {
        get {
            return _pointNum
        }
        set {
            _pointNum = newValue
        }
    }
    
    
    
}
