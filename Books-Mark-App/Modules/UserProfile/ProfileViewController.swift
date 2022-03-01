//
//  ProfileViewController.swift
//  Books-Mark-App
//
//  Created by Marco Cruz Velázquez on 2/28/22.
//

import UIKit

class ProfileViewController: UIViewController {
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
    var logOut : UILabel?
        
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
            topImageView?.image = UIImage(named:"backImage11")
            topImageView?.layer.masksToBounds = true
            topImageView?.contentMode = .scaleAspectFill
            topImageView?.layer.cornerRadius = 15
            view.addSubview(topImageView!)
            
            //--------------- Boton LOG OUT ---------------
            backButton = UIButton(frame: CGRect(x: 330, y: 50, width: 35, height: 35))
            backButton?.setImage(UIImage(named: "logOut"), for: .normal)
            backButton?.addTarget(self, action: #selector(backAction), for: .touchUpInside)
            view.addSubview(backButton!)
            
            logOut =  UILabel(frame: CGRect(x: 325, y: 38, width: width/4, height: height/8))
            logOut?.backgroundColor = .clear
            logOut?.text = "Log Out"
            logOut?.font = UIFont(name: "Helvetica Bold", size: 14)
            logOut?.textColor = .nightBlue
            view.addSubview(logOut!)
        }

        func createProductView(){
            productContentView = UIView(frame: CGRect(x: 15, y: 150 , width: width - 30 , height: height/4))
            productContentView?.backgroundColor = .nightBlue
            productContentView?.layer.masksToBounds = true
            productContentView?.layer.cornerRadius = 10
            view.addSubview(productContentView!)
            
            contenedorText = UIView(frame: CGRect(x: 0, y: 100, width: width - 30, height: height/7))
            contenedorText?.backgroundColor = .white
            contenedorText?.layer.masksToBounds = true
            contenedorText?.layer.cornerRadius = 10
            productContentView?.addSubview(contenedorText!)
            
            libroImage = UIImageView (frame: CGRect(x: 0, y: 50, width: 130, height: 150))
            libroImage?.image = UIImage(named: "MarcoImage")
            libroImage?.contentMode = .scaleAspectFill
            libroImage?.layer.cornerRadius = 10
            productContentView?.addSubview(libroImage!)
            
            tituloLabel = UILabel(frame: CGRect(x: 150, y: 5, width: 250, height: 100))
            tituloLabel?.text = UserDefaults.standard.string(forKey: "User")//"Marco A. Cruz "
            tituloLabel?.textColor = .white
            tituloLabel?.font = UIFont(name: "Optima Regular", size: 28)
            productContentView?.addSubview(tituloLabel!)
            
            autorLabel = UILabel(frame: CGRect(x: 200, y: 75, width: 200, height: 100))
            autorLabel?.text = "faceBook: velazquezMark"
            autorLabel?.textColor = .seaBlue
            autorLabel?.font = UIFont(name: "Arial Bold", size: 18)
            productContentView?.addSubview(autorLabel!)
            
            categoriaLabel = UILabel(frame: CGRect(x: 200, y: 100, width: 200, height: 100))
            categoriaLabel?.text = "GitHub: JAyAnthony225"
            categoriaLabel?.font = UIFont(name: "Helvetica Bold", size: 18)
            categoriaLabel?.textColor = .seaBlue
            productContentView?.addSubview(categoriaLabel!)
            
            precioLabel = UILabel(frame: CGRect(x: 200, y: 125, width: 200, height: 100))
            precioLabel?.text = "twitter: jzandmark!@#"
            precioLabel?.font = UIFont(name: "Helvetica Bold", size: 16)
            precioLabel?.textColor = .skyBlue
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
            contenedorText1?.backgroundColor = .nightBlue
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
            autorLabel3?.textColor = .seaBlue
            autorLabel3?.numberOfLines = 0
            autorLabel3?.adjustsFontSizeToFitWidth = true
            autorLabel3?.font = UIFont(name: "Arial Bold", size: 18)
            descriptionView?.addSubview(autorLabel3!)
            
            descripcionButton = UIButton(frame: CGRect(x: 20, y: 15, width: width/3, height: 50))
            descripcionButton?.setTitle("Libro Favorito", for: .normal)
            descripcionButton?.backgroundColor = .nightBlue
            descripcionButton?.layer.borderColor = UIColor.white.cgColor
            descripcionButton?.layer.cornerRadius = 10
            descripcionButton?.layer.borderWidth = 1
            descriptionView?.addSubview(descripcionButton!)

        }
        
        func autorDescription(){
            autorView = UIView(frame: CGRect(x: 10, y: 600, width: width - 30, height: 200))
            autorView?.backgroundColor = .nightBlue
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
            autorLabel?.textColor = .nightBlue
            autorLabel?.font = UIFont(name: "Arial Bold", size: 24)
            view?.addSubview(autorLabel!)
            autorLabel2 = UILabel(frame: CGRect(x: 137, y: 550, width: 230, height: 300))
            autorLabel2?.text = libro?.autorInfo ?? ""
            autorLabel2?.textColor = .seaBlue
            autorLabel2?.numberOfLines = 0
            autorLabel2?.adjustsFontSizeToFitWidth = true
            autorLabel2?.font = UIFont(name: "Arial Bold", size: 14)
            view.addSubview(autorLabel2!)
                    
            autorFoto = UIImageView (frame: CGRect(x: 0, y: 20, width: 110, height: 150))
            autorFoto?.image = UIImage(named: libro?.autorFoto ?? "")
            autorFoto?.contentMode = .scaleAspectFill
            autorView?.addSubview(autorFoto!)
        }

        @objc func backAction(){
            UserDefaults.standard.removeObject(forKey: "User")
            let backHome = ViewController()
            backHome.modalPresentationStyle = .fullScreen
            present(backHome, animated: true,completion:{
                        print("backToWelcomePage")
                        })
            
         //dismiss(animated: true)
        }
        
    }
