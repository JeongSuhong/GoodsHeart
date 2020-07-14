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
    @IBOutlet weak var photoImage: UIImageView!
    
    let imagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
                self.imagePickerController.modalPresentationStyle = .fullScreen
        self.imagePickerController.delegate = self
    }
    
    func UpdateAddress(value :String?) {
        addressText.text = value
    }

    
}

extension DetailOfflineGoodsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{

                    photoImage.image = image
                }

        imagePickerController.dismiss(animated: true, completion: nil)
    }
}
