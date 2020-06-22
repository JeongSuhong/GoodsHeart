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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
