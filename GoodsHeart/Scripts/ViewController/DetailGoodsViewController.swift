//
//  DetailGoodsViewController.swift
//  GoodsHeart
//
//  Created by Suhong Jeong on 2020/06/09.
//  Copyright © 2020 Suhong Jeong. All rights reserved.
//

import UIKit
import SceneKit

class DetailGoodsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
                HttpManager().getHttpData()

    }

    @IBAction func closeScerne(_ sender: UIBarButtonItem) {
                dismiss(animated: false, completion: nil)
    }
    
    @IBAction func viewEditScene(_ sender: UIBarButtonItem) {
        let controller = self.storyboard?.instantiateViewController(identifier: "AddOfflineGoodsViewController")
        controller?.modalPresentationStyle = .fullScreen
        self.present(controller!, animated: false, completion: nil)
    }
}
