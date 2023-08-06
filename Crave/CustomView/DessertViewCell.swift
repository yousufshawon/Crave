//
//  DessertViewCell.swift
//  Crave
//
//  Created by Yousuf on 6/8/23.
//

import UIKit

class DessertViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
    static let identifierName = "DessertViewCell"

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
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return getDessertViewCell(collectionView: collectionView, indexPath: indexPath)
    }
    
    private func getDessertViewCell(collectionView : UICollectionView, indexPath : IndexPath) -> FoodItemCell {
        let  oldCell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodItemCell.identifierName, for: indexPath) as! FoodItemCell
        return oldCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 280, height: 245)
    }
    
    
}
