//
//  HomeViewModel.swift
//  Crave
//
//  Created by Yousuf on 18/7/23.
//

import Foundation


class HomeViewModel {
    
    let categoryService = CategoryService()
    let apiService = ApiService()
    
    func loadCategories(callback : @escaping(CategoryResponse) -> Void) {
        categoryService.getCategories(callback: callback)
    }
    
    func loadTodaySpecial( callback : @escaping(TodaySpecialResponse) -> Void ) {
        apiService.getTodaySpecial{ todaySpecialResponse in
            callback(todaySpecialResponse)
        }
    }
    
    
    func loadDesserts(callback : @escaping(DessertResponse) -> Void) {
        apiService.getDessertList { dessertResponse in
            callback(dessertResponse)
        }
    }
    
}
