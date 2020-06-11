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
    func getHttpData(){
        let parameters: [String: [String]] = [
            "foo": ["bar"],
            "baz": ["a", "b"],
            "qux": ["x", "y", "z"]
        ]

        // All three of these calls are equivalent
        AF.request("https://www.coupang.com/vp/products/331561371", parameters: parameters).responseString { response in
           let startTitleIndex = response.description.range(of: "<meta property=\"og:title\" content=\"")
            let startURLIndex = response.description.range(of: "<meta property=\"og:url\" content=\"")
            
   
            debugPrint("Response: \(response.description)")
        }
    }
}
