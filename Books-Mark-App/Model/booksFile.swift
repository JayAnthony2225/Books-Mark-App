//
//  booksFile.swift
//  Books-Mark-App
//  Created by Marco Cruz Velázquez on 1/23/22.
import Foundation
import  UIKit

class BookObject{
    var bookCategorias : [Categoria]?
    var cateTitle : String?
    
    init(bookCategorias : [Categoria], cateTitle: String){
        self.bookCategorias = bookCategorias
        self.cateTitle = cateTitle
    }
}
class Categoria{
    var categoriaName : String?
    var librosInfo : [Libro]?
    
    init(categoriaName : String, librosInfo : [Libro]){
        self.categoriaName = categoriaName
        self.librosInfo = librosInfo
    }
}
class Libro{
    var tituloLibro : String?
    var autor : String?
    var category : String?
    var precio : Float?
    var rate : String?
    var portadaImage : String?
    var descripcion : String?
    var autorFoto : String?
    var autorInfo : String?
    
    init(tituloLibro: String, autor: String, category : String, precio : Float, rate : String, portadaImage : String, descripcion : String, autorFoto: String, autorInfo: String ){
        
        self.tituloLibro = tituloLibro
        self.autor = autor
        self.category = category
        self.precio = precio
        self.rate = rate
        self.portadaImage = portadaImage
        self.descripcion = descripcion
        self.autorFoto = autorFoto
        self.autorInfo = autorInfo
    }
}
