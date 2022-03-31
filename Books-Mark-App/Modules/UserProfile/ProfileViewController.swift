//
//  ProfileViewController.swift
//  Books-Mark-App
//
//  Created by Marco Cruz Velázquez on 2/28/22.
//

import UIKit

class ProfileViewController: UIViewController {
    var topImageView : UIImageView?
    var bottomImageView : UIImageView?
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
    var tiraImagenes : UIImageView?
    var logOut : UILabel?
    var niceToLabel : UILabel?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .nightBlue// pantalla de detalle
            initUI()
            chargeUser()
        }
        
    func chargeUser(){
        if UserDefaults.standard.string(forKey: "User") == "Mark-Anthony"{
            createProductView()
        } else{
//            carga info default
            createProductDefault()
        }
    }
        func initUI(){

            topImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height/6))
            topImageView?.image = UIImage(named:"backImage11")
            topImageView?.layer.masksToBounds = true
            topImageView?.contentMode = .scaleAspectFill
            topImageView?.layer.cornerRadius = 15
            view.addSubview(topImageView!)
            
            //--------------- Boton LOG OUT ---------------
            backButton = UIButton(frame: CGRect(x: 320, y: 60, width: 35, height: 35))
            backButton?.setImage(UIImage(named: "logOut"), for: .normal)
            backButton?.addTarget(self, action: #selector(backAction), for: .touchUpInside)
            view.addSubview(backButton!)
            
            logOut =  UILabel(frame: CGRect(x: 325, y: 48, width: width/4, height: height/8))
            logOut?.backgroundColor = .clear
            logOut?.text = "Log Out"
            logOut?.font = UIFont(name: "Helvetica Bold", size: 14)
            logOut?.textColor = .nightBlue
            view.addSubview(logOut!)
        }

        func createProductView(){
            
            niceToLabel = UILabel(frame: CGRect(x: 10, y: 80, width: width - 20, height: 200))
            niceToLabel?.text = "Nice To Have You Back."
            niceToLabel?.textColor = .white
            niceToLabel?.numberOfLines = 5
            niceToLabel?.adjustsFontSizeToFitWidth = true
            niceToLabel?.font = UIFont(name: "Arial Bold", size: 28)
            view.addSubview(niceToLabel!)

            productContentView = UIView(frame: CGRect(x: 15, y: 250 , width: width - 30 , height: height/4))
            productContentView?.backgroundColor = .white
            productContentView?.layer.masksToBounds = true
            productContentView?.layer.cornerRadius = 10
            view.addSubview(productContentView!)
            
            libroImage = UIImageView (frame: CGRect(x: 0, y: 290, width: 130, height: 150))
            libroImage?.image = UIImage(named: "MarcoImage")
            libroImage?.contentMode = .scaleAspectFill
            libroImage?.layer.cornerRadius = 10
            view.addSubview(libroImage!)
            
            tiraImagenes = UIImageView (frame: CGRect(x: 150, y: 250, width: width / 10, height: height / 4))
            tiraImagenes?.image = UIImage(named: "tiraImagenes")
            tiraImagenes?.contentMode = .scaleAspectFill
            tiraImagenes?.layer.cornerRadius = 10
            view.addSubview(tiraImagenes!)
//Persistencia de datos USer
            tituloLabel = UILabel(frame: CGRect(x: 130, y: 175, width: 250, height: 100))
            tituloLabel?.text = UserDefaults.standard.string(forKey: "User")//"Marco A. Cruz "
            tituloLabel?.textColor = .systemRed
            tituloLabel?.font = UIFont(name: "Arial Bold", size: 30)
            view.addSubview(tituloLabel!)
            
            autorLabel = UILabel(frame: CGRect(x: 190, y: 228, width: 250, height: 100))
            autorLabel?.text = "VelazquezMark"
            autorLabel?.textColor = .seaBlue
            autorLabel?.font = UIFont(name: "Arial Bold", size: 16)
            view.addSubview(autorLabel!)
            
            categoriaLabel = UILabel(frame: CGRect(x: 190, y: 311, width: 250, height: 100))
            categoriaLabel?.text = "VelazquezAnthony225"
            categoriaLabel?.font = UIFont(name: "Helvetica Bold", size: 16)
            categoriaLabel?.textColor = .black
            view.addSubview(categoriaLabel!)
            
            precioLabel = UILabel(frame: CGRect(x: 190, y: 266, width: 250, height: 100))
            precioLabel?.text = "jzandmark!@#twitter"
            precioLabel?.font = UIFont(name: "Helvetica Bold", size: 16)
            precioLabel?.textColor = .seaBlue
            view.addSubview(precioLabel!)
            autorLabel3 = UILabel(frame: CGRect(x: 10, y: 460 - 20, width: width - 20, height: 200))
            autorLabel3?.text = "In Case You Missed It."
            autorLabel3?.textColor = .white
            autorLabel3?.numberOfLines = 5
            autorLabel3?.adjustsFontSizeToFitWidth = true
            autorLabel3?.font = UIFont(name: "Arial Bold", size: 30)
            view.addSubview(autorLabel3!)
            
            bottomImageView = UIImageView(frame: CGRect(x: 0, y: 590 - 20, width: width, height: height/4))
            bottomImageView?.image = UIImage(named:"backImage-1")
            bottomImageView?.layer.masksToBounds = true
            bottomImageView?.contentMode = .scaleAspectFill
            bottomImageView?.layer.cornerRadius = 15
            view.addSubview(bottomImageView!)
        }
    func createProductDefault(){
        niceToLabel = UILabel(frame: CGRect(x: 10, y: 80, width: width - 20, height: 200))
        niceToLabel?.text = "Welcome!."
        niceToLabel?.textColor = .white
        niceToLabel?.numberOfLines = 5
        niceToLabel?.adjustsFontSizeToFitWidth = true
        niceToLabel?.font = UIFont(name: "Arial Bold", size: 28)
        view.addSubview(niceToLabel!)

        productContentView = UIView(frame: CGRect(x: 15, y: 250 , width: width - 30 , height: height/4))
        productContentView?.backgroundColor = .white
        productContentView?.layer.masksToBounds = true
        productContentView?.layer.cornerRadius = 10
        view.addSubview(productContentView!)
        
        libroImage = UIImageView (frame: CGRect(x: 10, y: 290, width: 110, height: 130))
        libroImage?.image = UIImage(named: "defaultImage")
        libroImage?.contentMode = .scaleAspectFill
        libroImage?.layer.cornerRadius = 10
        view.addSubview(libroImage!)
        
        tiraImagenes = UIImageView (frame: CGRect(x: 150, y: 250, width: width / 10, height: height / 4))
        tiraImagenes?.image = UIImage(named: "tiraImagenes")
        tiraImagenes?.contentMode = .scaleAspectFill
        tiraImagenes?.layer.cornerRadius = 10
        view.addSubview(tiraImagenes!)
//Persistencia de datos USer
        tituloLabel = UILabel(frame: CGRect(x: 130, y: 175, width: 250, height: 100))
        tituloLabel?.text = UserDefaults.standard.string(forKey: "User")//"Marco A. Cruz "
        tituloLabel?.textColor = .systemRed
        tituloLabel?.font = UIFont(name: "Arial Bold", size: 30)
        view.addSubview(tituloLabel!)
        
        autorLabel = UILabel(frame: CGRect(x: 190, y: 228, width: 250, height: 100))
        autorLabel?.text = "DummyFaceBook"
        autorLabel?.textColor = .seaBlue
        autorLabel?.font = UIFont(name: "Arial Bold", size: 16)
        view.addSubview(autorLabel!)
        
        categoriaLabel = UILabel(frame: CGRect(x: 190, y: 308, width: 250, height: 100))
        categoriaLabel?.text = "Dummy225"
        categoriaLabel?.font = UIFont(name: "Helvetica Bold", size: 16)
        categoriaLabel?.textColor = .seaBlue
        view.addSubview(categoriaLabel!)
        
        precioLabel = UILabel(frame: CGRect(x: 190, y: 266, width: 250, height: 100))
        precioLabel?.text = "Dummy@#twitter"
        precioLabel?.font = UIFont(name: "Helvetica Bold", size: 16)
        precioLabel?.textColor = .seaBlue
        view.addSubview(precioLabel!)
        autorLabel3 = UILabel(frame: CGRect(x: 10, y: 460 - 20, width: width - 20, height: 200))
        autorLabel3?.text = "In Case You Missed It."
        autorLabel3?.textColor = .white
        autorLabel3?.numberOfLines = 5
        autorLabel3?.adjustsFontSizeToFitWidth = true
        autorLabel3?.font = UIFont(name: "Arial Bold", size: 30)
        view.addSubview(autorLabel3!)
        
        bottomImageView = UIImageView(frame: CGRect(x: 0, y: 590 - 20, width: width, height: height/4))
        bottomImageView?.image = UIImage(named:"backImage-1")
        bottomImageView?.layer.masksToBounds = true
        bottomImageView?.contentMode = .scaleAspectFill
        bottomImageView?.layer.cornerRadius = 15
        view.addSubview(bottomImageView!)
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
