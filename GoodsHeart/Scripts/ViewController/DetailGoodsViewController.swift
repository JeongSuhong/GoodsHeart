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

    @IBOutlet weak var urlField: UITextField!
    @IBOutlet weak var thumnailView: UIImageView!
    @IBOutlet weak var goodsTitle: UILabel!
    @IBOutlet weak var goodsPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://www.coupang.com/vp/products/106800663?itemId=322867424"
        urlField.text = url
        
        DownloadGoodsDataManager().downloadGoodsData(url: url, completion: { response in
            self.thumnailView.image = response.thumnail!
            self.goodsTitle.text = response.title
            self.goodsPrice.text = response.price
        })

    }

    @IBAction func closeScerne(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func viewEditScene(_ sender: UIBarButtonItem) {
        let controller = self.storyboard?.instantiateViewController(identifier: "AddOfflineGoodsViewController")
        controller?.modalPresentationStyle = .fullScreen
        present(controller!, animated: false, completion: nil)
    }
    
    @IBAction func updateGoodsData(_ sender: UIButton) {
        let url = urlField.text!
        
        DownloadGoodsDataManager().downloadGoodsData(url: url, completion: { response in
            self.thumnailView.image = response.thumnail!
            self.goodsTitle.text = response.title
            self.goodsPrice.text = response.price
        })

    }
}
