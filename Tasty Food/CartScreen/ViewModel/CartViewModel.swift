//
//  CartViewModel.swift
//  Tasty Food
//
//  Created by Leyla Jafarova on 19.12.22.
//

import UIKit
import Kingfisher

class CartViewModel {
    let repo = FoodRepository()
    var foods: [CartItem]?
    
//    func fetchFoods() {
//        repo.getList { foods in
//            self.foods = foods
//            self.addItem(indexPath: .init(row: 1, section: 0), count: 2)
//            self.addItem(indexPath: .init(row: 2, section: 0), count: 1)
//
//        }
//    }
//

    func fetchCartItems() {
        repo.getAllCartItems { cartItems in
            self.foods = cartItems?.foods_cart
        }
    }
}
