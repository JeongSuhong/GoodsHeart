//
//  HttpManager.swift
//  GoodsHeart
//
//  Created by Suhong Jeong on 2020/06/11.
//  Copyright © 2020 Suhong Jeong. All rights reserved.
//

import Foundation
import Alamofire


class DownloadGoodsDataManager
{
    struct goodsData {
        var title :String = ""
        var price :String = ""
        var thumnail :Data? = nil
    }
    
    func downloadGoodsData(url: String, completion: @escaping (goodsData) -> Void) {
        
        var result = goodsData()
        
        AF.request(url).responseString {   [weak self] response in
        
            let text = response.description
            
            let startTitleIndex = text.range(of: "<meta property=\\\"og:title\\\" content=\\\"")
            result.title = String(text[startTitleIndex!.upperBound...])
            result.title = String(result.title[..<result.title.range(of: "\\\"")!.lowerBound])
            
            let startPriceIndex = text.range(of: "\\\"priceAmount\\\":\\\"")
            result.price = String(text[startPriceIndex!.upperBound...])
            result.price = String(result.price[..<result.price.range(of: "\\\"")!.lowerBound])
        
            let startThumnailIndex = text.range(of: "<meta property=\\\"og:image\\\" content=\\\"")
            var thumnailPath = String(text[startThumnailIndex!.upperBound...])
            thumnailPath = String(thumnailPath[..<thumnailPath.range(of: "\\\"")!.lowerBound])
            AF.request("https:" + thumnailPath).responseData(completionHandler: { [weak self] thumnailData in
                result.thumnail = thumnailData.data
                completion(result)
            })
            
            
        }
    }
}
