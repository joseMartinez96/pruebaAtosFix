//
//  TableViewCell.swift
//  pruebaAtos
//
//  Created by IOS_002 on 10/04/22.
//

import UIKit

protocol TableViewCellProtocol{
    func updateAmountTotal(counter: Int, position: Int)
}

class TableViewCell: UITableViewCell {
    
    static let identifier = "TableViewCell"
    var delegate : TableViewCellProtocol?
    
    @IBOutlet weak var btnRemoveCount: UIButton!
    @IBOutlet weak var btnAddCount: UIButton!
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var imgCell: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblItemCount: UILabel!
    
    static func nib() -> UINib{
        
        
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.btnAddCount.setTitle("+", for: .normal)
        self.btnRemoveCount.setTitle("-", for: .normal)
        self.btnClose.setTitle("", for: .normal)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func btnActionAdd(_ sender: UIButton) {
        
        addRemoveCounter(isAdd: true, position: sender.tag)
    }
    @IBAction func btnRemoveCount(_ sender: UIButton) {
        
        addRemoveCounter(isAdd: false, position: sender.tag)
    }
    
    private func addRemoveCounter(isAdd: Bool, position: Int){
        
        let numberadd = 1
        var newCount = 0
        let count = Int(lblItemCount.text!)
        newCount = count ?? 0
        if isAdd{
            
            if count! >= 0{
                newCount += numberadd
            }
        }else{
            if count! >= 1{
                newCount -= numberadd
            }
        }
        
        lblItemCount.text = String(newCount)
        delegate?.updateAmountTotal(counter: newCount, position: position)
        
    }
}


extension ProductViewController: TableViewCellProtocol{
    func updateAmountTotal(counter: Int, position: Int) {
        
        
        self.lstProducts[position].quantity = counter
        
        var total = 0
        
        for item in lstProducts{
            
            if item.quantity != nil{
                total += item.quantity! * item.price
            }
            
            
        }
        
        lblAmount.text = String(total)
        
    }
}
