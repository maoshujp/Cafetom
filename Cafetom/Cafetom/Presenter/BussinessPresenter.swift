//
//  BussinessPresenter.swift
//  Cafetom Point
//
//  Created by lion on 2020/04/29.
//  Copyright © 2020 lion. All rights reserved.
//

import Foundation

class BussinessPresenter{
    
    //データモデル
    let dbAccessModel = DbAccessModel(dataModelName :"CafetomPoint");
    
    //メンバーカードテーブルを書込み
    func createMemberCard(newMemberCardDto:MemberCardDto){
        print("shopName:\(newMemberCardDto.shopName)")
        print("member card is:\(newMemberCardDto.memberCardNo) : \(newMemberCardDto.memberCardType)")
        dbAccessModel.createMemberCardData(newMemberCardDto: newMemberCardDto)
    }
    
    //会員カードマスタを取得する
    private func fetchMemberCard() -> [MEMBER_CARD_M] {
        return dbAccessModel.fetchMemberCardList()
    }
    
    //会員カードマスタを取得する
    func getMemberCardDataList() -> [MemberCardDto] {
        
        var list:[MemberCardDto] = [MemberCardDto]()
        
        for memberCardMst in fetchMemberCard(){
            let memberCardDto:MemberCardDto! = MemberCardDto()
            memberCardDto.shopName = memberCardMst.shopName!
            memberCardDto.memberCardNo = memberCardMst.memberCardNo!
            memberCardDto.memberCardType = memberCardMst.memberCardType!
            memberCardDto.frontImg = memberCardMst.frontImg!
            memberCardDto.reverseImg = memberCardMst.reverseImg!
            list.append(memberCardDto)
        }
        
        return list
    }
    
    //ポイントマスタを取得する
    private func fetchPoint() -> [POINT_M_VIEW] {
        return dbAccessModel.fetchPointList()
    }
    
    //ポイントマスタを取得する
    private func fetchPointData(schShopId:String) -> [POINT_M_VIEW] {
        return dbAccessModel.fetchPointDataByShopId(shopId: schShopId)
    }
    
    //ポイントマスタを取得する
    func getPointList() -> [PointDto] {
        
        var list:[PointDto] = [PointDto]()
        
        for pointMst in fetchPoint(){
            let pointDto:PointDto! = PointDto()
            pointDto.customId = pointMst.customId!
            pointDto.shopId = pointMst.shopId!
            pointDto.point = Int(pointMst.point)
            pointDto.shopPointCount = Int(pointMst.shopPointCount)
            pointDto.shopLogoImg = pointMst.shopLogoImg!
            pointDto.shopMessage = pointMst.shopMessage!
            pointDto.shopName = pointMst.shopName!
            pointDto.shopOrder = Int(pointMst.shopOrder)
            pointDto.effectiveFlg = pointMst.effectiveFlg
            pointDto.effectiveStartDate = pointMst.effectiveStartDate as! Date
            pointDto.effectiveEndDate = pointMst.effectiveEndDate as! Date
            list.append(pointDto)
        }
        
        return list
    }
    
    //ポイントマスタを取得する
    func getPointDataByShopId(schShopId:String) -> PointDto {
        
        var list:[PointDto] = [PointDto]()
        
        var pointDto = PointDto()
        
        for pointMst in fetchPointData(schShopId: schShopId){
            let pointDto:PointDto! = PointDto()
            pointDto.customId = pointMst.customId!
            pointDto.shopId = pointMst.shopId!
            pointDto.point = Int(pointMst.point)
            pointDto.shopPointCount = Int(pointMst.shopPointCount)
            pointDto.shopLogoImg = pointMst.shopLogoImg!
            pointDto.shopMessage = pointMst.shopMessage!
            pointDto.shopName = pointMst.shopName!
            pointDto.shopOrder = Int(pointMst.shopOrder)
            pointDto.effectiveFlg = pointMst.effectiveFlg
            pointDto.effectiveStartDate = pointMst.effectiveStartDate as! Date
            pointDto.effectiveEndDate = pointMst.effectiveEndDate as! Date
            list.append(pointDto)
        }
        
        if list.count > 0 {
            pointDto =  list[0]
        }
        return pointDto
    }
    
    /**
     ポイントを作成する
     */
    func createPointData(){
         
    var newPointDto = PointDto()
      //データ保存
      newPointDto.customId = "08091568818"
      newPointDto.shopId =  "0001"
      newPointDto.shopLogoImg =  "1"
      newPointDto.shopMessage =  "周末，雨天积分2倍"
      newPointDto.shopName =  "小肥羊"
      newPointDto.shopOrder = 1
      newPointDto.effectiveFlg = true
      newPointDto.effectiveStartDate = Date()
      newPointDto.effectiveEndDate = Date()
      newPointDto.point = 3
      newPointDto.shopPointCount = 10
      dbAccessModel.createPointData(newPointDto: newPointDto)
      
      newPointDto = PointDto()
      //データ保存
      newPointDto.customId = "08091568818"
      newPointDto.shopId =  "0002"
      newPointDto.shopLogoImg =  "2"
      newPointDto.shopMessage =  "集齐10个徽章，免费获得奶茶一杯"
      newPointDto.shopName =  "大鱼奶茶"
      newPointDto.shopOrder = 2
      newPointDto.effectiveFlg = true
      newPointDto.effectiveStartDate = Date()
      newPointDto.effectiveEndDate = Date()
      newPointDto.point = 18
      newPointDto.shopPointCount = 20
      dbAccessModel.createPointData(newPointDto: newPointDto)
      
      newPointDto = PointDto()
      //データ保存
      newPointDto.customId = "08091568818"
      newPointDto.shopId =  "0003"
      newPointDto.shopLogoImg =  "3"
      newPointDto.shopMessage =  "500円ポイント２倍"
      newPointDto.shopName =  "鸿雁米店"
      newPointDto.shopOrder = 3
      newPointDto.effectiveFlg = true
      newPointDto.effectiveStartDate = Date()
      newPointDto.effectiveEndDate = Date()
      newPointDto.point = 14
      newPointDto.shopPointCount = 15
      dbAccessModel.createPointData(newPointDto: newPointDto)

      
      newPointDto = PointDto()
      //データ保存
      newPointDto.customId = "08091568818"
      newPointDto.shopId =  "0004"
      newPointDto.shopLogoImg =  "4"
      newPointDto.shopMessage =  "最近特典があるので、ご覧ください"
      newPointDto.shopName =  "鱼米之乡"
      newPointDto.shopOrder = 4
      newPointDto.effectiveFlg = true
      newPointDto.effectiveStartDate = Date()
      newPointDto.effectiveEndDate = Date()
      newPointDto.point = 6
      newPointDto.shopPointCount = 30
      dbAccessModel.createPointData(newPointDto: newPointDto)
        
        newPointDto = PointDto()
        //データ保存
        newPointDto.customId = "08091568818"
        newPointDto.shopId =  "0005"
        newPointDto.shopLogoImg =  "5"
        newPointDto.shopMessage =  "最近特典があるので、ご覧ください"
        newPointDto.shopName =  "GG小面馆"
        newPointDto.shopOrder = 4
        newPointDto.effectiveFlg = true
        newPointDto.effectiveStartDate = Date()
        newPointDto.effectiveEndDate = Date()
        newPointDto.point = 10
        newPointDto.shopPointCount = 10
        dbAccessModel.createPointData(newPointDto: newPointDto)
        
        newPointDto = PointDto()
        //データ保存
        newPointDto.customId = "08091568818"
        newPointDto.shopId =  "0006"
        newPointDto.shopLogoImg =  "6"
        newPointDto.shopMessage =  "最近特典があるので、ご覧ください"
        newPointDto.shopName =  "衢州面馆"
        newPointDto.shopOrder = 4
        newPointDto.effectiveFlg = true
        newPointDto.effectiveStartDate = Date()
        newPointDto.effectiveEndDate = Date()
        newPointDto.point = 10
        newPointDto.shopPointCount = 10
        dbAccessModel.createPointData(newPointDto: newPointDto)
        
        newPointDto = PointDto()
        //データ保存
        newPointDto.customId = "08091568818"
        newPointDto.shopId =  "0007"
        newPointDto.shopLogoImg =  "7"
        newPointDto.shopMessage =  "最近特典があるので、ご覧ください"
        newPointDto.shopName =  "农家小菜"
        newPointDto.shopOrder = 4
        newPointDto.effectiveFlg = true
        newPointDto.effectiveStartDate = Date()
        newPointDto.effectiveEndDate = Date()
        newPointDto.point = 9
        newPointDto.shopPointCount = 10
        dbAccessModel.createPointData(newPointDto: newPointDto)
        
        newPointDto = PointDto()
        //データ保存
        newPointDto.customId = "08091568818"
        newPointDto.shopId =  "0008"
        newPointDto.shopLogoImg =  "8"
        newPointDto.shopMessage =  "最近特典があるので、ご覧ください"
        newPointDto.shopName =  "小丸子拉面"
        newPointDto.shopOrder = 4
        newPointDto.effectiveFlg = true
        newPointDto.effectiveStartDate = Date()
        newPointDto.effectiveEndDate = Date()
        newPointDto.point = 9
        newPointDto.shopPointCount = 10
        dbAccessModel.createPointData(newPointDto: newPointDto)
        
        newPointDto = PointDto()
        //データ保存
        newPointDto.customId = "08091568818"
        newPointDto.shopId =  "0009"
        newPointDto.shopLogoImg =  "9"
        newPointDto.shopMessage =  "最近特典があるので、ご覧ください"
        newPointDto.shopName =  "大胡子小龙虾"
        newPointDto.shopOrder = 4
        newPointDto.effectiveFlg = true
        newPointDto.effectiveStartDate = Date()
        newPointDto.effectiveEndDate = Date()
        newPointDto.point = 0
        newPointDto.shopPointCount = 10
        dbAccessModel.createPointData(newPointDto: newPointDto)
        
        newPointDto = PointDto()
        //データ保存
        newPointDto.customId = "08091568818"
        newPointDto.shopId =  "0010"
        newPointDto.shopLogoImg =  "10"
        newPointDto.shopMessage =  "最近特典があるので、ご覧ください"
        newPointDto.shopName =  "轻松喝茶"
        newPointDto.shopOrder = 4
        newPointDto.effectiveFlg = true
        newPointDto.effectiveStartDate = Date()
        newPointDto.effectiveEndDate = Date()
        newPointDto.point = 0
        newPointDto.shopPointCount = 10
        dbAccessModel.createPointData(newPointDto: newPointDto)
        
        newPointDto = PointDto()
        //データ保存
        newPointDto.customId = "08091568818"
        newPointDto.shopId =  "0011"
        newPointDto.shopLogoImg =  "11"
        newPointDto.shopMessage =  "最近特典があるので、ご覧ください"
        newPointDto.shopName =  "板凳猫"
        newPointDto.shopOrder = 4
        newPointDto.effectiveFlg = true
        newPointDto.effectiveStartDate = Date()
        newPointDto.effectiveEndDate = Date()
        newPointDto.point = 0
        newPointDto.shopPointCount = 12
        dbAccessModel.createPointData(newPointDto: newPointDto)
        
        newPointDto = PointDto()
        //データ保存
        newPointDto.customId = "08091568818"
        newPointDto.shopId =  "0012"
        newPointDto.shopLogoImg =  "12"
        newPointDto.shopMessage =  "最近特典があるので、ご覧ください"
        newPointDto.shopName =  "小麦哥"
        newPointDto.shopOrder = 4
        newPointDto.effectiveFlg = true
        newPointDto.effectiveStartDate = Date()
        newPointDto.effectiveEndDate = Date()
        newPointDto.point = 12
        newPointDto.shopPointCount = 12
        dbAccessModel.createPointData(newPointDto: newPointDto)
        
        newPointDto = PointDto()
        //データ保存
        newPointDto.customId = "08091568818"
        newPointDto.shopId =  "0013"
        newPointDto.shopLogoImg =  "13"
        newPointDto.shopMessage =  "最近特典があるので、ご覧ください"
        newPointDto.shopName =  "宝岛奶茶"
        newPointDto.shopOrder = 4
        newPointDto.effectiveFlg = true
        newPointDto.effectiveStartDate = Date()
        newPointDto.effectiveEndDate = Date()
        newPointDto.point = 1
        newPointDto.shopPointCount = 12
        dbAccessModel.createPointData(newPointDto: newPointDto)
        
        newPointDto = PointDto()
        //データ保存
        newPointDto.customId = "08091568818"
        newPointDto.shopId =  "0014"
        newPointDto.shopLogoImg =  "14"
        newPointDto.shopMessage =  "最近特典があるので、ご覧ください"
        newPointDto.shopName =  "小猫宠物店"
        newPointDto.shopOrder = 4
        newPointDto.effectiveFlg = true
        newPointDto.effectiveStartDate = Date()
        newPointDto.effectiveEndDate = Date()
        newPointDto.point = 1
        newPointDto.shopPointCount = 30
        dbAccessModel.createPointData(newPointDto: newPointDto)


    }
    
    func deletePointData(){
        dbAccessModel.deletePointData()
    }
}

