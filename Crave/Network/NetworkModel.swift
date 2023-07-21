//
//  NetworkModel.swift
//  Crave
//
//  Created by Yousuf on 18/7/23.
//

import Foundation

struct Category : Decodable {
    var name : String
    var rating : Int
}

struct CategoryResponse : Decodable {
    var results : [Category]
}
