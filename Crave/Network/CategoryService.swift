//
//  CategoryService.swift
//  Crave
//
//  Created by Yousuf on 18/7/23.
//

import Foundation
import Alamofire

class CategoryService {
    
    private let className = "Category"
    private let urlGenerator = UrlGenerator()
    
    func getCategories() {
        let url = urlGenerator.getClassUrl(className: className)
        let headers : HTTPHeaders = [
            "X-Parse-Application-Id" : Keys.applicationId,
            "X-Parse-REST-API-Key" : Keys.restApiKey
        ]
        
        print("Loadig Categories")
        AF.request(url, method: .get,  headers: headers).responseDecodable(of: CategoryResponse.self) { response in
            print(response)
        }
        
    }
    
}
