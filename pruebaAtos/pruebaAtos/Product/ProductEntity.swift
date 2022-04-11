//
//  ProductEntity.swift
//  pruebaAtos
//
//  Created by IOS_002 on 10/04/22.
//

import Foundation

struct ProductEntity:Codable{
    
    var id: Int
    var name: String
    var description: String
    var price: Int
    var img: String
    var quantity: Int? = 0
}
