//
//  ObrasData.swift
//  Books-Mark-App
//
//  Created by Marco Cruz Velázquez on 2/7/22.
//

import Foundation

struct BookCategoryData3: Decodable {
    

     let entries : [Entries]
}
    struct Entries: Decodable{
        let title : String
   }
