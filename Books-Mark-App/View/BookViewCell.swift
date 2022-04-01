//
//  BookViewCell.swift
//  Books-Mark-App
//
//  Created by Marco Cruz Velázquez on 1/23/22.
//
import UIKit

protocol MenuTableViewCellDelegate{
    //func addToCard()
    func addToCard(product : Libro, count : Int)
    func lessToCard(product : Libro, count : Int)
}

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
    var delegate : MenuTableViewCellDelegate?
    var lessButton = UIButton()
    var addButton = UIButton()
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    var count = 0
    var counterLabel = UILabel()
    
    init (book : Libro, numberOf : Int){
        super.init(style: .default, reuseIdentifier: nil)
        self.book1 = book
        self.count = numberOf
        self.backgroundColor = .white
        initUI()
    }
    func initUI(){
        contenidoPropio = UIView(frame: CGRect(x: 0, y: 20, width: width - 20 , height: height/8))
        contenidoPropio?.backgroundColor = .white
        contenidoPropio?.layer.cornerRadius = 10
        self.contentView.addSubview(contenidoPropio!)
                
        nombreLibro = UILabel(frame: CGRect(x: 125, y: 7, width: width , height: 20 ))
        nombreLibro?.text = book1?.tituloLibro
        nombreLibro?.textAlignment = .left
        nombreLibro?.font = UIFont(name: "Helvetica Bold", size: 20)
        nombreLibro?.textColor = .darkBlue//blueTextColor
        contenidoPropio?.addSubview(nombreLibro!)
        
        autor = UILabel (frame: CGRect(x: 125, y: 20, width: width/2, height: 50))
        autor?.text = "by \(String(describing: book1?.autor ?? ""))"//"by autor"//\(String(describing: product?.precio ?? 0.0))"
        autor?.textColor = .seaBlue//blueTextColor
        contenidoPropio?.addSubview(autor!)

        categoria = UILabel (frame: CGRect(x: 125, y: 30, width: width/2, height: 70))
        categoria?.text = book1?.category//"categoria"//\(String(describing: product?.precio ?? 0.0))"
        categoria?.textColor = .seaBlue //blue
        contenidoPropio?.addSubview(categoria!)
        
        libroImage = UIImageView (frame: CGRect(x: 10, y: 0, width: 90, height: 100))
        libroImage?.image = UIImage(named: book1?.portadaImage ?? "")
        libroImage?.contentMode = .scaleAspectFill
        libroImage?.layer.cornerRadius = 5
        contenidoPropio?.addSubview(libroImage!)
    
        iconRated = UIImageView (frame: CGRect(x: 0, y: -22, width: 40, height: 40))
        iconRated?.image = UIImage(named: book1?.rate ?? "")
        iconRated?.contentMode = .scaleAspectFill
        iconRated?.layer.cornerRadius = 5
        contenidoPropio?.addSubview(iconRated!)
        
        contenidoPropio?.addSubview(addButton)
        addButton.backgroundColor = .clear
        addButton.setImage(UIImage(named: "addBag"), for: .normal)
        addButton.addTarget(self, action: #selector(addProduct), for: .touchUpInside)
        addButton.addAnchorsAndSize(width: 30, height: 30, left: nil, top: Dimensions.grid8_1, right: Dimensions.grid4, bottom: 100, withAnchor: nil, relativeToView: nil)
        
        contenidoPropio?.addSubview(lessButton)
        lessButton.backgroundColor = .clear
        lessButton.setImage(UIImage(named: "trash"), for: .normal)
        lessButton.addTarget(self, action: #selector(lessProduct), for: .touchUpInside)
        lessButton.addAnchorsAndSize(width: 30, height: 30, left: nil, top: Dimensions.grid8_1, right: Dimensions.grid8_2, bottom: 100, withAnchor: nil, relativeToView: nil)
        
        contenidoPropio?.addSubview(counterLabel)
        counterLabel.text = "0"
        counterLabel.textColor = .black//blueTextColor
        counterLabel.addAnchorsAndSize(width: 30, height: 30, left: nil, top: Dimensions.grid5, right: 32, bottom: 100, withAnchor: nil, relativeToView: nil)
        
    }
    @objc func addProduct(){
        print("ADD \(book1?.tituloLibro)")
        if count < 10{
        count += 1
        counterLabel.text = "\(count)"
        print(count)
            delegate?.addToCard(product: book1!, count: count)
    }  else {
        print("fuera de inventario chavo 🥲")
    }
    }
    @objc func lessProduct(){
        print("LESS \(book1?.tituloLibro)")
        if count > 0 {
        count -= 1
        counterLabel.text = "\(count)"
        print(count)
        delegate?.lessToCard(product: book1!, count: count)
        }
        else{
            print("operacion invalida")
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has no been implemented")
    }
}
