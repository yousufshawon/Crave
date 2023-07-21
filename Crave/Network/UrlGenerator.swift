//
//  UrlGenerator.swift
//  Crave
//
//  Created by Yousuf on 18/7/23.
//

import Foundation

class UrlGenerator {
    
    private let classPath = "classes/"
    
    func getClassUrl(className:String) -> String {
        return Constants.AppUrl.craveBaseUrl + classPath + className
    }
    
}
