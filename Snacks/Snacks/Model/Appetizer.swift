//
//  Appetizer.swift
//  Snacks
//
//  Created by Yavuz Güner on 24.12.2022.
//

import Foundation

struct Appetizer:Decodable,Identifiable {
    let id:Int
    let name:String
    let description:String
    let price:Double
    let imageURL:String
    let protein:Int
    let carbs:Int
    let calories:Int
}

struct AppetizerResponse:Decodable{
    let request:[Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(id: 001, name: "French Fries", description: "It's a good description", price: 10.99, imageURL: "", protein: 350, carbs: 200, calories: 40)
    
    static let appetizers = [sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer]
    
    static let orderItemOne = Appetizer(id: 001, name: "French Fries", description: "It's a good description", price: 10.99, imageURL: "", protein: 350, carbs: 200, calories: 40)
    
    static let orderItemTwo = Appetizer(id: 002, name: "Dutch Fries", description: "It's a good description", price: 10.99, imageURL: "", protein: 350, carbs: 200, calories: 40)
    
    static let orderItemThree = Appetizer(id: 003, name: "Spainish Fries", description: "It's a good description", price: 10.99, imageURL: "", protein: 350, carbs: 200, calories: 40)
    
    static let orderItems = [orderItemOne,orderItemTwo,orderItemThree]
    
}
