//
//  BookViewCell.swift
//  Books-Mark-App
//
//  Created by Marco Cruz Velázquez on 1/23/22.
//

import Foundation
import UIKit
    
class bookTableViewCell : UITableViewCell{
    
    var contenidoPropio : UIView?
    var nombreLibro :  UILabel?
    var autor : UILabel?
    var categoria : UILabel?
    var descripLibro : UILabel?
    var precioBook : UILabel?
    var libroImage  : UIImageView?
    var iconRated : UIImageView?
    var icon2 : UIImageView?
   
    var book1 : Libro?
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    var darkBlueTextColor = UIColor(displayP3Red: 27/255, green: 38/255, blue: 44/255, alpha: 1)
    var blueTextColor = UIColor(displayP3Red: 15/255, green: 76/255, blue: 117/255, alpha: 1)
    var lightBTextColor = UIColor(displayP3Red: 50/255, green: 130/255, blue: 184/255, alpha: 1)
    var whiteTextColor = UIColor(displayP3Red: 187/255, green: 225/255, blue: 250/255, alpha: 1)
   
    init (book : Libro){
        super.init(style: .default, reuseIdentifier: nil)
        self.book1 = book
        self.backgroundColor = darkBlueTextColor
        initUI()
    }
    
    func initUI(){
        contenidoPropio = UIView(frame: CGRect(x: 0, y: 20, width: width - 20 , height: height/8))
        contenidoPropio?.backgroundColor = .white
        contenidoPropio?.layer.cornerRadius = 10
        self.addSubview(contenidoPropio!)
                
        nombreLibro = UILabel(frame: CGRect(x: 125, y: 7, width: width/2 , height: 20 ))
        nombreLibro?.text = book1?.tituloLibro
        nombreLibro?.textAlignment = .left
        nombreLibro?.font = UIFont(name: "Helvetica Bold", size: 20)
        nombreLibro?.textColor = blueTextColor
        contenidoPropio?.addSubview(nombreLibro!)
        
        autor = UILabel (frame: CGRect(x: 125, y: 20, width: width/2, height: 50))
        autor?.text = "by \(String(describing: book1?.autor ?? ""))"//"by autor"//\(String(describing: product?.precio ?? 0.0))"
        autor?.textColor = blueTextColor
        contenidoPropio?.addSubview(autor!)

        categoria = UILabel (frame: CGRect(x: 125, y: 30, width: width/2, height: 70))
        categoria?.text = book1?.category//"categoria"//\(String(describing: product?.precio ?? 0.0))"
        categoria?.textColor = blueTextColor
        contenidoPropio?.addSubview(categoria!)
        
        libroImage = UIImageView (frame: CGRect(x: 10, y: 0, width: 90, height: 100))
        libroImage?.image = UIImage(named: book1?.portadaImage ?? "")
        libroImage?.contentMode = .scaleAspectFill
        libroImage?.layer.cornerRadius = 5
//        libroImage?.layer.borderWidth = 1
//        libroImage?.layer.masksToBounds = true
        contenidoPropio?.addSubview(libroImage!)
        
        icon2 = UIImageView (frame: CGRect(x: 300, y: 57, width: 35, height: 35))
        icon2?.image = UIImage(named: "go")
        icon2?.contentMode = .scaleAspectFill
        icon2?.layer.cornerRadius = 5
        contenidoPropio?.addSubview(icon2!)
        
        iconRated = UIImageView (frame: CGRect(x: 300, y: 8, width: 40, height: 40))
        iconRated?.image = UIImage(named: book1?.rate ?? "")
        iconRated?.contentMode = .scaleAspectFill
        iconRated?.layer.cornerRadius = 5
        contenidoPropio?.addSubview(iconRated!)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has no been implemented")
    }
}
