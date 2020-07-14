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

    enum GoodsType {
       case Online
       case Offline
    }
    
    var goodsType: GoodsType?
    
        let imagePickerController = UIImagePickerController()
    
    @IBOutlet weak var urlField: UITextField!
    @IBOutlet weak var thumnailView: UIImageView!
    @IBOutlet weak var goodsTitle: UILabel!
    @IBOutlet weak var goodsPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if goodsType == GoodsType.Online {
            self.viewOnlineGoodsData()
        }
        else if goodsType == GoodsType.Offline {
            self.viewOfflineGoodsData()
        }
    }
    
    func viewOnlineGoodsData()
    {
        let url = "https://www.coupang.com/vp/products/106800663?itemId=322867424"
        urlField.text = url
        
        DownloadGoodsDataManager().downloadGoodsData(url: url, completion: { response in
            self.thumnailView.image = response.thumnail!
            self.goodsTitle.text = response.title
            self.goodsPrice.text = response.price
        })

    }
    
    func viewOfflineGoodsData() {
                self.imagePickerController.modalPresentationStyle = .fullScreen
        self.imagePickerController.delegate = self
    
    }

    @IBAction func closeScerne(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }

    
    @IBAction func updateGoodsData(_ sender: UIButton) {
        let url = urlField.text!
        
        DownloadGoodsDataManager().downloadGoodsData(url: url, completion: { response in
            self.thumnailView.image = response.thumnail!
            self.goodsTitle.text = response.title
            self.goodsPrice.text = response.price
        })

    }
    
    func tapImageView(_ sender: UITapGestureRecognizer) {
        
        let alert = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "카메라 촬영", style: .default, handler: { (action) in
            // Camera Not Working When Xcode Simurator
            //            self.imagePickerController.sourceType = .camera
            //            self.present(self.imagePickerController, animated: true, completion: nil)
            return
        }))
        alert.addAction(UIAlertAction(title: "앨범 선택", style: .default, handler: { (action) in
            self.imagePickerController.sourceType = .photoLibrary
            self.present(self.imagePickerController, animated: true, completion: nil)
            return
        }))
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}

extension DetailGoodsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{

                    thumnailView.image = image
                }

        imagePickerController.dismiss(animated: true, completion: nil)
    }
}
