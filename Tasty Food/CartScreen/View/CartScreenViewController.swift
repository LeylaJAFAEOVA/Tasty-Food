//
//  CartScreenViewController.swift
//  Tasty Food
//
//  Created by Leyla Jafarova on 19.12.22.
//

import UIKit
import Kingfisher

class CartScreenViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel = CartViewModel()
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var btnCheckout: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchCartItems()
        collectionView.reloadData()
    }
//
    func setupCollectionView() {
        //This is how we register NIB for ProductCollectionViewCell
        collectionView.register(
            UINib(nibName: String(describing: CartCollectionViewCell.self), bundle: nil),
            forCellWithReuseIdentifier: String(describing: CartCollectionViewCell.self)
        )

        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()

        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 10

        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth - 30) / 2

        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        collectionView.collectionViewLayout = layout

    }
    
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        //Implement navigation to next screen there (select whole cell)
//        let item = viewModel.foods[indexPath.row]
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        //let detailiewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as!DetailViewController
//        //detailiewController.food = item
//        //navigationController?.present(detailiewController, animated: true)
//    }
    
}

extension CartScreenViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width / 2) - 24
        return .init(width: width, height: width)
    }
}

extension CartScreenViewController: CartCollectionViewCellDelegate {
    func didSelect(food: Food) {
        //select button on cell
        print("food selected: ", food.name)
    }
}

extension CartScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.foods?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let item = viewModel.foods?[indexPath.row]

        //this is how we reuse it
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: String(describing: CartCollectionViewCell.self), for: indexPath
        ) as! CartCollectionViewCell


        //configure moved to cell
        cell.configure(item: item)
        cell.delegate = self
        return cell
    }
}
