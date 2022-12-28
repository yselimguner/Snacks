//
//  APError.swift
//  Snacks
//
//  Created by Yavuz Güner on 24.12.2022.
//

import Foundation

enum APError:Error{
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
