//
//  HomeViewController.swift
//  Crave
//
//  Created by Yousuf on 18/7/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableViewContent: UITableView!
    @IBOutlet weak var collectionViewCategory: UICollectionView!
    private let viewModel = HomeViewModel()
    private var categoryList = [Category]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        loadCategory()
    }
    
    private func initView() {

    }
    
//    private func initCollectionView() {
//        let categoryCellNib = UINib(nibName: CategoryCell.identifierName, bundle: nil)
//        collectionViewCategory.register(categoryCellNib, forCellWithReuseIdentifier: CategoryCell.identifierName)
//        collectionViewCategory.setCollectionViewLayout(UICollectionViewFlowLayout.init(), animated: true)
//    }
    
    private func loadCategory() {
        viewModel.loadCategories() { categoryResponse in
            print("Total \(categoryResponse.results.count) item found")
            print(categoryResponse.results)
            self.categoryList.removeAll()
            for category in categoryResponse.results {
                self.categoryList.append(category)
            }
            self.tableViewContent.reloadData()
           // self.collectionViewCategory.reloadData()
        }
    }
    
}


extension HomeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("HomeViewController: tableView cellForRowAt section -> \(indexPath.section) row -> \(indexPath.row)")
        
        // Header
        if(indexPath.row == 0) {
            return getHeaderCell(tableView: tableView)
        } else if(indexPath.row == 1) {
            let populatCategoryCell =  getPoluparCategoryView(tableView: tableView)
            populatCategoryCell.update(list: categoryList)
            return populatCategoryCell
        } else if(indexPath.row == 2) {
            let cell = getTodaysSpecialCell(tableView: tableView)
            cell.update()
            return cell
        } else if(indexPath.row == 3) {
          return getDessertViewCell(tableView: tableView)
        } else {
            return UITableViewCell()
        }
    }
    
    private func getHeaderCell(tableView:UITableView) -> UITableViewCell {
        if let oldCell = tableView.dequeueReusableCell(withIdentifier: HomeHeaderCell.reuseIdentifier) as? HomeHeaderCell {
            print("Old Cell reused")
            return oldCell
        } else {
            let newCell = Bundle.main.loadNibNamed(HomeHeaderCell.reuseIdentifier, owner: self)?.first as! HomeHeaderCell
            print("New Cell created")
            return newCell
        }
    }
    
    private func getPoluparCategoryView(tableView:UITableView) -> PopularCategoryCell {
        
        if let oldCell = tableView.dequeueReusableCell(withIdentifier: PopularCategoryCell.reuseIdentifier) as? PopularCategoryCell {
            print("Popular Category Old cell reusing")
            return oldCell
        } else {
            let newCell = Bundle.main.loadNibNamed(PopularCategoryCell.reuseIdentifier, owner: self)?.first as! PopularCategoryCell
            print("Popular Category New call created")
            return newCell
        }
    }
    
    private func getTodaysSpecialCell(tableView:UITableView) -> TodaySpecialViewCell {
        if let oldCell = tableView.dequeueReusableCell(withIdentifier: TodaySpecialViewCell.identifierName) as? TodaySpecialViewCell {
            print("Reusing Todays special cell")
            return oldCell
        } else {
            let newCell = Bundle.main.loadNibNamed(TodaySpecialViewCell.identifierName, owner: self)?.first as! TodaySpecialViewCell
            print("Todays special new call created")
            return newCell
        }
    }
    
    private func getDessertViewCell(tableView : UITableView) -> UITableViewCell {
        if let oldCell = tableView.dequeueReusableCell(withIdentifier: DessertViewCell.identifierName) as? DessertViewCell {
            print("Reusing DessertViewCell")
            return oldCell
        } else {
            let newCell = Bundle.main.loadNibNamed(DessertViewCell.identifierName, owner: self)?.first as! DessertViewCell
            print("DessertView new cell created")
            return newCell
        }
    }
    
    
}

extension HomeViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return getCategoryCell(collectionView: collectionView, indexPath: indexPath)
    }
    
    
    func getCategoryCell(collectionView:UICollectionView, indexPath : IndexPath) -> CategoryCell{
        
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
        let cellWidth = 0 + 100 + 10
        let cellHeight = 0 + 100 + 40 + 10
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    
}

