//
//  TodaySpecialService.swift
//  Crave
//
//  Created by Yousuf on 8/8/23.
//

import Foundation
import Alamofire

class TodaySpecialService {
    
    let className = "TodaySpecial"
    let headers : HTTPHeaders //= [
    //    "X-Parse-Application-Id" : Keys.applicationId,
   //     "X-Parse-REST-API-Key" : Keys.restApiKey
   // ]
    
    init(requestHeader : HTTPHeaders) {  
        self.headers = requestHeader
    }
    
    func getAll (callback: @escaping (TodaySpecialResponse) -> Void, urlGenerator : UrlGenerator ) {
        
        let url = urlGenerator.getClassUrl(className: className)
        print("Requesting for TodaySpecial")

        
        AF.request(url, method: .get, headers: headers).responseDecodable(of:TodaySpecialResponse.self) { response in
            //print(response)
            
            switch(response.result) {
                
            case .success(let todaySpecialResponse) :
                callback(todaySpecialResponse)
                
            case .failure(let error) :
                print("Error: \(error.localizedDescription)")
                callback(TodaySpecialResponse(results: []))
                
            }
            
        }
        
    }
    
}
