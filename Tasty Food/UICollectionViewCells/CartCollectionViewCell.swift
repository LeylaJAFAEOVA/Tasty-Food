//
//  CartCollectionViewCell.swift
//  Tasty Food
//
//  Created by Leyla Jafarova on 23.12.22.
//

import UIKit
import Kingfisher


protocol CartCollectionViewCellDelegate: AnyObject {
    func didSelect(food: Food)
}

class CartCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblSub: UILabel!
    
    @IBOutlet weak var btnDelete: UIButton!
    
    @IBOutlet weak var btnAdd: UIButton!
    
    
    weak var delegate: CartCollectionViewCellDelegate?
    private var food: CartItem?
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        
        
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 0.4
        layer.cornerRadius = 6
        btnDelete.setTitle("Delete", for: .normal)
        btnAdd.setTitle("Add", for: .normal)
    }
    
    func configure(item: CartItem?) {
        guard let item = item else { return }
        self.food = item
        lblTitle.text = item.name
        
        lblSub.text = "\(item.price ?? 0) AZN"
        imgView.kf.setImage(with: item.imageURL)
    }

    @IBAction func didSelect(_ sender: UIButton) {
        guard let food = food else { return }
        //delegate?.didSelect(food: food)
    }
}

    
