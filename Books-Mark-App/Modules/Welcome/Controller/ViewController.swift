//
//  ViewController.swift
//  Books-Mark-App
//
//  Created by Marco Cruz Velázquez on 1/21/22.
//
import UIKit

class ViewController: UIViewController{
    var backImage : UIImageView?
    var backImage2 = UIImageView()
    var readText : UILabel?
    var bienvenidoLabel : UILabel? // fistlabel
    var correoLabel : UILabel?
    var correoTextField : UITextField?
    var pswLabel : UILabel?
    var pswTextField : UITextField?
    var iniciarSesion = UIButton()
    var registrateButton = UIButton()
    var showButton : UIButton?
    var userId : UILabel?
    var sinCuenta = UILabel()
    var userIdTextField : UITextField?
   // var defaults = UserDefaults.standard
    
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
        
        view.addSubview(backImage2)
        backImage2.image = UIImage(named:"bookIcon")
        backImage2.layer.masksToBounds = true
        backImage2.contentMode = .scaleAspectFit
        backImage2.layer.cornerRadius = 15
        backImage2.addAnchorsAndSize(width: 80, height: 80, left: Dimensions.grid9_2, top: 80, right: Dimensions.grid9_2, bottom: nil, withAnchor: nil, relativeToView: nil)
        
        //--------------- Bienvenido Label---------------  //440
        bienvenidoLabel = UILabel(frame: CGRect(x: 70, y: 180, width: width - 150 , height: 40))
        bienvenidoLabel?.textAlignment = NSTextAlignment.center
        bienvenidoLabel?.backgroundColor = .clear
        bienvenidoLabel?.textColor = .nightBlue
        bienvenidoLabel?.font = UIFont(name: "Arial Bold", size: 28)
        bienvenidoLabel?.text = " Welcome! "
        view.addSubview(bienvenidoLabel!)
        
        //---------------Encabezado USER ID ------------585---
        userId = UILabel(frame: CGRect(x: 35, y: 285 + 20, width: 150 , height: 15))
        userId?.textAlignment = NSTextAlignment.left
        userId?.backgroundColor = .clear
        userId?.textColor = .nightBlue
        userId?.font = UIFont(name: "Arial Bold", size: 15)
        userId?.layer.cornerRadius = 2
        userId?.layer.borderColor = UIColor.white.cgColor
        userId?.layer.borderWidth = 0
        userId?.text = "User ID"
        view.addSubview(userId!)
        
        userIdTextField = UITextField(frame: CGRect(x: 30, y: 305 + 20, width: width - 60, height: 40))
        userIdTextField?.textAlignment = NSTextAlignment.center
        userIdTextField?.placeholder = "User ID   "
        userIdTextField?.backgroundColor = .white
        userIdTextField?.layer.cornerRadius = 5
        userIdTextField?.layer.borderColor = UIColor.white.cgColor
        userIdTextField?.layer.borderWidth = 3
        view.addSubview(userIdTextField!)
      //---------------Encabezado password ---------650------
        pswLabel = UILabel(frame: CGRect(x: 35, y: 350 + 20, width: width/5 , height: 15))
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
        pswTextField = UITextField(frame: CGRect(x: 30, y: 370 + 20, width: width - 60, height: 40))
        pswTextField?.placeholder = "*************** "
        pswTextField?.isSecureTextEntry = true
        pswTextField?.textAlignment = NSTextAlignment.center
        pswTextField?.backgroundColor = .white
        pswTextField?.layer.cornerRadius = 5
        pswTextField?.layer.borderColor = UIColor.white.cgColor
        pswTextField?.layer.borderWidth = 3
        //pswTextField?.keyboardType = .default
        view.addSubview(pswTextField!)

        showButton = UIButton(frame: CGRect(x: 325, y: 375 + 20 , width: 25, height: 25))
        showButton?.setImage(UIImage(named: "showIcon"), for: .normal)
        showButton?.addTarget(self, action: #selector(showPsw), for: .touchUpInside)
        view.addSubview(showButton!)
        
        view.addSubview(iniciarSesion)
       // iniciarSesion = UIButton(frame: CGRect(x: 85, y: 730, width: width - 170, height: 40))
        iniciarSesion.backgroundColor = .nightBlue
        iniciarSesion.layer.cornerRadius = 15
        iniciarSesion.setTitle("LOG IN", for: .normal)
        iniciarSesion.layer.borderColor = UIColor.skyBlue.cgColor
        iniciarSesion.layer.borderWidth = 1
        iniciarSesion.addTarget(self, action: #selector(goToBooks), for: .touchUpInside)
        iniciarSesion.addAnchorsAndSize(width: nil, height: 40, left: Dimensions.grid8, top: nil, right: Dimensions.grid8, bottom: 100, withAnchor: nil, relativeToView: nil)

        view.addSubview(sinCuenta)
        //sinCuenta = UILabel(frame: CGRect(x: 55, y: 775 , width: width - 120, height: 40))
        sinCuenta.textAlignment = NSTextAlignment.left
        sinCuenta.backgroundColor = .clear
        sinCuenta.textColor = .white
        sinCuenta.font = UIFont(name: "", size: 17)
        sinCuenta.text = "Without An Account Yet?  "
        sinCuenta.addAnchorsAndSize(width: nil, height: 40, left: Dimensions.grid8, top: nil, right: nil, bottom: 50, withAnchor: nil, relativeToView: nil)
            
        view.addSubview(registrateButton)
        registrateButton.backgroundColor = .clear
        registrateButton.layer.cornerRadius = 18
        registrateButton.setTitle("Sign up here! ", for: .normal)
        registrateButton.setTitleColor(.cyan, for: .normal)
        registrateButton.addTarget(self, action: #selector(goToRegistro), for: .touchUpInside)
        registrateButton.addAnchorsAndSize(width: nil, height: 40, left: nil, top: nil, right: Dimensions.grid8, bottom: 50, withAnchor: nil, relativeToView: nil)
    }
    
    @objc func showPsw(){
        pswTextField?.isSecureTextEntry.toggle()
    }
    
    // aqui intento hacer que mi teclado se esconda cuando termino de editar el texto
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) }
    
//MARK:  Funcion -  Go to Books
    
    @objc func goToBooks()
                {
                    // este codigo es para el cambio de color de los botones
                    iniciarSesion.backgroundColor = .cyan//.seaBlue
                    iniciarSesion.alpha = 0.5
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        self.iniciarSesion.alpha = 1.0
                        self.iniciarSesion.backgroundColor = .nightBlue
                    }
                    
    //este codigo es para tener un acceso rapido para probar sin logear a cada rato
               print("Ingresando a libreria View")
 //MARK: TAB BAR Setting
                    
///----------- esta porcion de codigo es solo para hacer pruebas con el userDefaults
                var userSet = ""
                    if let user = userIdTextField?.text{
                        if user != ""{
                            userSet = user
                            print(user)
                           // defaults.set(user, forKey: "User") // Aqui guardamos el string user en Userdefaults
                            UserDefaults.standard.set(userSet, forKey: "User")
                        }
                    //defaults.set(userSet, forKey: "User") // Aqui guardamos el string user en Userdefaults
                       
                    }
////-------------- hasta aqui lo usare para hacer pruebas del user defaults
               let tabBarViewController = UITabBarController()  // Codigo para TAB BAR
                    
                let libreriaOption = LibreriaViewController()
                let searchOption = SearchViewController()
                let profileOption = ProfileViewController()
                    
                    libreriaOption.title = "Home"
                    searchOption.title = "Search"
                    profileOption.title = "User"
                    
                tabBarViewController.setViewControllers([libreriaOption, searchOption, profileOption], animated: true)
                    guard let items = tabBarViewController.tabBar.items else {
                        return
                    }
                    let images = ["house", "magnifyingglass", "person.circle"]
                    for x in 0..<items.count {
                        items[2].badgeValue = "3"
                        items[x].image = UIImage(systemName: images[x])
                    }
                    tabBarViewController.modalPresentationStyle = .fullScreen
                    present(tabBarViewController, animated: true)
                    //libreriaOption.modalPresentationStyle = .fullScreen
                    //present(libreriaOption, animated: true,completion:
                  //  {
                   print("Presentando Tab bar y Views")
                   //})
                    
                    }
    
    ///________
/*
        var correoVar = ""
        var alertText = ""
        var passwordVar = " "
       // var correo = ""
 
 //NOTA: es importante saber que tome la descicion de eliminar el textFiel de correo , ya que
// quiero usar el UserDefaults. stander para ser mostrado en logIn y prefiero que sea USER al Correo electronico , tambien por otra parte si yaexiste un usiario no veo porque debe ingresar su correo , lo delimite para que sea solo al hacer una nueva cuenta, entonces slo valida con ID y psw
 
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
            registrateButton.backgroundColor = .seaBlue
            registrateButton.alpha = 0.5
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.registrateButton.alpha = 1.0
                self.registrateButton.backgroundColor = (.clear)
            }
            print("Boton Registro presionado")
            let registroOption = RegistroViewController()
            registroOption.modalPresentationStyle = .popover
            present(registroOption, animated: true,completion:{
                        print("Presentando View de Registro")
                        })
        }
    func isValidEmail(_ email: String) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
        }
    
  /*  class secondViewController: UIViewController {
        override func viewDidLoad() {
            super.viewDidLoad()
                view.backgroundColor = .red
        }
    }
  
        class thirdViewController: UIViewController {
            override func viewDidLoad() {
                super.viewDidLoad()
                    view.backgroundColor = .nightBlue
            }
        
    }
   */
}
