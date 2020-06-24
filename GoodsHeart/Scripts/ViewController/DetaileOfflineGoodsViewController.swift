//
//  DetaileOfflineGoodsViewController.swift
//  GoodsHeart
//
//  Created by Suhong Jeong on 2020/06/18.
//  Copyright © 2020 Suhong Jeong. All rights reserved.
//

import Foundation
import UIKit

class DetailOfflineGoodsViewController : UIViewController {
    
    @IBOutlet weak var addressText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func UpdateAddress(value :String?) {
        addressText.text = value
    }
}
