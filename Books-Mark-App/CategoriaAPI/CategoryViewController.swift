//
//  CategoryViewController.swift
//  Books-Mark-App
//
//  Created by Marco Cruz Velázquez on 2/5/22.
//

import Foundation


import UIKit

class planetasViewController: UIViewController, UITextFieldDelegate, BookManagerDelegate {
    var ingresaCat : UILabel?
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var SearchTextField: UITextField!
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
    var backButton : UIButton?
    var backText :  UILabel?
    var topImageView : UIImageView?
    var backImage :UIImageView?
    var bookManager = BooksCateManager()
    var darkBlueTextColor = UIColor(displayP3Red: 27/255, green: 38/255, blue: 44/255, alpha: 1)
    var blueTextColor = UIColor(displayP3Red: 15/255, green: 76/255, blue: 117/255, alpha: 1)
    var lightBTextColor = UIColor(displayP3Red: 50/255, green: 130/255, blue: 184/255, alpha: 1)
    var whiteTextColor = UIColor(displayP3Red: 187/255, green: 225/255, blue: 250/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    //OL7294929A
    view.backgroundColor = darkBlueTextColor
    initUI()
        
    bookManager.delegate = self
    SearchTextField.delegate = self


}
    func initUI(){
        topImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height/6))
        topImageView?.image = UIImage(named:"backImage5")
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
        
        
        ingresaCat = UILabel(frame: CGRect(x: 5, y: 80, width: width - 20 , height: 40))
        ingresaCat?.textAlignment = NSTextAlignment.center
        ingresaCat?.backgroundColor = .clear
        ingresaCat?.textColor = .white
        ingresaCat?.font = UIFont(name: "Arial Bold", size: 22)
        //bienvenidoLabel?.layer.cornerRadius = 10
        //bienvenidoLabel?.layer.borderColor = UIColor.black.cgColor
        //bienvenidoLabel?.layer.borderWidth = 3
        ingresaCat?.text = " Enter a Category :  "
        view.addSubview(ingresaCat!)
    
        SearchTextField = UITextField(frame: CGRect(x: 40, y: 120, width: width - 80 , height: 40))
        SearchTextField?.placeholder = "Ej. fiction, german, love, english "
        SearchTextField?.textAlignment = .center
        SearchTextField?.backgroundColor = .white
        SearchTextField?.layer.cornerRadius = 7
        SearchTextField?.layer.borderColor = UIColor.black.cgColor
        SearchTextField?.layer.borderWidth = 1
        view.addSubview(SearchTextField!)
        
        //MARK: Populares Label and View                                                        // 16
        topBackground = UIImageView (frame: CGRect(x: 10, y: 180, width: width - 20, height: height/20))
        topBackground?.backgroundColor = darkBlueTextColor
        //topBackground?.image = UIImage(named: "backImage2")//aqui le asigno la imagen segun sea el nombre en assets
        topBackground?.contentMode = .scaleAspectFill // para hacer que encaje la imagen en el image box
        topBackground?.layer.masksToBounds = true // esto es para los bordes y que se ajuste la imagen
        topBackground?.layer.cornerRadius = 10
        view.addSubview(topBackground!)
                
       // top5 =  UILabel(frame: CGRect(x: 20, y: 170, width: width - 40, height: 40))
       // top5?.backgroundColor = .clear
       // top5?.text = "Top 5:"
       // top5?.font = UIFont(name: "Helvetica Bold", size: 25)
       // top5?.textColor = blueTextColor
        //view.addSubview(top5!)
        
        date = UILabel(frame: CGRect(x: 30, y: 180, width: 250 , height: 40))
        date?.textAlignment = NSTextAlignment.left
        date?.backgroundColor = .clear
        date?.textColor = darkBlueTextColor
        date?.font = UIFont(name: "Arial Bold", size: 20)
        date?.text = ""
        view.addSubview(date!)
        
        title1 = UILabel(frame: CGRect(x: 30, y: 280, width: 200  , height: 60))
        title1?.textAlignment = NSTextAlignment.center
        title1?.backgroundColor = .clear
        title1?.textColor = .black
        title1?.numberOfLines = 0
        title1?.font = UIFont(name: "Arial Bold", size: 16)
        title1?.text = ""
        view.addSubview(title1!)
        
        title2 = UILabel(frame: CGRect(x: 30, y: 320, width: 200 , height: 60))
        title2?.textAlignment = NSTextAlignment.center
        title2?.backgroundColor = .clear
        title2?.textColor = .black
        title2?.numberOfLines = 0
        title2?.font = UIFont(name: "Arial Bold", size: 16)
        title2?.text = ""
        view.addSubview(title2!)
        
        title3 = UILabel(frame: CGRect(x: 30, y: 360, width: 200 , height: 60))
        title3?.textAlignment = NSTextAlignment.center
        title3?.backgroundColor = .clear
        title3?.textColor = .black
        title3?.numberOfLines = 0
        title3?.font = UIFont(name: "Arial Bold", size: 16)
        title3?.text = ""
        view.addSubview(title3!)
        
        title4 = UILabel(frame: CGRect(x: 30, y: 400, width: 200  , height: 60))
        title4?.textAlignment = NSTextAlignment.center
        title4?.backgroundColor = .clear
        title4?.textColor = .black
        title4?.numberOfLines = 0
        title4?.font = UIFont(name: "Arial Bold", size: 16)
        title4?.text = ""
        view.addSubview(title4!)
        
        
        title5 = UILabel(frame: CGRect(x: 30, y: 440, width: 200  , height: 60))
        title5?.textAlignment = NSTextAlignment.center
        title5?.backgroundColor = .clear
        title5?.textColor = .black
        title5?.numberOfLines = 0
        title5?.font = UIFont(name: "Arial Bold", size: 16)
        title5?.text = ""
        view.addSubview(title5!)
        
        title6 = UILabel(frame: CGRect(x: 30, y: 480, width: 200  , height: 60))
        title6?.textAlignment = NSTextAlignment.center
        title6?.backgroundColor = .clear
        title6?.textColor = .black
        title6?.numberOfLines = 0
        title6?.font = UIFont(name: "Arial Bold", size: 16)
        title6?.text = ""
        view.addSubview(title6!)
        title7 = UILabel(frame: CGRect(x: 30, y: 520, width: 200  , height: 60))
        title7?.textAlignment = NSTextAlignment.center
        title7?.backgroundColor = .clear
        title7?.textColor = .black
        title7?.numberOfLines = 0
        title7?.font = UIFont(name: "Arial Bold", size: 16)
        title7?.text = ""
        view.addSubview(title7!)
        title8 = UILabel(frame: CGRect(x: 30, y: 560, width: 200  , height: 60))
        title8?.textAlignment = NSTextAlignment.center
        title8?.backgroundColor = .clear
        title8?.textColor = .black
        title8?.numberOfLines = 0
        title8?.font = UIFont(name: "Arial Bold", size: 16)
        title8?.text = ""
        view.addSubview(title8!)
        title9 = UILabel(frame: CGRect(x: 30, y: 600, width: 200  , height: 60))
        title9?.textAlignment = NSTextAlignment.center
        title9?.backgroundColor = .clear
        title9?.textColor = .black
        title9?.numberOfLines = 0
        title9?.font = UIFont(name: "Arial Bold", size: 16)
        title9?.text = ""
        view.addSubview(title9!)
        title10 = UILabel(frame: CGRect(x: 30, y: 640, width: 200  , height: 60))
        title10?.textAlignment = NSTextAlignment.center
        title10?.backgroundColor = .clear
        title10?.textColor = .black
        title10?.numberOfLines = 0
        title10?.font = UIFont(name: "Arial Bold", size: 16)
        title10?.text = ""
        view.addSubview(title10!)
        
        
        image1 = UIImageView (frame: CGRect(x: 0, y: 190, width: width , height: height/2))
        //image1?.image = UIImage(named: "")
        image1?.contentMode = .scaleAspectFit
       // view.addSubview(image1!)
        
        
        backButton = UIButton(frame: CGRect(x: 10, y: 45, width: 20, height: 20))
        backButton?.setImage(UIImage(named: "backButton"), for: .normal)
        backButton?.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        view.addSubview(backButton!)
        
        backText = UILabel(frame: CGRect(x: 37, y: 30, width: 100, height: 50))
        backText?.text = "Regresar"
        backText?.textColor = .white
        backText?.font = UIFont(name: "Helvetica Bold", size: 20)
       // view.addSubview(backText!)
                
}
 
    // funcion para quitar el teclado al finalizar la escritura 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) }
    
    //MARK: Funcion para regresar del view Categorias
    @objc func backAction(){
    print("back action")
    dismiss(animated:true )}
    
    @IBAction func SearchPressed(_ sender: UIButton) {
        SearchTextField.endEditing(true)
        print(SearchTextField.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        SearchTextField.endEditing(true)
        print(SearchTextField.text!)
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let cate = SearchTextField.text {
            bookManager.fetchBook(categoria: cate)
        }
        SearchTextField.text = ""
    }
    
    
    //actulizamos la informacion obtenida de nuestra Api
    func didUpdatePhotoDay(_ BooksManager: BooksCateManager,photoDay: BookCategoryModel) {
        
        DispatchQueue.main.async {
            
            self.date?.text = ("Best \(photoDay.name) title list:")
            self.title1?.text = ("Titulo: \(photoDay.title1)")
            self.title2?.text = ("Titulo: \(photoDay.title2)")
            self.title3?.text = ("Titulo: \(photoDay.title3)")
            self.title4?.text = ("Titulo: \(photoDay.title4)")
            self.title5?.text = ("Titulo: \(photoDay.title5)")
            self.title6?.text = ("Titulo: \(photoDay.title6)")
            self.title7?.text = ("Titulo: \(photoDay.title7)")
            self.title8?.text = ("Titulo: \(photoDay.title8)")
            self.title9?.text = ("Titulo: \(photoDay.title9)")
            self.title10?.text = ("Titulo: \(photoDay.title10)")
            
            self.backImage?.image = UIImage(named:"backImage4")
            self.topBackground?.image = UIImage(named: "backImage2")
            
            //self.image?.image = photoDay.url
            //self.image1?.image = UIImage(named: photoDay.url)
            
    //        let url = URL(string: photoDay.url)
    //          if let data = try? Data(contentsOf: url!) {
     //             self.image1?.image = UIImage(data: data)!

            
        }
    }
    //}
    
}

