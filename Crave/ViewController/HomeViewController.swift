//
//  HomeViewController.swift
//  Crave
//
//  Created by Yousuf on 18/7/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var profileIcon: UIImageView!
    private let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
        loadCategory()
    }
    
    private func initView() {
        profileIcon.makeCircleShape()
    }
    
    private func loadCategory() {
        viewModel.loadCategories() { categoryResponse in
            print("Total \(categoryResponse.results.count) item found")
            print(categoryResponse.results)
        }
    }
    


}
