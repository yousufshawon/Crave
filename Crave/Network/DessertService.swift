//
//  DessertService.swift
//  Crave
//
//  Created by Yousuf on 11/8/23.
//

import Foundation
import Alamofire

class DessertService {
    
    let className = "Dessert"
    let headers : HTTPHeaders
    
    
    init(headers: HTTPHeaders) {
        self.headers = headers
    }
    
    func getAll (callback: @escaping (DessertResponse) -> Void, urlGenerator : UrlGenerator ) {
        
        let url = urlGenerator.getClassUrl(className: className)
        print("Requesting for Dessert")

        
        AF.request(url, method: .get, headers: headers).responseDecodable(of:DessertResponse.self) { response in
           // print(response)
            
            switch(response.result) {
                
            case .success(let dessertResponse) :
                callback(dessertResponse)
                
            case .failure(let error) :
                print("Error: \(error.localizedDescription)")
                callback(DessertResponse(results: []))
                
            }
            
        }
        
    }
    
}
