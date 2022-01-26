//
//  ViewController.swift
//  Books-Mark-App
//
//  Created by Marco Cruz Velázquez on 1/21/22.
//
import UIKit
class ViewController: UIViewController {

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
    
    var whiteTextColor = UIColor(displayP3Red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
    var lightBTextColor = UIColor(displayP3Red: 199/255, green: 238/255, blue: 255/255, alpha: 1)
    var blueTextColor = UIColor(displayP3Red: 0/255, green: 119/255, blue: 192/255, alpha: 1)
    var darkBlueTextColor = UIColor(displayP3Red: 29/255, green: 36/255, blue: 43/255, alpha: 1)
    var grisTextColor = UIColor(displayP3Red: 57/255, green: 62/255, blue: 70/255, alpha: 1)
    
    
    var libreriaOption : LibreriaViewController?
    var registroOption : RegistroViewController?
    
    
    
    
    
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = darkBlueTextColor

        initUI()
                                }
   
  
    func initUI(){
        
        //--------------- book background ---------------
        backImage = UIImageView(frame: CGRect(x: 10, y: 50, width: width - 20, height: height/3))
        backImage?.image = UIImage(named:"backImage3")
        backImage?.layer.masksToBounds = true
        backImage?.contentMode = .scaleAspectFill
        backImage?.layer.cornerRadius = 15
        view.addSubview(backImage!)
        
        //--------------- icon image ---------------
        backImage2 = UIImageView(frame: CGRect(x: 160, y: 350, width: 80, height: 80))
        backImage2?.image = UIImage(named:"bookIcon")
        backImage2?.layer.masksToBounds = true
        backImage2?.contentMode = .scaleAspectFill
        backImage2?.layer.cornerRadius = 15
        view.addSubview(backImage2!)
        
        //--------------- be smarter Text ---------------
        readText = UILabel(frame: CGRect(x: 190, y: 90, width: width/2, height: height/4))
        readText?.textColor = whiteTextColor
        readText?.backgroundColor = .clear
        readText?.text = "Expand your mind. \nRead."
        readText?.textAlignment = .left
        readText?.font = UIFont(name: "Helvetica Bold", size: 32)
        readText?.adjustsFontSizeToFitWidth = true
        readText?.numberOfLines = 0
        view.addSubview(readText!)
        
        //--------------- Bienvenido Label---------------
        bienvenidoLabel = UILabel(frame: CGRect(x: 70, y: 440, width: width - 150 , height: 40))
        bienvenidoLabel?.textAlignment = NSTextAlignment.center
        bienvenidoLabel?.backgroundColor = .clear
        bienvenidoLabel?.textColor = lightBTextColor
        bienvenidoLabel?.font = UIFont(name: "Arial Bold", size: 28)
        //bienvenidoLabel?.layer.cornerRadius = 10
        //bienvenidoLabel?.layer.borderColor = UIColor.black.cgColor
        //bienvenidoLabel?.layer.borderWidth = 3
        bienvenidoLabel?.text = " ¡Bienvenido! "
        view.addSubview(bienvenidoLabel!)
        
        //--------------- Correo TXT FIELD---------------
        correoTextField = UITextField(frame: CGRect(x: 20, y: 530, width: width - 40, height: 40))
        correoTextField?.textAlignment = NSTextAlignment.center
        //correoTextField?.text = ""
        correoTextField?.placeholder = "example@mail.com   "
        correoTextField?.backgroundColor = .white
        correoTextField?.layer.cornerRadius = 5
        correoTextField?.layer.borderColor = UIColor.white.cgColor
        correoTextField?.layer.borderWidth = 3
        //correoTextField?.keyboardType = .emailAddress
        view.addSubview(correoTextField!)
        
                                        //---------------Encabezado Correo ---------------
        correoLabel = UILabel(frame: CGRect(x: 25, y: 510, width: width/6 , height: 15))
        correoLabel?.textAlignment = NSTextAlignment.center
        correoLabel?.backgroundColor = darkBlueTextColor
        correoLabel?.textColor = lightBTextColor
        correoLabel?.font = UIFont(name: "Arial Bold", size: 15)
        correoLabel?.layer.cornerRadius = 2
       // correoLabel?.layer.borderColor = UIColor.white.cgColor
        correoLabel?.layer.borderWidth = 0
        correoLabel?.text = "Correo "
        view.addSubview(correoLabel!)
      //---------------Encabezado password ---------------

        pswLabel = UILabel(frame: CGRect(x: 25, y: 580, width: width/5 , height: 15))
        pswLabel?.textAlignment = NSTextAlignment.center
        pswLabel?.backgroundColor = darkBlueTextColor
        pswLabel?.textColor = lightBTextColor
        pswLabel?.font = UIFont(name: "Arial Bold", size: 15)
        pswLabel?.layer.cornerRadius = 2
       // correoLabel?.layer.borderColor = UIColor.white.cgColor
        pswLabel?.layer.borderWidth = 0
        pswLabel?.text = "Password "
        view.addSubview(pswLabel!)

        //--------------- Password ---------------
        pswTextField = UITextField(frame: CGRect(x: 20, y: 600, width: width - 40, height: 40))
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
        iniciarSesion = UIButton(frame: CGRect(x: 60, y: 700, width: width - 120, height: 40))
        iniciarSesion?.backgroundColor = darkBlueTextColor
        iniciarSesion?.layer.cornerRadius = 15
        iniciarSesion?.setTitle("INICIAR SESIÓN", for: .normal)
        iniciarSesion?.layer.borderColor = UIColor.white.cgColor
        iniciarSesion?.layer.borderWidth = 1
        iniciarSesion?.addTarget(self, action: #selector(goToBooks), for: .touchUpInside)
        view.addSubview(iniciarSesion!)

        //--------------- Registrate    ---------------
        registrateButton = UIButton(frame: CGRect(x: 60, y: 750, width: width - 120, height: 40))
        registrateButton?.backgroundColor = .clear
        registrateButton?.layer.cornerRadius = 15
        registrateButton?.setTitle("Aun sin cuenta? Registrate aqui! ", for: .normal)
        registrateButton?.addTarget(self, action: #selector(goToRegistro), for: .touchUpInside)
       // registrateButton?.layer.backgroundColor = UIColor.systemBlue.cgColor
        view.addSubview(registrateButton!)
        
    }
 
   

//MARK: Objeto- Funcion -  BOOKS
    @objc func goToBooks()
            {
                
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


    
//MARK: Objeto- Funcion - Registro
        @objc func goToRegistro()
        {
            print("Boton Registro presionado")
            let registroOption = RegistroViewController()
            registroOption.modalPresentationStyle = .fullScreen
            present(registroOption, animated: true,completion:
                        {
                        print("Presentando View de Registro")
                        }   )
            
        }


   
    func isValidEmail(_ email: String) -> Bool
        {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
        }
    
}
