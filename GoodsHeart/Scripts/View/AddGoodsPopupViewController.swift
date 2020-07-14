//
//  AddGoodsPopupViewController.swift
//  GoodsHeart
//
//  Created by Suhong Jeong on 2020/07/10.
//  Copyright © 2020 Suhong Jeong. All rights reserved.
//

import Foundation
import UIKit

class AddGoodsPopupViewController : UIViewController {
    
    override func viewDidLoad() {
        let alert = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
                   alert.addAction(UIAlertAction(title: "온라인 상품 추가", style: .default, handler: { (action) in
                   }))
                   alert.addAction(UIAlertAction(title: "오프라인 상품 추가", style: .default, handler:{(action) in
                   }))
                   alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
                   
                   present(alert, animated: true, completion: nil)
    }
}
