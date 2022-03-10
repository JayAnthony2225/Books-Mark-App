//
//  BookViewCell.swift
//  Books-Mark-App
//
//  Created by Marco Cruz Velázquez on 1/23/22.
//
import UIKit

protocol MenuTableViewCellDelegate{
    func addToCard()
    func lessToCard()
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
    var lessButton: UIButton?
    var addButton : UIButton?
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    
   // var producto : Producto?
    var count = 0
    var counterLabel : UILabel?
//
//    var counterLabel : UILabel = {
//       let label = UILabel()
//        label.text = "0"
//        label.backgroundColor = .red
//        return label
//    }()
    
    init (book : Libro){
        super.init(style: .default, reuseIdentifier: nil)
        self.book1 = book
        self.backgroundColor = .nightBlue
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
//
//        icon2 = UIImageView (frame: CGRect(x: 300, y: 57, width: 35, height: 35))
//        icon2?.image = UIImage(named: "go")
//        icon2?.contentMode = .scaleAspectFill
//        icon2?.layer.cornerRadius = 5
//        contenidoPropio?.addSubview(icon2!)
        
        iconRated = UIImageView (frame: CGRect(x: 0, y: -22, width: 40, height: 40))
        iconRated?.image = UIImage(named: book1?.rate ?? "")
        iconRated?.contentMode = .scaleAspectFill
        iconRated?.layer.cornerRadius = 5
        contenidoPropio?.addSubview(iconRated!)
        
        
        addButton = UIButton(frame: CGRect(x: 190 + 145, y: 50, width: 30, height: 30)) //-45
        addButton?.backgroundColor = .clear
//        addButton?.setTitle("+", for: .normal)
//        addButton?.setTitleColor(.black, for: .normal) // Modificamos el color del titulo del boton
//        addButton?.layer.borderColor = UIColor.green.cgColor
//        addButton?.layer.borderWidth = 1 // Aqui definimos el ancho del borde
//        addButton?.layer.cornerRadius = 10
        addButton?.setImage(UIImage(named: "addBag"), for: .normal)
        addButton?.addTarget(self, action: #selector(addProduct), for: .touchUpInside)
        contenidoPropio?.addSubview(addButton!)
        
        lessButton = UIButton(frame: CGRect(x: 130 + 145, y: 50, width: 30, height: 30)) //-45
        lessButton?.backgroundColor = .clear
        //lessButton?.setTitle("-", for: .normal)
        //lessButton?.setTitleColor(.black, for: .normal) // Modificamos el color del titulo del boton
        //lessButton?.layer.borderColor = UIColor.red.cgColor
        //lessButton?.layer.borderWidth = 1 // Aqui definimos el ancho del borde
        //lessButton?.layer.cornerRadius = 10
        lessButton?.setImage(UIImage(named: "trash"), for: .normal)
        lessButton?.addTarget(self, action: #selector(lessProduct), for: .touchUpInside)
        contenidoPropio?.addSubview(lessButton!)
        
        //counterLabel = UILabel(frame: CGRect(x: 190 + 145, y: 40, width: 20, height: 20))
//        contenidoPropio?.addSubview(counterLabel)
//       counterLabel.addAnchorsAndSize(width: 20, height: 20, left: 5, top: nil, right: nil, bottom: 10, withAnchor: .left, relativeToView: addButton)
//
        counterLabel = UILabel(frame: CGRect(x: 195 + 157, y: 28, width: 30, height: 30))
        counterLabel?.text = "0"
        //counterLabel?.textAlignment = .left
        //counterLabel?.font = UIFont(name: "Helvetica Bold", size: 20)
        counterLabel?.textColor = .black//blueTextColor
        contenidoPropio?.addSubview(counterLabel!)
        
    }
    
    

    @objc func addProduct(){
       // print("ADD \(producto?.nombre)")
        if count < 10{
        count += 1
        counterLabel?.text = "\(count)"
        delegate?.addToCard()
    }  else {
        print("fuera de inventario chavo 🥲")
    }
    }
    @objc func lessProduct(){
      //  print("take \(producto?.nombre)")
        if count > 0 {
        count -= 1
        counterLabel?.text = "\(count)"
        delegate?.lessToCard()
        }
        else{
            print("operacion invalida")
        }
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has no been implemented")
    }
}
