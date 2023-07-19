//
//  HomeViewController.swift
//  Crave
//
//  Created by Yousuf on 18/7/23.
//

import UIKit

class HomeViewController: UIViewController {

  private let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadCategory()
    }
    
    private func loadCategory() {
        viewModel.loadCategories() { categoryResponse in
            print("Total \(categoryResponse.results.count) item found")
            print(categoryResponse.results)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
