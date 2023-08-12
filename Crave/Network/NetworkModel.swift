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
    var imageUrl : String
}

struct CategoryResponse : Decodable {
    var results : [Category]
}


struct TodaySpecial : Decodable {
    var name : String
    var price : Int
    var discount : Int
    var description : String
    var imageUrl : String

}

struct TodaySpecialResponse : Decodable {
    var results : [TodaySpecial]
}

struct Dessert : Decodable {
    var name : String
    var price : Int
    var discount : Int
    var description : String
    var imageUrl : String

}

struct DessertResponse : Decodable {
    var results : [Dessert]
}

