//
//  Food.swift
//  Tasty Food
//
//  Created by Leyla Jafarova on 18.12.22.
//

import Foundation

struct FoodsResponse: Codable {
    let foods: [Food]?
}

struct CartItemResponse: Codable {
    let foods_cart: [CartItem]?
}

struct Food: Codable {
    let id: Int?
    let name: String?
    let price: Int?
    let image: String?
    let category: String?
    
    var imageURL: URL? {
        guard let image = image else { return nil }
        return URL(string: NetworkService.baseImageURL + image)
    }
}

struct CartItem: Codable {
    let name, image, category, userName: String?
    let cartld, price, orderAmount: Int?
    
    var imageURL: URL? {
        guard let image = image else { return nil }
        return URL(string: NetworkService.baseImageURL + image)
    }
}

class CRUDResponse : Codable {
    var success: Int?
    var message: String?
}


