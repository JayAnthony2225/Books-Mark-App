//
//  BookData.swift
//  Books-Mark-App
//
//  Created by Marco Cruz Velázquez on 2/5/22.
//

import Foundation

struct BookCategoryData: Decodable {

    let name : String
    let works :[Works]
}

struct Works: Decodable{
    let title : String
}
