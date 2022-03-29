//
//  AutorController.swift
//  Books-Mark-App
//
//  Created by Marco Cruz Velázquez on 2/6/22.
//
import Foundation
import Alamofire


import UIKit

class AutorController: UIViewController, UITextFieldDelegate, BookManagerDelegate2 {
    
    var ingresaCat : UILabel?
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var SearchTextField: UITextField!
    var SearchTextField2: UITextField!
    var date : UILabel?
    var top5 : UILabel?
    var topBackground : UIImageView?
    var image1 : UIImageView?
    var title1 : UILabel?
    var title2 : UILabel?
    var title3 : UILabel?
    var title4 : UILabel?
    var title5 : UILabel?
    var title6 : UILabel?
    var title7 : UILabel?
    var title8 : UILabel?
    var title9 : UILabel?
    var title10 : UILabel?
    var infoRequested : UILabel?
    
    var backButton : UIButton?
    var backText :  UILabel?
    var topImageView : UIImageView?
    var backImage :UIImageView?
    var autorImage :UIImageView?
    
    var bookManager2 = BooksCateManager2()
    
    var darkBlueTextColor = UIColor(displayP3Red: 27/255, green: 38/255, blue: 44/255, alpha: 1)
    var blueTextColor = UIColor(displayP3Red: 15/255, green: 76/255, blue: 117/255, alpha: 1)
    var lightBTextColor = UIColor(displayP3Red: 50/255, green: 130/255, blue: 184/255, alpha: 1)
    var whiteTextColor = UIColor(displayP3Red: 187/255, green: 225/255, blue: 250/255, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()

        
    view.backgroundColor = darkBlueTextColor
    initUI()
    bookManager2.delegate = self
    SearchTextField.delegate = self

}
    func initUI(){
        topImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height/6))
        topImageView?.image = UIImage(named:"backImage6")
        topImageView?.layer.masksToBounds = true
        topImageView?.contentMode = .scaleAspectFill
        topImageView?.layer.cornerRadius = 15
        view.addSubview(topImageView!)
        
        //--------------- Book Text background---------------
        backImage = UIImageView(frame: CGRect(x: 10, y: 250, width: width - 20, height: height - 380))
        //backImage?.image = UIImage(named:"backImage4")
        backImage?.layer.masksToBounds = true
        backImage?.contentMode = .scaleAspectFill
        backImage?.layer.cornerRadius = 15
        view.addSubview(backImage!)
        
        
        //---------------Foto de Autor , la asignacion se da despues de obtener los datos del API---------------
        autorImage = UIImageView(frame: CGRect(x: 150, y: 340, width: 100, height: 130))
        //backImage?.image = UIImage(named:"backImage4")
        autorImage?.layer.masksToBounds = true
        autorImage?.contentMode = .scaleAspectFill
        autorImage?.layer.cornerRadius = 10
        view.addSubview(autorImage!)
        
        
        ingresaCat = UILabel(frame: CGRect(x: 5, y: 80, width: width - 20 , height: 40))
        ingresaCat?.textAlignment = NSTextAlignment.left
        ingresaCat?.backgroundColor = .clear
        ingresaCat?.textColor = .white
        ingresaCat?.font = UIFont(name: "Arial Bold", size: 22)
        ingresaCat?.text = "Enter Author's ID:  "
        view.addSubview(ingresaCat!)
    
        SearchTextField = UITextField(frame: CGRect(x: 40, y: 120, width: width - 80 , height: 40))
        SearchTextField?.placeholder = "Ej. J.K. Rowling:OL23919A,OL31727A "
        SearchTextField?.textAlignment = .center
        SearchTextField?.backgroundColor = .white
        SearchTextField?.layer.cornerRadius = 7
        SearchTextField?.layer.borderColor = UIColor.black.cgColor
        SearchTextField?.layer.borderWidth = 1
        view.addSubview(SearchTextField!)
        
        //MARK: Populares Label and View                                                        // 16
        topBackground = UIImageView (frame: CGRect(x: 10, y: 180, width: width - 20, height: height/20))
        topBackground?.backgroundColor = .clear
        //topBackground?.image = UIImage(named: "backImage2")//aqui le asigno la imagen segun sea el nombre en assets
        topBackground?.contentMode = .scaleAspectFill // para hacer que encaje la imagen en el image box
        topBackground?.layer.masksToBounds = true // esto es para los bordes y que se ajuste la imagen
        topBackground?.layer.cornerRadius = 10
        view.addSubview(topBackground!)
                
        infoRequested =  UILabel(frame: CGRect(x: 20, y: 180, width: width - 40, height: 40))
        infoRequested?.backgroundColor = .clear
        infoRequested?.font = UIFont(name: "Helvetica Bold", size: 20)
        infoRequested?.textColor = blueTextColor
        view.addSubview(infoRequested!)
     
        
        title1 = UILabel(frame: CGRect(x: 35, y: 250, width: 300  , height: 60))
        title1?.textAlignment = NSTextAlignment.center
        title1?.backgroundColor = .clear
        title1?.textColor = .black
        title1?.numberOfLines = 0
        title1?.font = UIFont(name: "Arial Bold", size: 16)
        title1?.text = ""
        view.addSubview(title1!)
        
        title2 = UILabel(frame: CGRect(x: 35, y: 285, width: 300 , height: 60))
        title2?.textAlignment = NSTextAlignment.center
        title2?.backgroundColor = .clear
        title2?.textColor = .black
        title2?.numberOfLines = 0
        title2?.font = UIFont(name: "Arial Bold", size: 16)
        title2?.text = ""
        view.addSubview(title2!)
        
        title3 = UILabel(frame: CGRect(x: 30, y: 660, width: 300 , height: 60))
        title3?.textAlignment = NSTextAlignment.center
        title3?.backgroundColor = .clear
        title3?.textColor = darkBlueTextColor
        title3?.numberOfLines = 0
        title3?.font = UIFont(name: "Arial Bold", size: 16)
        title3?.text = ""
        view.addSubview(title3!)
        
        title4 = UILabel(frame: CGRect(x: 30, y: 470, width: 350  , height: 200))
        title4?.textAlignment = NSTextAlignment.left
        title4?.backgroundColor = .clear
        title4?.textColor = darkBlueTextColor
        title4?.numberOfLines = 0
        title4?.font = UIFont(name: "Arial Bold", size: 15)
        title4?.text = ""
        view.addSubview(title4!)
        
        title5 = UILabel(frame: CGRect(x: 30, y: 635, width: 350  , height: 60))
        title5?.textAlignment = NSTextAlignment.left
        title5?.backgroundColor = .clear
        title5?.textColor = lightBTextColor
        title5?.numberOfLines = 0
        title5?.font = UIFont(name: "Arial Bold", size: 13)
        title5?.text = ""
        view.addSubview(title5!)
        
        image1 = UIImageView (frame: CGRect(x: 0, y: 190, width: width , height: height/2))
        //image1?.image = UIImage(named: "")
        image1?.contentMode = .scaleAspectFit
       // view.addSubview(image1!)
        
        
        backButton = UIButton(frame: CGRect(x: 10, y: 45, width: 20, height: 20))
        backButton?.setImage(UIImage(named: "backButton"), for: .normal)
        backButton?.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        view.addSubview(backButton!)
        
        backText = UILabel(frame: CGRect(x: 37, y: 30, width: 100, height: 50))
        backText?.text = ""
        backText?.textColor = .white
        backText?.font = UIFont(name: "Helvetica Bold", size: 20)
        view.addSubview(backText!)
        
        SearchTextField2 = UITextField(frame: CGRect(x: 40, y: 700, width: width - 80 , height: 40))
        SearchTextField2?.placeholder = "buscar obras, ingrese ID Autor "
        SearchTextField2?.textAlignment = .center
        SearchTextField2?.backgroundColor = .white
        SearchTextField2?.layer.cornerRadius = 7
        SearchTextField2?.layer.borderColor = UIColor.black.cgColor
        SearchTextField2?.layer.borderWidth = 1
       // view.addSubview(SearchTextField2!)
                
}
    
    // funcion para quitar el teclado al finalizar la escritura
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) }
    
    //MARK: Funcion para regresar del view Categorias
    @objc func backAction(){
    print("back action")
    dismiss(animated:true )}
    
    
    //MARK: Funcion para obtener Texto ingresado en textField
    @IBAction func SearchPressed(_ sender: UIButton) {
        SearchTextField.endEditing(true)
        print(SearchTextField.text!)}
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        SearchTextField.endEditing(true)
        print(SearchTextField.text!)
        return true}
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let cate = SearchTextField.text {
            bookManager2.fetchBook2(idAutor: cate)
        }
        SearchTextField.text = ""}
    
    //actulizamos la informacion obtenida de nuestra Api
    func didUpdatePhotoDay2(_ BooksManager: BooksCateManager2,photoDay: BookCategoryModel2) {
        
        DispatchQueue.main.async {
            
            self.title1?.text = ("Autor : \(photoDay.textPersonal_name)")
            self.title2?.text = ("Birthday : \(photoDay.textBirth_date)")
            self.title3?.text = ("  Autor ID : \(photoDay.textKey)")
            self.title4?.text = ("Biography : \(photoDay.textBio)")
            self.title5?.text = ("Wiki : \(photoDay.textWikipedia)")
            
            self.infoRequested?.text = "Requested author : "
            self.autorImage?.image = UIImage(named:"autorImage")
            self.backImage?.image = UIImage(named:"backImage8")
            self.topBackground?.image = UIImage(named: "backImage2")
                       
          //  self.view.addSubview(self.SearchTextField2!)
        }
    }
}

