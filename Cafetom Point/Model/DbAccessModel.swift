//
//  DbAccessModel.swift
//  Cafetom Point
//  Github
//  Created by lion on 2020/04/29.
//  Copyright © 2020 lion. All rights reserved.
//

import CoreData

class DbAccessModel: NSObject {
    
    var persistentContainer: NSPersistentContainer!

    /*
     データモデルを初期化する
     */
    init(dataModelName: String){
        persistentContainer = NSPersistentContainer(name: dataModelName)
        persistentContainer.loadPersistentStores() { (description, error) in
        if let error = error {
            fatalError("Failed to load Core Data stack: \(error)")
        }
      }
    }
    
    /*
     ポイントマスタを取得する
     */
    func fetchPointList() -> [POINT_M_VIEW] {
        let context = persistentContainer.viewContext
        let pointFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "POINT_M_VIEW")
        let sortDescripter = NSSortDescriptor(key: "shopOrder", ascending: true)
        //並び順
        pointFetch.sortDescriptors = [sortDescripter]

        do {
            let fetchedPoint = try context.fetch(pointFetch) as! [POINT_M_VIEW]
            return fetchedPoint
        } catch {
            fatalError("Failed to fetch POINT_M_VIEW: \(error)")
        }
        return []
    }
    
    /*
     会員カードテーブルを取得する
     */
    func fetchMemberCardList() -> [MEMBER_CARD_M] {
        let context = persistentContainer.viewContext
        let memberCardFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "MEMBER_CARD_M")
        let sortDescripter = NSSortDescriptor(key: "shopOrder", ascending: true)
        //並び順
        memberCardFetch.sortDescriptors = [sortDescripter]

        do {
            let fetchedMemberCard = try context.fetch(memberCardFetch) as! [MEMBER_CARD_M]
            return fetchedMemberCard
        } catch {
            fatalError("Failed to fetch MEMBER_CARD_M: \(error)")
        }
        return []
    }
    
    /*
    会員カードテーブルを新規する
    */
    func createMemberCardData(newMemberCardDto:MemberCardDto)  {
        let context = persistentContainer.viewContext
        let memberCardData = NSEntityDescription.insertNewObject(forEntityName: "MEMBER_CARD_M", into: context) as! MEMBER_CARD_M
        //データ設定
        memberCardData.memberCardNo = newMemberCardDto.memberCardNo
        memberCardData.memberCardType = newMemberCardDto.memberCardType
        memberCardData.shopName = newMemberCardDto.shopName
        memberCardData.frontImg = newMemberCardDto.frontImg
        memberCardData.reverseImg = newMemberCardDto.reverseImg
        //コミット
        saveContext()
    }
    
    /*
    ポイントテーブルを新規する
    */
    func createPointData(newPointDto:PointDto)  {
        let context = persistentContainer.viewContext
        let pointData = NSEntityDescription.insertNewObject(forEntityName: "POINT_M_VIEW", into: context) as! POINT_M_VIEW
        //データ設定
        pointData.customId = newPointDto.customId
        pointData.shopId = newPointDto.shopId
        pointData.point = Int32(newPointDto.point)
        pointData.shopPointCount = Int32(newPointDto.shopPointCount)
        pointData.shopLogoImg = newPointDto.shopLogoImg
        pointData.shopMessage = newPointDto.shopMessage
        pointData.shopName = newPointDto.shopName
        pointData.shopOrder = Int32(newPointDto.shopOrder)
        pointData.effectiveFlg = newPointDto.effectiveFlg
        pointData.effectiveStartDate = newPointDto.effectiveStartDate
        pointData.effectiveEndDate = newPointDto.effectiveEndDate
        //コミット
        saveContext()
    }
    
    /*
     ポイントテーブルを取得する
     */
    func fetchPointDataByShopId(shopId:String) -> [POINT_M_VIEW] {
        let context = persistentContainer.viewContext
        let pointFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "POINT_M_VIEW")
        let predicate = NSPredicate(format: "shopId = %@", shopId)
        //検索条件
        pointFetch.predicate = predicate
        do {
            let fetchedPoint = try context.fetch(pointFetch) as! [POINT_M_VIEW]
            return fetchedPoint
        } catch {
            fatalError("Failed to fetch Point Data: \(error)")
        }
        return []
    }
    
    /*
     データをコミット
    */
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("データをコミットエラー \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    /*
     ポイントデータを削除する
    */
    func deletePointData() {
        let context = persistentContainer.viewContext
        let pointFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "POINT_M_VIEW")

        do {
            let fetchedHistory = try context.fetch(pointFetch) as! [POINT_M_VIEW]
            for result: AnyObject in fetchedHistory {
                let record = result as! NSManagedObject
                context.delete(record)
            }
            try context.save()
            
        } catch {
            fatalError("Failed to fetch History: \(error)")
        }
    }

    
    
}

