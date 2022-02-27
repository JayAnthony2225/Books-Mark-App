//
//  ViewController.swift
//  Books-Mark-App
//
//  Created by Marco Cruz Velázquez on 1/21/22.
//
import UIKit

class ViewController: UIViewController{
    var backImage : UIImageView?
    var backImage2: UIImageView?
    var readText : UILabel?
    var bienvenidoLabel : UILabel? // fistlabel
    //var totalLabel : UILabel?
    var correoLabel : UILabel?
    var correoTextField : UITextField?
    var pswLabel : UILabel?
    var pswTextField : UITextField?
    var iniciarSesion : UIButton?
    var registrateButton : UIButton?
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    var libreriaOption : LibreriaViewController?
    var registroOption : RegistroViewController?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .nightBlue
        initUI()
        }
    func initUI(){
        //--------------- book background -------10--------           width - 20       670 -800
        backImage = UIImageView(frame: CGRect(x: 0, y: 0, width: width , height: height))
        backImage?.image = UIImage(named:"backImage9")
        backImage?.layer.masksToBounds = true
        backImage?.contentMode = .scaleAspectFill
        backImage?.layer.cornerRadius = 15
        view.addSubview(backImage!)
        
        //--------------- icon image ---------------     360
        backImage2 = UIImageView(frame: CGRect(x: 170, y: 90, width: 80, height: 80))
        backImage2?.image = UIImage(named:"bookIcon")
        backImage2?.layer.masksToBounds = true
        backImage2?.contentMode = .scaleAspectFill
        backImage2?.layer.cornerRadius = 15
        view.addSubview(backImage2!)
        
        //--------------- be smarter Text ---------------
        readText = UILabel(frame: CGRect(x: 190, y: 90, width: width/2, height: height/4))
        readText?.textColor = .white
        readText?.backgroundColor = .clear
        readText?.text = "Less face \nmore book."
        readText?.textAlignment = .left
        readText?.font = UIFont(name: "Helvetica Bold", size: 32)
        readText?.adjustsFontSizeToFitWidth = true
        readText?.numberOfLines = 0
        //view.addSubview(readText!)
        
        //--------------- Bienvenido Label---------------  //440
        bienvenidoLabel = UILabel(frame: CGRect(x: 70, y: 180, width: width - 150 , height: 40))
        bienvenidoLabel?.textAlignment = NSTextAlignment.center
        bienvenidoLabel?.backgroundColor = .clear
        bienvenidoLabel?.textColor = .nightBlue
        bienvenidoLabel?.font = UIFont(name: "Arial Bold", size: 28)
        //bienvenidoLabel?.layer.cornerRadius = 10
        //bienvenidoLabel?.layer.borderColor = UIColor.black.cgColor
        //bienvenidoLabel?.layer.borderWidth = 3
        bienvenidoLabel?.text = " ¡Welcome! "
        view.addSubview(bienvenidoLabel!)
        
        //---------------Encabezado Correo ------------585---
        correoLabel = UILabel(frame: CGRect(x: 35, y: 285, width: 50 , height: 15))
        correoLabel?.textAlignment = NSTextAlignment.left
        correoLabel?.backgroundColor = .clear
        correoLabel?.textColor = .nightBlue
        correoLabel?.font = UIFont(name: "Arial Bold", size: 15)
        correoLabel?.layer.cornerRadius = 2
        correoLabel?.layer.borderColor = UIColor.white.cgColor
        correoLabel?.layer.borderWidth = 0
        correoLabel?.text = "E-mail "
        view.addSubview(correoLabel!)
        //--------------- Correo TXT FIELD---------------    605
        correoTextField = UITextField(frame: CGRect(x: 30, y: 305, width: width - 60, height: 40))
        correoTextField?.textAlignment = NSTextAlignment.center
        //correoTextField?.text = ""
        correoTextField?.placeholder = "example@mail.com   "
        correoTextField?.backgroundColor = .white
        correoTextField?.layer.cornerRadius = 5
        correoTextField?.layer.borderColor = UIColor.white.cgColor
        correoTextField?.layer.borderWidth = 3
       // correoTextField?.keyboardType = .emailAddress
       // correoTextField?.endEditing(true)  //endEditing(true)
        view.addSubview(correoTextField!)
        
      //---------------Encabezado password ---------650------
        pswLabel = UILabel(frame: CGRect(x: 35, y: 350, width: width/5 , height: 15))
        pswLabel?.textAlignment = NSTextAlignment.left
        pswLabel?.backgroundColor = .clear
        pswLabel?.textColor = .nightBlue
        pswLabel?.font = UIFont(name: "Arial Bold", size: 15)
        pswLabel?.layer.cornerRadius = 2
        correoLabel?.layer.borderColor = UIColor.white.cgColor
        pswLabel?.layer.borderWidth = 0
        pswLabel?.text = "Password "
        view.addSubview(pswLabel!)
        //--------------- Password ---------------         670
        pswTextField = UITextField(frame: CGRect(x: 30, y: 370, width: width - 60, height: 40))
        //pswTextField?.text = ""
        pswTextField?.placeholder = "*************** "
        pswTextField?.isSecureTextEntry = true
        pswTextField?.textAlignment = NSTextAlignment.center
        pswTextField?.backgroundColor = .white
        pswTextField?.layer.cornerRadius = 5
        pswTextField?.layer.borderColor = UIColor.white.cgColor
        pswTextField?.layer.borderWidth = 3
        //pswTextField?.keyboardType = .default
        view.addSubview(pswTextField!)
        //--------------- Iniciar Sesion ---------------
        iniciarSesion = UIButton(frame: CGRect(x: 85, y: 730, width: width - 170, height: 40))
        iniciarSesion?.backgroundColor = .nightBlue
        iniciarSesion?.layer.cornerRadius = 15
        iniciarSesion?.setTitle("LOG IN", for: .normal)
        iniciarSesion?.layer.borderColor = UIColor.skyBlue.cgColor
        iniciarSesion?.layer.borderWidth = 1
        iniciarSesion?.addTarget(self, action: #selector(goToBooks), for: .touchUpInside)
        view.addSubview(iniciarSesion!)
        //--------------- Registrate    ---------------
        registrateButton = UIButton(frame: CGRect(x: 60, y: 775, width: width - 120, height: 40))
        registrateButton?.backgroundColor = .clear
        registrateButton?.layer.cornerRadius = 15
        //registrateButton?.
        registrateButton?.setTitle("Still no account? Sign up here! ", for: .normal)
        registrateButton?.addTarget(self, action: #selector(goToRegistro), for: .touchUpInside)
        //registrateButton?.layer.borderColor = UIColor.skyBlue.cgColor
        //registrateButton?.layer.backgroundColor = UIColor.systemBlue.cgColor
        view.addSubview(registrateButton!)
    }
    
    // aqui intento hacer que mi teclado se esconda cuando termino de editar el texto
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) }
    
//MARK: Objeto- Funcion -  BOOKS
    @objc func goToBooks()
                {
                    iniciarSesion?.backgroundColor = .seaBlue
                    iniciarSesion?.alpha = 0.5
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        self.iniciarSesion?.alpha = 1.0
                        self.iniciarSesion?.backgroundColor = .nightBlue
                    }
                    
    //este codigo es para tener un acceso rapido para probar sin logear a cada rato
               print("Ingresando a libreria View")
                let libreriaOption = LibreriaViewController()
               libreriaOption.modalPresentationStyle = .fullScreen
               present(libreriaOption, animated: true,completion:
                    {
                   print("Presentando View de libreria")
                   })
                    }
               
   
/*
        var correoVar = ""
        var alertText = ""
        var passwordVar = " "
       // var correo = ""
                
                
                if let correo = correoTextField?.text{
                correoVar = String(correo)
                if isValidEmail(correoVar) == true {
                print("Boton Iniciar Sesion presionado")
                print("este es el correo: \(correoVar)")
                }
                    else{
                        print("Ingresa un correo valido porfavor")
                        alertText = "Ingresar un correo valido alert"}
        }
                if let password = pswTextField?.text{
                passwordVar = String(password)
                    
                        if passwordVar != "" {
                            print("Este es el psw: \(passwordVar)")
                            //if passwordVar != ""{
                            //  print(" psw ok")
                    }
                else{
                print("Este psw es incorrecto")
                alertText = "La informacion es incorrecta"}
        }
            
                if alertText.isEmpty
                    {
                   
                        print("Ingresando a libreria View")
                        let libreriaOption = LibreriaViewController()
                        libreriaOption.modalPresentationStyle = .fullScreen
                        present(libreriaOption, animated: true,completion:
                            {
                            print("Presentando View de libreria")
                           
                            })
                    }
                else
                    {
                    let alert = UIAlertController(title: "Error de datos", message: alertText, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK entendido. ", style: .default, handler: nil))
                    self.present(alert,animated: true,completion: nil)
                    }

        }
 */

    
//MARK: Objeto- Funcion - Registro
        @objc func goToRegistro(){
           //Esta funcion cambia el alpha del color y va al principio para que haga el efecto de cambiar al precionar
            registrateButton?.backgroundColor = .seaBlue
            registrateButton?.alpha = 0.5
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.registrateButton?.alpha = 1.0
                self.registrateButton?.backgroundColor = (.clear)
            }
            
            print("Boton Registro presionado")
            let registroOption = RegistroViewController()
            registroOption.modalPresentationStyle = .fullScreen
            present(registroOption, animated: true,completion:{
                        print("Presentando View de Registro")
                        })
        }

    func isValidEmail(_ email: String) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
        }
}