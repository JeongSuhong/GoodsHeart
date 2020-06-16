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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HttpManager().getHttpData{ response in
            self.urlField.text = response.url
            self.thumnailView.image = UIImage(data: response.thumnail!)
            self.goodsTitle.text = response.title
        }

    }

    @IBAction func closeScerne(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func viewEditScene(_ sender: UIBarButtonItem) {
        let controller = self.storyboard?.instantiateViewController(identifier: "AddOfflineGoodsViewController")
        controller?.modalPresentationStyle = .fullScreen
        present(controller!, animated: false, completion: nil)
    }
}
