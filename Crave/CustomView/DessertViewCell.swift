//
//  DessertViewCell.swift
//  Crave
//
//  Created by Yousuf on 6/8/23.
//

import UIKit

class DessertViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
    static let identifierName = "DessertViewCell"
    private var dataList = [Dessert]()

    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        initView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func initView() {
        let dessrtNibCell = UINib(nibName: FoodItemCell.identifierName, bundle: nil)
        collectionView.register(dessrtNibCell, forCellWithReuseIdentifier: FoodItemCell.identifierName)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func update(dessertList : [Dessert]) {
        dataList.removeAll()
        dataList.append(contentsOf: dessertList)
        collectionView.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataList.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let foodItemCell =  getDessertViewCell(collectionView: collectionView, indexPath: indexPath)
        foodItemCell.bind(dessert: dataList[indexPath.row])
        return foodItemCell
    }
    
    private func getDessertViewCell(collectionView : UICollectionView, indexPath : IndexPath) -> FoodItemCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: FoodItemCell.identifierName, for: indexPath) as! FoodItemCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 280, height: 245)
    }
    
    
}
