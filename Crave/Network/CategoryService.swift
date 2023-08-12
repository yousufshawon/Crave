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
    
    func getCategories(callback : @escaping(CategoryResponse) -> Void) {
        let url = urlGenerator.getClassUrl(className: className)
        let headers : HTTPHeaders = [
            "X-Parse-Application-Id" : Keys.applicationId,
            "X-Parse-REST-API-Key" : Keys.restApiKey
        ]
        
        print("Loadig Categories")
        AF.request(url, method: .get,  headers: headers).responseDecodable(of: CategoryResponse.self) { response in
           // print(response)
            switch(response.result) {
                
            case .success(let categoryResponse):
                //let categoryResponse = response.value
                callback(categoryResponse)
                
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                callback(CategoryResponse(results: []))
                
                // case .failure(_):
                //     callback(CategoryResponse(results: []))
                
            }
        }
        
    }
    
}
