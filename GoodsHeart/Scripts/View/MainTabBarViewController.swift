//
//  MainTabBarViewController.swift
//  GoodsHeart
//
//  Created by Suhong Jeong on 2020/06/05.
//  Copyright © 2020 Suhong Jeong. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
    }
    
    

}
 //MARK: - Tab
extension MainTabBarViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool{

            let tabbarIndex = tabBarController.viewControllers!.index(of: viewController)!
        if tabbarIndex == 1{
            let alert = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "온라인 상품 추가", style: .default, handler: { (action) in
                
                
            }))
            alert.addAction(UIAlertAction(title: "오프라인 상품 추가", style: .default, handler:{(action) in
            }))
            alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
            
            present(alert, animated: true, completion: nil)
            
            return false
        } else {
            return true
        }
    }
}
