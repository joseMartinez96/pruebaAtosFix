//
//  ShoppingBagTableViewCell.swift
//  pruebaAtos
//
//  Created by IOS_002 on 10/04/22.
//

import UIKit

class ShoppingBagTableViewCell: UITableViewCell {
    
    static let identifier = "ShoppingBagTableViewCell"
    @IBOutlet weak var imgCell: UIImageView!
    
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblTittle: UILabel!
    @IBOutlet weak var lblQuantity: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
