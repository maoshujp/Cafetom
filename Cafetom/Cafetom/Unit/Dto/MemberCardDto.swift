//
//  MemberCardDto.swift
//  Cafetom Point
//
//  Created by lion on 2020/04/29.
//  Copyright © 2020 lion. All rights reserved.
//

import Foundation

class MemberCardDto:BaseDto{
    
    private var _memberCardNo:String = ""
    private var _memberCardType:String = ""
    private var _frontImg:String = ""
    private var _reverseImg:String = ""
    
    /**
       メンバーカードナンバー
     */
     var memberCardNo: String {
        get {
            return _memberCardNo
        }
        set {
            _memberCardNo = newValue
        }
    }
    
    /**
       メンバーカードタイプ
     */
     var memberCardType: String {
        get {
            return _memberCardType
        }
        set {
            _memberCardType = newValue
        }
    }
    
    /**
       表面写真
     */
     var frontImg: String {
        get {
            return _frontImg
        }
        set {
            _frontImg = newValue
        }
    }
    
    /**
       裏面写真
     */
     var reverseImg: String {
        get {
            return _reverseImg
        }
        set {
            _reverseImg = newValue
        }
    }
    
}
