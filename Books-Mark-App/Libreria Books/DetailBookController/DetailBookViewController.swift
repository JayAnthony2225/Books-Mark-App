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
    var descriptionView : UIView?
    var autorView : UIView?
    var backButton : UIButton?
    var descripcionButton : UIButton?
    var detalleButton : UIButton?
    var libro : Libro?
    var contenedorText : UIView?
    var contenedorText1 : UIView?
    var contenedorText2 : UIView?
    var contenedorText3 : UIView?
    var tituloLabel : UILabel?
    var autorLabel : UILabel?
    var autorLabel2 : UILabel?
    var autorLabel3 : UILabel?
    var categoriaLabel : UILabel?
    var precioLabel : UILabel?
    var iconRated : UIImageView?
    var backText : UILabel?
    var autorFoto : UIImageView?
    
    var darkBlueTextColor = UIColor(displayP3Red: 27/255, green: 38/255, blue: 44/255, alpha: 1)
    var blueTextColor = UIColor(displayP3Red: 15/255, green: 76/255, blue: 117/255, alpha: 1)
    var lightBTextColor = UIColor(displayP3Red: 50/255, green: 130/255, blue: 184/255, alpha: 1)
    var whiteTextColor = UIColor(displayP3Red: 187/255, green: 225/255, blue: 250/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = darkBlueTextColor// pantalla de detalle
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
        
        
        backButton = UIButton(frame: CGRect(x: 10, y: 45, width: 20, height: 20))
        backButton?.setImage(UIImage(named: "backButton"), for: .normal)
        backButton?.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        view.addSubview(backButton!)
        
        backText = UILabel(frame: CGRect(x: 37, y: 30, width: 100, height: 50))
        backText?.text = "Regresar"
        backText?.textColor = darkBlueTextColor
        backText?.font = UIFont(name: "Helvetica Bold", size: 20)
        view.addSubview(backText!)
        
       
    }

    func createProductView(){
        productContentView = UIView(frame: CGRect(x: 15, y: 150 , width: width - 30 , height: height/4))
        productContentView?.backgroundColor = darkBlueTextColor
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
        //libroImage?.layer.cornerRadius = 5
        //libroImage?.layer.masksToBounds = true // esto es para los bordes y que se ajuste la imagen
        productContentView?.addSubview(libroImage!)
        
        tituloLabel = UILabel(frame: CGRect(x: 15, y: 13, width: 200, height: 100))
        tituloLabel?.text = libro?.tituloLibro ?? ""
        tituloLabel?.textColor = whiteTextColor
        tituloLabel?.font = UIFont(name: "Helvetica Bold", size: 22)
        productContentView?.addSubview(tituloLabel!)
        
        autorLabel = UILabel(frame: CGRect(x: 20, y: 75, width: 200, height: 100))
        autorLabel?.text = libro?.autor ?? ""
        autorLabel?.textColor = blueTextColor
        autorLabel?.font = UIFont(name: "Arial Bold", size: 18)
        productContentView?.addSubview(autorLabel!)
        
        categoriaLabel = UILabel(frame: CGRect(x: 20, y: 100, width: 200, height: 100))
        categoriaLabel?.text = libro?.category ?? ""
        categoriaLabel?.font = UIFont(name: "Helvetica Bold", size: 18)
        categoriaLabel?.textColor = blueTextColor
        productContentView?.addSubview(categoriaLabel!)
        
        precioLabel = UILabel(frame: CGRect(x: 20, y: 125, width: 200, height: 100))
        precioLabel?.text = "$\(String(describing: libro?.precio ?? 0))0MX"
        precioLabel?.font = UIFont(name: "Helvetica Bold", size: 16)
        precioLabel?.textColor = lightBTextColor
        productContentView?.addSubview(precioLabel!)
        
        iconRated = UIImageView (frame: CGRect(x: 300, y: 0, width: 60, height: 60))
        iconRated?.image = UIImage(named: libro?.rate ?? "")
        iconRated?.contentMode = .scaleAspectFill
        iconRated?.layer.cornerRadius = 5
        productContentView?.addSubview(iconRated!)
        
        
        
        
    }
    
    func createDescription(){
        descriptionView = UIView(frame: CGRect(x: 15, y: 380, width: width - 30, height: 200))
        descriptionView?.backgroundColor = .clear
        descriptionView?.layer.masksToBounds = true
        descriptionView?.layer.cornerRadius = 10
        view.addSubview(descriptionView!)
        
        contenedorText1 = UIView(frame: CGRect(x: 0, y: 0, width: width - 25, height: height/4))
        contenedorText1?.backgroundColor = darkBlueTextColor
        contenedorText1?.layer.masksToBounds = true
        contenedorText1?.layer.cornerRadius = 10
        descriptionView?.addSubview(contenedorText1!)
        
        contenedorText2 = UIView(frame: CGRect(x: 0, y: 60, width: width - 25, height: height/4))
        contenedorText2?.backgroundColor = .white
        contenedorText2?.layer.masksToBounds = true
        contenedorText2?.layer.cornerRadius = 10
        descriptionView?.addSubview(contenedorText2!)
        
        autorLabel3 = UILabel(frame: CGRect(x: 15, y: 20, width: width - 25, height: height/4))
        autorLabel3?.text = libro?.descripcion ?? ""
        autorLabel3?.textColor = blueTextColor
        autorLabel3?.numberOfLines = 0
        autorLabel3?.adjustsFontSizeToFitWidth = true
        autorLabel3?.font = UIFont(name: "Arial Bold", size: 18)
        descriptionView?.addSubview(autorLabel3!)
        
        descripcionButton = UIButton(frame: CGRect(x: 20, y: 15, width: width/3, height: 50))
        descripcionButton?.setTitle("Descripción", for: .normal)
        descripcionButton?.backgroundColor = darkBlueTextColor
        descripcionButton?.layer.borderColor = UIColor.white.cgColor
        descripcionButton?.layer.cornerRadius = 10
        descripcionButton?.layer.borderWidth = 1
        descriptionView?.addSubview(descripcionButton!)
        
        detalleButton = UIButton(frame: CGRect(x: 190, y: 15, width: width/3, height: 50))
        detalleButton?.setTitle("Detalles", for: .normal)
        detalleButton?.backgroundColor = darkBlueTextColor
        detalleButton?.layer.borderColor = UIColor.white.cgColor
        detalleButton?.layer.cornerRadius = 10
        detalleButton?.layer.borderWidth = 1
        //descriptionView?.addSubview(detalleButton!)
    }
    
    func autorDescription(){
        autorView = UIView(frame: CGRect(x: 10, y: 600, width: width - 30, height: 200))
        autorView?.backgroundColor = darkBlueTextColor
        autorView?.layer.masksToBounds = true
        autorView?.layer.cornerRadius = 10
        view.addSubview(autorView!)
        
        contenedorText2 = UIView(frame: CGRect(x: 10, y: 0, width: width - 25, height: height))
        contenedorText2?.backgroundColor = .white
        contenedorText2?.layer.masksToBounds = true
        contenedorText2?.layer.cornerRadius = 10
        autorView?.addSubview(contenedorText2!)
        
        autorLabel = UILabel(frame: CGRect(x: 160, y: 480, width: 300, height: 300))
        autorLabel?.text = libro?.autor ?? ""
        autorLabel?.textColor = darkBlueTextColor
        autorLabel?.font = UIFont(name: "Arial Bold", size: 24)
        view?.addSubview(autorLabel!)
        autorLabel2 = UILabel(frame: CGRect(x: 137, y: 550, width: 230, height: 300))
        autorLabel2?.text = libro?.autorInfo ?? ""
        autorLabel2?.textColor = blueTextColor
        autorLabel2?.numberOfLines = 0
        autorLabel2?.adjustsFontSizeToFitWidth = true
        autorLabel2?.font = UIFont(name: "Arial Bold", size: 14)
        view.addSubview(autorLabel2!)
                
        autorFoto = UIImageView (frame: CGRect(x: 0, y: 20, width: 110, height: 150))
        autorFoto?.image = UIImage(named: libro?.autorFoto ?? "")
        autorFoto?.contentMode = .scaleAspectFill
        //libroImage?.layer.cornerRadius = 5
        //libroImage?.layer.masksToBounds = true // esto es para los bordes y que se ajuste la imagen
        autorView?.addSubview(autorFoto!)
        
        
    }

 
    @objc func backAction(){
     print("Back")
     dismiss(animated: true)
    }
    
}
