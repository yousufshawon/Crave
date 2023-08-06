//
//  PopularCategoryCell.swift
//  Crave
//
//  Created by Yousuf on 31/7/23.
//

import UIKit

class PopularCategoryCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var collectionVIewCategory: UICollectionView!
    static let reuseIdentifier = "PopularCategoryCell"
    private var categoryList = [Category]()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func initCollectionView() {
        let categoryCellNib = UINib(nibName: CategoryCell.identifierName, bundle: nil)
        collectionVIewCategory.register(categoryCellNib, forCellWithReuseIdentifier: CategoryCell.identifierName)
        //collectionVIewCategory.setCollectionViewLayout(UICollectionViewFlowLayout.init(), animated: true)
    }
    
    func update(list : [Category]) {
        self.categoryList.removeAll()
        for category in list {
            self.categoryList.append(category)
        }
        print("Category size: \( categoryList.count)")
        self.collectionVIewCategory.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let categoryCell =  getCategoryCell(collectionView: collectionView, indexPath: indexPath)
        categoryCell.bindView(category: categoryList[indexPath.row])
        return categoryCell
    }
    
    
    private func getCategoryCell(collectionView:UICollectionView, indexPath : IndexPath) -> CategoryCell{
        
        let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifierName, for: indexPath) as! CategoryCell
        
//
//        var categoryCell : CategoryCell
//        if let oldCell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.identifierName) as? CategoryCell {
//            categoryCell = oldCell
//            printContent("Reusing old CategoryCell")
//        } else {
//            categoryCell = Bundle.main.loadNibNamed(CategoryCell.identifierName, owner: self)?.first as! CategoryCell
//            printContent("New CategoryCell created")
//        }
        return categoryCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CategoryCell.getCellSize()
    }
    
    
}
