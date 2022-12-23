//
//  DetailViewController.swift
//  Tasty Food
//
//  Created by Leyla Jafarova on 18.12.22.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    var viewModel = DetailScreenViewModel()
    
    @IBOutlet weak var imgView: UIImageView!
    
    
    @IBOutlet weak var lblTitle: UILabel!
    
    
    @IBOutlet weak var lblSub: UILabel!
    
    
    
    @IBOutlet weak var lblPrice: UILabel!
    
    
    @IBOutlet weak var lblNumber: UILabel!
    
    @IBOutlet weak var btnMin: UIButton!
    
    
    @IBOutlet weak var btnSumm: UIButton!
    @IBOutlet weak var btnAdd: UIButton!
    
    
    @IBOutlet weak var btnDelete: UIButton!
    
   
    
    var food: Food?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let food = food {
            lblTitle.text = food.name
            lblSub.text = food.category
            lblPrice.text = "\(food.price ?? 0) AZN"
            
            imgView.kf.setImage(with: food.imageURL)
        }
    }
    
    @IBAction func addToCart() {
        if let food = food {
            viewModel.addItem(item: food, count: 1)
            dismiss(animated: true)
        }
    }
}
