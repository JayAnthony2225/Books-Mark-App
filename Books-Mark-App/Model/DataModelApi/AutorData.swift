//
//  AutorData.swift
//  Books-Mark-App
//
//  Created by Marco Cruz Velázquez on 2/6/22.
//

import Foundation


struct BookCategoryData2: Decodable {
    
    let personal_name : String
    let birth_date : String
    let key : String   // los dos primeros ya habian funcionado , pero sin el works en el json
    let bio : String
    let wikipedia : String
    }
    
