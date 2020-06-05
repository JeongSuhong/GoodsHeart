//
//  GoodsTableViewCell.swift
//  GoodsHeart
//
//  Created by Suhong Jeong on 2020/06/03.
//  Copyright © 2020 Suhong Jeong. All rights reserved.
//

import UIKit

class GoodsTableViewCell: UITableViewCell {
    @IBOutlet weak var goodsImage: UIImageView!
    @IBOutlet weak var goodsName: UILabel!
    @IBOutlet weak var goodsPrice: UILabel!
    @IBOutlet weak var goodsSubData: UILabel!
    
    func GoodsTableViewCell() {
        goodsName.text = "이름"
        goodsPrice.text = "1000"
        goodsSubData.text = "퇴근하고싶음"
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
