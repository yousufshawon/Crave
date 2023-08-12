//
//  TodaySpecialViewCell.swift
//  Crave
//
//  Created by Yousuf on 5/8/23.
//

import UIKit

class TodaySpecialViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    static let identifierName = "TodaySpecialViewCell"

    @IBOutlet weak var collectionView: UICollectionView!
    private var dataList = [TodaySpecial]()
    
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
        let uiNib = UINib(nibName: FoodItemCell.identifierName, bundle: nil)
        collectionView.register(uiNib, forCellWithReuseIdentifier: FoodItemCell.identifierName)
        collectionView.dataSource = self
        collectionView.delegate = self
        //collectionView.reloadData()
    }
    
    func update(list : [TodaySpecial]) {
        //collectionView.reloadData()
        print("update TodaySpecial CollectionView")
        dataList.removeAll()
        self.dataList.append(contentsOf: list)
        self.collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataList.count
    }
    

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("cellForItemAt \(indexPath.row)")
        let foodItemCell =  getFoodItemCell(collectionView: collectionView, indexPath: indexPath)
        foodItemCell.bind(todaySpecial: dataList[indexPath.row])
        return foodItemCell
    }
    
    private func getFoodItemCell(collectionView:UICollectionView, indexPath : IndexPath) -> FoodItemCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodItemCell.identifierName, for: indexPath) as! FoodItemCell
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 280, height: 245)
    }

    
}
