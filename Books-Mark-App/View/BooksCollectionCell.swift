//
//  BooksCollectionCell.swift
//  Books-Mark-App
//
//  Created by Marco Cruz Velázquez on 1/25/22.
//

import Foundation
import UIKit

class BooksCollectionCell : UICollectionViewCell{
    
    var imageProduct : UIImageView = {
        let bookImage = UIImageView()
        bookImage.backgroundColor = .clear
        bookImage.contentMode = .scaleAspectFit
        bookImage.image = UIImage(named: "back")
        return bookImage
    }()
    
    var nameProduct : UILabel = {
        let bookTitle = UILabel()
        bookTitle.textColor = .black
        bookTitle.text = "titulo de libro"
        bookTitle.backgroundColor = .clear// se puso clear porque no quiero que se vea
        bookTitle.font = .boldSystemFont(ofSize: 10)
        return bookTitle
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
       // let color = UIColor(displayP3Red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
        self.backgroundColor = .clear
        
        self.addSubview(imageProduct)
        imageProduct.addAnchors(left: 10, top: 10, right: 10, bottom: 30)
        
        self.addSubview(nameProduct)
        nameProduct.addAnchors(left: 10, top: 10, right: 10, bottom: 10, withAnchor: .top, relativeToView: imageProduct)
        
    }
    
    func setData(libro : Libro){
        imageProduct.image = UIImage(named: libro.portadaImage ?? "")
        nameProduct.text = libro.tituloLibro ?? ""
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


