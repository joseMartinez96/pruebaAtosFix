//
//  ProductInteractor.swift
//  pruebaAtos
//
//  Created by IOS_002 on 10/04/22.
//

import Foundation
import Alamofire

protocol ProductProtocol{
    func reloadData(data: [ProductEntity])
}

class ProductInteractor{
    
    var oProduc: ProductProtocol?
    
    func fetchData(){
        
        let decoder = JSONDecoder()
        let request = Alamofire.request("http://localhost:3000/productos")
        
        request.responseJSON { response in
            
            do{
                let lstProducts = try decoder.decode([ProductEntity].self, from: response.data!)
                
                self.oProduc?.reloadData(data: lstProducts)
                
            }catch{
                print("Error")
            }
        }
        
    }
    
}
