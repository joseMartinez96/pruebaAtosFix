//
//  ShoppingBagViewController.swift
//  pruebaAtos
//
//  Created by IOS_002 on 10/04/22.
//

import UIKit

class ShoppingBagViewController: UIViewController {
    
    @IBOutlet weak var btnCheckout: buttonBlue!
    @IBOutlet weak var tableViewShopping: UITableView!
    static let identifier = "ShoppingBagViewController"
    var lstShopping : [ProductEntity] = []
    var iSubTotal = 0
    @IBOutlet weak var subTotal: UILabel!
    
    @IBOutlet weak var lblTotal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewShopping.delegate = self
        tableViewShopping.dataSource = self
        self.tableViewShopping.register(ShoppingBagTableViewCell.nib(), forCellReuseIdentifier: ShoppingBagTableViewCell.identifier)
        btnCheckout.setTitle("CONTINUE TO CHECKOUT", for: .normal)
        
        for item in lstShopping{
            
            iSubTotal += item.quantity! * item.price
            
        }
        
        
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0
        formatter.currencyCode = "USD"
        formatter.numberStyle = .currency
        
        subTotal.text = formatter.string(for: iSubTotal)
        lblTotal.text = formatter.string(for: Double(iSubTotal) * 1.16)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ShoppingBagViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lstShopping.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingBagTableViewCell.identifier, for: indexPath) as! ShoppingBagTableViewCell
        
        
        let item = lstShopping[indexPath.row]
        
        cell.lblPrice.text = String(item.price)
        cell.lblTittle.text = item.name
        cell.lblQuantity.text = String(item.quantity!)
        cell.imgCell.downloaded(from: item.img)
        
        
        return cell
    }
    
    
}
