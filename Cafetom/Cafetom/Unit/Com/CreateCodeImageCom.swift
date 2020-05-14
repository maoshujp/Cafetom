//
//  CreateCodeImageCom.swift
//  Cafetom Point
//
//  Created by lion on 2020/04/30.
//  Copyright © 2020 lion. All rights reserved.
//

import Foundation
import UIKit
import RSBarcodes_Swift
import AVFoundation

class CreateCodeImageCom{
    
    //識別レベル
    enum InputCorrectionLevel: String {
        case L
        case M
        case Q
        case H
    }
    
    /**
     ean13タイプ作成する
     */
    static func generateEan13Barcode(string:String) -> UIImage?{
        let gen = RSUnifiedCodeGenerator.shared
        print ("generating image with barcode: " + string)
        let image = gen.generateCode(string, machineReadableCodeObjectType: AVMetadataObject.ObjectType.ean13.rawValue)
        print(image)
        
        return image
    }
    
    /**
     code39タイプ作成する
     */
    static func generateCode39Barcode(string:String) -> UIImage?{
        let gen = RSUnifiedCodeGenerator.shared
        print ("generating image with barcode: " + string)
        let image = gen.generateCode(string, machineReadableCodeObjectType: AVMetadataObject.ObjectType.code39.rawValue)
        print(image)
        
        return image
    }
    
    /**
     code128タイプ作成する
     */
    static func generateCode128Barcode(string: String) -> UIImage? {
        guard let data = string.data(using: .utf8) else {
            return nil
        }
        
        guard let filter = CIFilter(name: "CICode128BarcodeGenerator") else {
            return nil
        }
        
        filter.setDefaults()
        filter.setValue(data, forKey: "inputMessage")
        
        guard let output = filter.outputImage else {
            return nil
        }
        
        let context = CIContext(options: nil)
        guard let cgImage = context.createCGImage(output, from: output.extent) else {
            return nil
        }
        
        let image = UIImage(cgImage: cgImage, scale: 2.0, orientation: UIImage.Orientation.up)
        
        return image
    }
    

    /**
    qrタイプ作成する
    */
   static func generateQrcode(string: String) -> UIImage? {
       guard let message:String = string,
    
        let correctionLevelString:String = "L",
        let correctionLevel = InputCorrectionLevel(rawValue: correctionLevelString) else { return nil }
        let data = message.data(using: .utf8)!

        let qr = CIFilter(name: "CIQRCodeGenerator", parameters: ["inputMessage": data, "inputCorrectionLevel": correctionLevel.rawValue])!
        let sizeTransform = CGAffineTransform(scaleX: 10, y: 10)
        let qrImage = qr.outputImage!.transformed(by: sizeTransform)
        let image = UIImage(ciImage: qrImage)
       return image
    }
    
   
}

