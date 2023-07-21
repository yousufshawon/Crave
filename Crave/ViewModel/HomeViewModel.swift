//
//  HomeViewModel.swift
//  Crave
//
//  Created by Yousuf on 18/7/23.
//

import Foundation


class HomeViewModel {
    
    let categoryService = CategoryService()
    
    func loadCategories(callback : @escaping(CategoryResponse) -> Void) {
        categoryService.getCategories(callback: callback)
    }
    
}
