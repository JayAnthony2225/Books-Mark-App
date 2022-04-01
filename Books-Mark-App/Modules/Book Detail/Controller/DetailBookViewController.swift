//  DetailBookViewController.swift
//  Books-Mark-App
//  Created by Marco Cruz Velázquez on 1/23/22.

import UIKit

class DetailBookViewController: UIViewController {

    var topImageView : UIImageView?
    var libroImage : UIImageView?
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var productContentView : UIView?
    var descriptionView = UIView()
    var autorView = UIView()
    var backButton : UIButton?
    var libro : Libro?
    var contenedorText : UIView?
    var contenedorText1 : UIView?
    var contenedorText2 : UIView?
    var contenedorText3 : UIView?
    var tituloLabel = UILabel()
    var autorLabel : UILabel?
    var autorLabel2 = UILabel()
    var autorLabel3 : UILabel?
    var categoriaLabel : UILabel?
    var precioLabel : UILabel?
    var iconRated : UIImageView?
    var autorFoto : UIImageView?
    var descripLabel : UILabel?
   
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .nightBlue// pantalla de detalle
        initUI()
    }
    
    func initUI(){
        createProductView()
        createDescription()
        autorDescription()
        
        topImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height/6))
        topImageView?.image = UIImage(named:"backImage1")
        topImageView?.layer.masksToBounds = true
        topImageView?.contentMode = .scaleAspectFill
        topImageView?.layer.cornerRadius = 15
        view.addSubview(topImageView!)
        
        view.addSubview(tituloLabel)
        tituloLabel.text = libro?.tituloLibro ?? ""
        tituloLabel.textColor = .nightBlue
        tituloLabel.font = UIFont(name: "Helvetica Bold", size: 24)
        tituloLabel.addAnchorsAndSize(width: nil, height: 30, left: Dimensions.grid4, top: 50, right: Dimensions.grid4, bottom: nil , withAnchor: nil, relativeToView: autorView)
        

    }

    func createProductView(){
        productContentView = UIView(frame: CGRect(x: 15, y: 150 , width: width - 30 , height: height/3))
        productContentView?.backgroundColor = .nightBlue
        productContentView?.layer.masksToBounds = true
        productContentView?.layer.cornerRadius = 10
        view.addSubview(productContentView!)
        
        contenedorText = UIView(frame: CGRect(x: 0, y: 100, width: width - 30, height: height/7))
        contenedorText?.backgroundColor = .white
        contenedorText?.layer.masksToBounds = true
        contenedorText?.layer.cornerRadius = 10
        productContentView?.addSubview(contenedorText!)
        
        libroImage = UIImageView (frame: CGRect(x: 215, y: 30, width: 130, height: 150))
        libroImage?.image = UIImage(named: libro?.portadaImage ?? "")
        libroImage?.contentMode = .scaleAspectFill
        productContentView?.addSubview(libroImage!)
        
        autorLabel = UILabel(frame: CGRect(x: 20, y: 75, width: 200, height: 100))
        autorLabel?.text = libro?.autor ?? ""
        autorLabel?.textColor = .darkBlue
        autorLabel?.font = UIFont(name: "Arial Bold", size: 18)
        productContentView?.addSubview(autorLabel!)
        
        categoriaLabel = UILabel(frame: CGRect(x: 20, y: 100, width: 200, height: 100))
        categoriaLabel?.text = libro?.category ?? ""
        categoriaLabel?.font = UIFont(name: "Helvetica Bold", size: 18)
        categoriaLabel?.textColor = .darkBlue
        productContentView?.addSubview(categoriaLabel!)
        
        precioLabel = UILabel(frame: CGRect(x: 20, y: 145, width: 150, height: 50))
        precioLabel?.text = "Precio: $\(String(describing: libro?.precio ?? 500))0MX"
        precioLabel?.font = UIFont(name: "Helvetica Bold", size: 16)
        precioLabel?.textColor = .seaBlue
        productContentView?.addSubview(precioLabel!)
        
        iconRated = UIImageView (frame: CGRect(x: 300, y: 0, width: 60, height: 60))
        iconRated?.image = UIImage(named: libro?.rate ?? "")
        iconRated?.contentMode = .scaleAspectFill
        iconRated?.layer.cornerRadius = 5
        productContentView?.addSubview(iconRated!)
        
    }
    
    func createDescription(){

        view.addSubview(descriptionView)
        descriptionView.backgroundColor = .clear
        descriptionView.layer.masksToBounds = true
        descriptionView.layer.cornerRadius = 10
        descriptionView.addAnchorsAndSize(width: nil, height: 100, left: Dimensions.grid4, top: nil, right: Dimensions.grid4, bottom: 180 , withAnchor: nil, relativeToView: autorView)
        
        contenedorText1 = UIView(frame: CGRect(x: 0, y: 0, width: width - 25, height: height/4))
        contenedorText1?.backgroundColor = .nightBlue
        contenedorText1?.layer.masksToBounds = true
        contenedorText1?.layer.cornerRadius = 10
        descriptionView.addSubview(contenedorText1!)
        
        contenedorText2 = UIView(frame: CGRect(x: 0, y: 10, width: width - 25, height: height/2))
        contenedorText2?.backgroundColor = .white
        contenedorText2?.layer.masksToBounds = true
        contenedorText2?.layer.cornerRadius = 10
        descriptionView.addSubview(contenedorText2!)
        
        autorLabel3 = UILabel(frame: CGRect(x: 10, y: 15, width: width - 32, height: 100))
        autorLabel3?.text = libro?.descripcion ?? ""
        autorLabel3?.textColor = .darkBlue
        autorLabel3?.numberOfLines = 0
        autorLabel3?.adjustsFontSizeToFitWidth = true
        autorLabel3?.font = UIFont(name: "Arial Bold", size: 16)
        descriptionView.addSubview(autorLabel3!)
        
        descripLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 200, height: 50))
        descripLabel?.text = "Descripción:"
        descripLabel?.textColor = .seaBlue
        descripLabel?.numberOfLines = 0
        descripLabel?.adjustsFontSizeToFitWidth = true
        descripLabel?.font = UIFont(name: "Arial Bold", size: 24)
        descriptionView.addSubview(descripLabel!)
    }
    
    func autorDescription(){

        view.addSubview(autorView)
        autorView.backgroundColor = .clear
        autorView.layer.masksToBounds = true
        autorView.layer.cornerRadius = 10
        autorView.addAnchorsAndSize(width: nil, height: 130, left: Dimensions.grid4, top: nil, right: Dimensions.grid4, bottom: 30, withAnchor: nil, relativeToView: nil)
        
        contenedorText2 = UIView(frame: CGRect(x: 10, y: 0, width: width - 25, height: height))
        contenedorText2?.backgroundColor = .white
        contenedorText2?.layer.masksToBounds = true
        contenedorText2?.layer.cornerRadius = 10
        autorView.addSubview(contenedorText2!)
        
        view.addSubview(autorLabel2)
        autorLabel2.text = libro?.autorInfo ?? ""
        autorLabel2.textColor = .darkBlue
        autorLabel2.numberOfLines = 0
        autorLabel2.adjustsFontSizeToFitWidth = true
        autorLabel2.font = UIFont(name: "Arial Bold", size: 14)
        autorLabel2.addAnchorsAndSize(width: nil, height: 100, left: Dimensions.grid9_2, top: nil, right: Dimensions.grid4, bottom: 50, withAnchor: nil, relativeToView: nil)
                
        autorFoto = UIImageView (frame: CGRect(x: 0, y: 20, width: 110, height: 150))
        autorFoto?.image = UIImage(named: libro?.autorFoto ?? "")
        autorFoto?.contentMode = .scaleAspectFill
        autorView.addSubview(autorFoto!)
    }

}
