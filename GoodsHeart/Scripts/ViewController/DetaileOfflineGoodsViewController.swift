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
    
    @IBAction func tapImageView(_ sender: UITapGestureRecognizer) {
        
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

extension DetailOfflineGoodsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{

                    photoImage.image = image
                }

        imagePickerController.dismiss(animated: true, completion: nil)
    }
}
