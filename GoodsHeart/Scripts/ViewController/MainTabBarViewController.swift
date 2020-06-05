//
//  MainTabBarViewController.swift
//  GoodsHeart
//
//  Created by Suhong Jeong on 2020/06/05.
//  Copyright © 2020 Suhong Jeong. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController, UITabBarControllerDelegate{
    
    var prevSelectIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {

        print( tabBarController.selectedIndex)
        if tabBarController.selectedIndex == 1{
            tabBarController.selectedIndex = prevSelectIndex
            let alert = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "온라인 상품 추가", style: .default, handler: { (action) in
                tabBarController.selectedIndex = 1
                self.prevSelectIndex = 1
            }))
            alert.addAction(UIAlertAction(title: "오프라인 상품 추가", style: .default, handler:nil))
            alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
            
            present(alert, animated: true, completion: nil)
        }
        else{
        prevSelectIndex = tabBarController.selectedIndex
        }
    }

}
