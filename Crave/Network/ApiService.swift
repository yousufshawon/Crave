//
//  ApiService.swift
//  Crave
//
//  Created by Yousuf on 8/8/23.
//

import Foundation
import Alamofire


class ApiService {
    
    let headers : HTTPHeaders = [
        "X-Parse-Application-Id" : Keys.applicationId,
        "X-Parse-REST-API-Key" : Keys.restApiKey
    ]
    
    private let urlGenerator = UrlGenerator()
    
    private var todaySpecialService : TodaySpecialService  {
        TodaySpecialService(requestHeader: headers)
    }
    
    private var dessertService : DessertService {
        DessertService(headers: headers)
    }
    
    func getTodaySpecial(callback: @escaping (TodaySpecialResponse) -> Void) {
        todaySpecialService.getAll(callback: callback, urlGenerator: urlGenerator)
    }
    
    func getDessertList(callback: @escaping (DessertResponse) -> Void) {
        dessertService.getAll(callback: callback, urlGenerator: urlGenerator)
    }

    
    
}
