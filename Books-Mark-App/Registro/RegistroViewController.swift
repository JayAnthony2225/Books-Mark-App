//
//  RegistroViewController.swift
//  Books-Mark-App
//
//  Created by Marco Cruz Velázquez on 1/22/22.
//

import UIKit

class RegistroViewController: UIViewController
{
    var backButton : UIButton?
    var backText : UILabel?
    var backgroundBook : UIImageView?
    var registraInfo : UILabel?
    var pasosLabel : UILabel?
    var registroView : UIView?
    var registrobackg : UIImageView?
    var crearCuenta : UIButton?
    var correoTextField : UITextField?
    var usuarioText : UITextField?
    var pswTextField : UITextField?
    var confirmaPswTextField : UITextField?
    var correoLabel : UILabel?
    var correoLabel1 : UILabel?
    var usuarioLabel : UILabel?
    var pswLabel : UILabel?
    var pswLabel2 : UILabel?
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    var darkBlueTextColor = UIColor(displayP3Red: 27/255, green: 38/255, blue: 44/255, alpha: 1)
    var blueTextColor = UIColor(displayP3Red: 15/255, green: 76/255, blue: 117/255, alpha: 1)
    var lightBTextColor = UIColor(displayP3Red: 50/255, green: 130/255, blue: 184/255, alpha: 1)
    var whiteTextColor = UIColor(displayP3Red: 187/255, green: 225/255, blue: 250/255, alpha: 1)
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = darkBlueTextColor
        
        registraDescription()
        initUI()
       
    }
    
    func initUI()
    {
        
        
        backgroundBook = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height/6))
        backgroundBook?.image = UIImage(named:"backImage5")
        backgroundBook?.layer.masksToBounds = true
        backgroundBook?.contentMode = .scaleAspectFill
        backgroundBook?.layer.cornerRadius = 15
        view.addSubview(backgroundBook!)
        
        backButton = UIButton(frame: CGRect(x: 10, y: 45, width: 20, height: 20))
        backButton?.setImage(UIImage(named: "backButton"), for: .normal)
        backButton?.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        view.addSubview(backButton!)
        
        backText = UILabel(frame: CGRect(x: 37, y: 30, width: 100, height: 50))
        backText?.text = "Regresar"
        backText?.textColor = .white
        backText?.font = UIFont(name: "Helvetica Bold", size: 20)
        view.addSubview(backText!)
        
        pasosLabel =  UILabel(frame: CGRect(x: 20, y: 95, width: 330, height: 40))
        pasosLabel?.backgroundColor = .clear
        pasosLabel?.text = "Estas a unos cuantos pasos de vivir la mejor experiencia"
        pasosLabel?.numberOfLines = 0
        pasosLabel?.adjustsFontSizeToFitWidth = true
        pasosLabel?.font = UIFont(name: "Arial Bold", size: 14)
        pasosLabel?.textColor = .white
        view.addSubview(pasosLabel!)
        
        crearCuenta = UIButton(frame: CGRect(x: 60, y: 715, width: width - 120, height: 40))
        crearCuenta?.backgroundColor = darkBlueTextColor
        crearCuenta?.layer.cornerRadius = 15
        crearCuenta?.setTitle("CREAR CUENTA", for: .normal)
        crearCuenta?.layer.borderColor = UIColor.white.cgColor
        crearCuenta?.layer.borderWidth = 1
        crearCuenta?.addTarget(self, action: #selector(goToBooks), for: .touchUpInside)
        view.addSubview(crearCuenta!)
        
        
        
    }

    func registraDescription(){ //180
        registroView = UIView(frame: CGRect(x: 20, y: 180, width: width - 40, height: 450))
        registroView?.backgroundColor = .white
        registroView?.layer.masksToBounds = true
        registroView?.layer.cornerRadius = 10
        view.addSubview(registroView!)
        registrobackg = UIImageView (frame: CGRect(x: 0, y: 0, width: width , height: height))
        registrobackg?.image = UIImage(named: "registraback")
        registrobackg?.contentMode = .scaleAspectFill
        registroView?.addSubview(registrobackg!)
        
        registraInfo =  UILabel(frame: CGRect(x: 50, y: 15 , width: width, height: 40))
        registraInfo?.backgroundColor = .clear
        registraInfo?.text = "Registra tu información"
        registraInfo?.font = UIFont(name: "Helvetica Bold", size: 22)
        registraInfo?.textColor = blueTextColor
        registroView?.addSubview(registraInfo!)
        
  //MARK: TEXT FIELDS  --------
      
        usuarioText = UITextField(frame: CGRect(x: 40, y: 280, width: width - 80, height: 40))
        usuarioText?.textAlignment = NSTextAlignment.center
        //correoText?.text = ""
        usuarioText?.placeholder = "Markoder   "
        usuarioText?.backgroundColor = .white
        usuarioText?.layer.cornerRadius = 5
        usuarioText?.layer.borderColor = UIColor.white.cgColor
        usuarioText?.layer.borderWidth = 3
        //correoTextField?.keyboardType = .emailAddress
        view.addSubview(usuarioText!)
        
        
        correoTextField = UITextField(frame: CGRect(x: 40, y: 360, width: width - 80, height: 40))
        correoTextField?.textAlignment = NSTextAlignment.center
        correoTextField?.placeholder = "example@mail.com   "
        correoTextField?.backgroundColor = .white
        correoTextField?.layer.cornerRadius = 5
        correoTextField?.layer.borderColor = UIColor.white.cgColor
        correoTextField?.layer.borderWidth = 3
        view.addSubview(correoTextField!)
        
        pswTextField = UITextField(frame: CGRect(x: 40, y: 440, width: width - 80, height: 40))
        pswTextField?.placeholder = "*************** "
        pswTextField?.isSecureTextEntry = true
        pswTextField?.textAlignment = NSTextAlignment.center
        pswTextField?.backgroundColor = .white
        pswTextField?.layer.cornerRadius = 5
        pswTextField?.layer.borderColor = UIColor.white.cgColor
        pswTextField?.layer.borderWidth = 3
        //pswTextField?.keyboardType = .default
        view.addSubview(pswTextField!)
        
        confirmaPswTextField = UITextField(frame: CGRect(x: 40, y: 520, width: width - 80, height: 40))
        confirmaPswTextField?.placeholder = "*************** "
        confirmaPswTextField?.isSecureTextEntry = true
        confirmaPswTextField?.textAlignment = NSTextAlignment.center
        confirmaPswTextField?.backgroundColor = .white
        confirmaPswTextField?.layer.cornerRadius = 5
        confirmaPswTextField?.layer.borderColor = UIColor.white.cgColor
        confirmaPswTextField?.layer.borderWidth = 3
        //pswTextField?.keyboardType = .default
        view.addSubview(confirmaPswTextField!)
        
        //MARK:  LABEL -------
        
        usuarioLabel = UILabel(frame: CGRect(x: 30, y: 80, width: width/2 , height: 15))
        usuarioLabel?.textAlignment = NSTextAlignment.natural
        usuarioLabel?.backgroundColor = .clear
        usuarioLabel?.textColor = lightBTextColor
        usuarioLabel?.font = UIFont(name: "Arial Bold", size: 15)
        usuarioLabel?.layer.cornerRadius = 2
        usuarioLabel?.layer.borderWidth = 0
        usuarioLabel?.text = " Usuario "
        registroView?.addSubview(usuarioLabel!)
        
        correoLabel = UILabel(frame: CGRect(x: 30, y: 161, width: width/2 , height: 15))
        correoLabel?.textAlignment = NSTextAlignment.natural
        correoLabel?.backgroundColor = .clear
        correoLabel?.textColor = lightBTextColor
        correoLabel?.font = UIFont(name: "Arial Bold", size: 15)
        correoLabel?.layer.cornerRadius = 2
        correoLabel?.layer.borderWidth = 0
        correoLabel?.text = " Correo"
        registroView?.addSubview(correoLabel!)
        
        pswLabel = UILabel(frame: CGRect(x: 30, y: 239, width: width/2 , height: 15))
        pswLabel?.textAlignment = NSTextAlignment.natural
        pswLabel?.backgroundColor = .clear
        pswLabel?.textColor = lightBTextColor
        pswLabel?.font = UIFont(name: "Arial Bold", size: 15)
        pswLabel?.layer.cornerRadius = 2
        pswLabel?.layer.borderWidth = 0
        pswLabel?.text = " Contraseña "
        registroView?.addSubview(pswLabel!)
        
        pswLabel2 = UILabel(frame: CGRect(x: 30, y: 318, width: width/2 , height: 15))
        pswLabel2?.textAlignment = NSTextAlignment.natural
        pswLabel2?.backgroundColor = .clear
        pswLabel2?.textColor = lightBTextColor
        pswLabel2?.font = UIFont(name: "Arial Bold", size: 15)
        pswLabel2?.layer.cornerRadius = 2
        pswLabel2?.layer.borderWidth = 0
        pswLabel2?.text = " Confirmar contraseña "
        registroView?.addSubview(pswLabel2!)
        
//pswLabel
        //usuarioLabel
        
    }
    
    @objc func backAction()
    {
        print("back action")
        dismiss(animated:true )
    }

   @objc func goToBooks(){
       
       var usuarioVar = ""
       var usuario = ""
       var correo = ""
       var correoVar = ""
       var psw = ""
       var pswVar = ""
       var pswCheck = ""
       var pswCheckVar = ""
       var alertText = ""
       
       if usuarioText?.text != ""{
           usuario = usuarioText?.text ?? ""
           usuarioVar = String(usuario)
           print("usuario ok , es: \(usuarioVar))")
           
           correo = correoTextField?.text ?? ""
           correoVar = String(correo)
           if isValidEmail(correoVar){
               print("correo ok es : \(correoVar)")
               
               psw = pswTextField?.text ?? ""
               pswVar = String(psw)
               
               pswCheck = confirmaPswTextField?.text ?? ""
               pswCheckVar = String(pswCheck)
               
               if pswVar == pswCheckVar && pswVar != "" && pswCheckVar != ""{
                   
                   print("Psw OK!, Pase Ud. buen hombre, password: \(pswVar) ")
                   
                   let libreriaOption = LibreriaViewController()
                   libreriaOption.modalPresentationStyle = .fullScreen
                   present(libreriaOption, animated: true,completion:
                        {
                        print("Presentando View de Registro")
                        })
                   
               }else{
                   print("Error en el psw , no coinciden")
                   alertText = "Error en contraseña, verifique "
                   let alert = UIAlertController(title: "Error de datos", message: alertText, preferredStyle: .alert)
                   alert.addAction(UIAlertAction(title: "Intentar de nuevo 😊", style: .default, handler: nil))
                   self.present(alert,animated: true,completion: nil)
               }
               
           }else{
               print("Error en mail")
               alertText = "Error en email, ingrese nuevamente "
               let alert = UIAlertController(title: "Error de datos", message: alertText, preferredStyle: .alert)
               alert.addAction(UIAlertAction(title: "Intentar de nuevo 😊 ", style: .default, handler: nil))
               self.present(alert,animated: true,completion: nil)
           }
           
       }else{
           print("Error en Usuario")
           alertText = "Ya empezamos mal? Ingrese un usuario"
           let alert = UIAlertController(title: "Error de datos", message: alertText, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: " Ok entendido. 😊 ", style: .default, handler: nil))
           self.present(alert,animated: true,completion: nil)
       }
       
     
       
}
    
    
    
    
    
    
    
    
     func isValidEmail(_ email: String) -> Bool
         {
         let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

         let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
         return emailPred.evaluate(with: email)
         }
     
    
    
    
    
}
