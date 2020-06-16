//
//  HttpManager.swift
//  GoodsHeart
//
//  Created by Suhong Jeong on 2020/06/11.
//  Copyright © 2020 Suhong Jeong. All rights reserved.
//

import Foundation
import Alamofire


class HttpManager
{
    struct nameGoodsData {
        var title :String = ""
        var url :String = ""
        var thumnail :Data? = nil
    }
    
    func getHttpData(completion: @escaping (nameGoodsData) -> Void) {
        
        var result = nameGoodsData()
        
        AF.request("https://www.coupang.com/vp/products/106800663?itemId=322867424").responseString {   [weak self] response in
        
            let text = response.description
            
            let startTitleIndex = text.range(of: "<meta property=\\\"og:title\\\" content=\\\"")
            result.title = text.substring(from: startTitleIndex!.upperBound)
            result.title = result.title.substring(to: result.title.range(of: "\\\"")!.lowerBound)
            
            let startUrlIndex = text.range(of: "<meta property=\\\"og:url\\\" content=\\\"")
            result.url = text.substring(from: startUrlIndex!.upperBound)
            result.url = result.url.substring(to: result.url.range(of: "\\\"")!.lowerBound)
        
            let startThumnailIndex = text.range(of: "<meta property=\\\"og:image\\\" content=\\\"")
            var thumnailPath = text.substring(from: startThumnailIndex!.upperBound)
            thumnailPath = thumnailPath.substring(to: thumnailPath.range(of: "\\\"")!.lowerBound)
            AF.request("https:" + thumnailPath).responseData(completionHandler: { [weak self] thumnailData in
                result.thumnail = thumnailData.data
                completion(result)
            })
            
            
        }
    }
}
