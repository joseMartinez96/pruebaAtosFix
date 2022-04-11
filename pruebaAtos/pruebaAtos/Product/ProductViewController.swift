//
//  ProductViewController.swift
//  pruebaAtos
//
//  Created by IOS_002 on 08/04/22.
//

import UIKit

class ProductViewController: UIViewController {
    
    static let identifier = "ProductViewController"
    @IBOutlet weak var tableViewProduct: UITableView!
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var btnContinuar: UIButton!
    
    var lstProducts : [ProductEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewProduct.delegate = self
        tableViewProduct.dataSource = self
        self.tableViewProduct.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier)
        
        let fechData = ProductInteractor()
        fechData.oProduc = self
        fechData.fetchData()
        
        btnContinuar.setTitle("Continuar", for: .normal)
    }
    
    @IBAction func btnGoToshoppingBag(_ sender: Any) {
        
        let vc = ShoppingBagViewController.init(nibName: ShoppingBagViewController.identifier, bundle: .main)
        
        
        vc.modalPresentationStyle = .overCurrentContext
        
        if let shopping = vc as? ShoppingBagViewController{
            
            for item in self.lstProducts{
                if item.quantity != nil && item.quantity! > 0{
                    shopping.lstShopping.append(item)
                }
            }
            
            if shopping.lstShopping.count > 0{
                self.present(vc, animated: true, completion: nil)
            }else{
                let alert = UIAlertController(title: "Alert", message: "ERROR", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
        }
        
        
        
        
    }
    
}

extension ProductViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.lstProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        
        let item = lstProducts[indexPath.row]
        
        cell.lblPrice.text = String(item.price)
        cell.lblTitle.text = item.name
        cell.lblDescription.text = item.description
        cell.imgCell.downloaded(from: item.img)
        cell.delegate = self
        cell.btnAddCount.tag = indexPath.row
        cell.btnRemoveCount.tag = indexPath.row
        
        return cell
    }
    
    
}

extension ProductViewController: ProductProtocol{
    func reloadData(data: [ProductEntity]) {
        self.lstProducts = data
        
        self.tableViewProduct.reloadData()
    }
    
    
}
