//
//  ObrasController.swift
//  Books-Mark-App
//
//  Created by Marco Cruz Velázquez on 2/7/22.
//

import Foundation
import UIKit

class obrasViewController: UIViewController, UITextFieldDelegate, BookManagerDelegate3 {
    
    
    var hola : UILabel?
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var SearchTextField: UITextField!
    var date : UILabel?
    var image1 : UIImageView?
    var topImageView : UIImageView?
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
    
    
    var bookManager = BooksCateManager3()

    override func viewDidLoad() {
        super.viewDidLoad()

       
    
    view.backgroundColor = .black
    initUI()
        
    bookManager.delegate = self
    SearchTextField.delegate = self


}
    func initUI(){
        
        topImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height/6))
        topImageView?.image = UIImage(named:"backImage6")
        topImageView?.layer.masksToBounds = true
        topImageView?.contentMode = .scaleAspectFill
        topImageView?.layer.cornerRadius = 15
        view.addSubview(topImageView!)
        
    hola = UILabel(frame: CGRect(x: 10, y: 90, width: width , height: 40))
    hola?.textAlignment = NSTextAlignment.center
    hola?.backgroundColor = .clear
        hola?.textColor = .white
    hola?.font = UIFont(name: "Arial Bold", size: 18)
    //bienvenidoLabel?.layer.cornerRadius = 10
    //bienvenidoLabel?.layer.borderColor = UIColor.black.cgColor
    //bienvenidoLabel?.layer.borderWidth = 3
    hola?.text = " ¡Books by Author's ID ! "
    view.addSubview(hola!)
    
        SearchTextField = UITextField(frame: CGRect(x: 70, y: 125, width: width - 120 , height: 40))
        SearchTextField?.placeholder = "Enter Author's ID"
        SearchTextField?.textAlignment = .center
        SearchTextField?.backgroundColor = .white
        SearchTextField?.layer.cornerRadius = 7
        SearchTextField?.layer.borderColor = UIColor.black.cgColor
        SearchTextField?.layer.borderWidth = 1
        view.addSubview(SearchTextField!)
        
        date = UILabel(frame: CGRect(x: 70, y: 670, width: width - 150 , height: 40))
        date?.textAlignment = NSTextAlignment.center
        date?.backgroundColor = .clear
        date?.textColor = .white
        date?.font = UIFont(name: "Arial Bold", size: 20)
        date?.text = ""
       // view.addSubview(date!)
        
        title1 = UILabel(frame: CGRect(x: 40, y: 200, width: width - 80 , height: 60))
        title1?.textAlignment = NSTextAlignment.center
        title1?.backgroundColor = .clear
        title1?.textColor = .white
        title1?.numberOfLines = 0
        title1?.font = UIFont(name: "Arial Bold", size: 15)
        title1?.text = ""
        view.addSubview(title1!)
        
        title2 = UILabel(frame: CGRect(x: 40, y: 250, width: width - 80 , height: 60))
        title2?.textAlignment = NSTextAlignment.center
        title2?.backgroundColor = .clear
        title2?.textColor = .white
        title2?.numberOfLines = 0
        title2?.font = UIFont(name: "Arial Bold", size: 15)
        title2?.text = ""
        view.addSubview(title2!)
        
        title3 = UILabel(frame: CGRect(x: 40, y: 300, width: width - 80 , height: 60))
        title3?.textAlignment = NSTextAlignment.center
        title3?.backgroundColor = .clear
        title3?.textColor = .white
        title3?.numberOfLines = 0
        title3?.font = UIFont(name: "Arial Bold", size: 15)
        title3?.text = ""
       view.addSubview(title3!)
        
        title4 = UILabel(frame: CGRect(x: 40, y: 350, width: width - 80 , height: 60))
        title4?.textAlignment = NSTextAlignment.center
        title4?.backgroundColor = .clear
        title4?.textColor = .white
        title4?.numberOfLines = 0
        title4?.font = UIFont(name: "Arial Bold", size: 15)
        title4?.text = ""
       view.addSubview(title4!)
        
    
        
        title5 = UILabel(frame: CGRect(x: 40, y: 400, width: width - 80 , height: 60))
        title5?.textAlignment = NSTextAlignment.center
        title5?.backgroundColor = .clear
        title5?.textColor = .white
        title5?.numberOfLines = 0
        title5?.font = UIFont(name: "Arial Bold", size: 15)
        title5?.text = ""
        view.addSubview(title5!)
        
        title6 = UILabel(frame: CGRect(x: 40, y: 450, width: width - 80  , height: 60))
        title6?.textAlignment = NSTextAlignment.center
        title6?.backgroundColor = .clear
        title6?.textColor = .white
        title6?.numberOfLines = 0
        title6?.font = UIFont(name: "Arial Bold", size: 15)
        title6?.text = ""
        view.addSubview(title6!)
        title7 = UILabel(frame: CGRect(x: 40, y: 500, width: width - 80  , height: 60))
        title7?.textAlignment = NSTextAlignment.center
        title7?.backgroundColor = .clear
        title7?.textColor = .white
        title7?.numberOfLines = 0
        title7?.font = UIFont(name: "Arial Bold", size: 15)
        title7?.text = ""
        view.addSubview(title7!)
        title8 = UILabel(frame: CGRect(x: 40, y: 550, width: width - 80 , height: 60))
        title8?.textAlignment = NSTextAlignment.center
        title8?.backgroundColor = .clear
        title8?.textColor = .white
        title8?.numberOfLines = 0
        title8?.font = UIFont(name: "Arial Bold", size: 15)
        title8?.text = ""
        view.addSubview(title8!)
        title9 = UILabel(frame: CGRect(x: 40, y: 600, width: width - 80 , height: 60))
        title9?.textAlignment = NSTextAlignment.center
        title9?.backgroundColor = .clear
        title9?.textColor = .white
        title9?.numberOfLines = 0
        title9?.font = UIFont(name: "Arial Bold", size: 15)
        title9?.text = ""
        view.addSubview(title9!)
        title10 = UILabel(frame: CGRect(x: 40, y: 650, width: width - 80 , height: 60))
        title10?.textAlignment = NSTextAlignment.center
        title10?.backgroundColor = .clear
        title10?.textColor = .white
        title10?.numberOfLines = 0
        title10?.font = UIFont(name: "Arial Bold", size: 15)
        title10?.text = ""
        view.addSubview(title10!)
        
        
        image1 = UIImageView (frame: CGRect(x: 0, y: 190, width: width , height: height/2))
        //image1?.image = UIImage(named: "")
        image1?.contentMode = .scaleAspectFit
       // view.addSubview(image1!)
}
    // funcion para quitar el teclado al finalizar la escritura
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) }
    
    
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
            bookManager.fetchBook(idAutor: cate)
        }
        SearchTextField.text = ""
    }
    
    
    //actulizamos la informacion obtenida de nuestra Api
    func didUpdatePhotoDay(_ BooksManager: BooksCateManager3,photoDay: BookCategoryModel3) {
        
        DispatchQueue.main.async {
            
             //   self.date?.text = photoDay.size
                //self.title1?.text = photoDay.personal_name
            self.title1?.text = photoDay.textTitle
            self.title2?.text = photoDay.textTitle2
            self.title3?.text = photoDay.textTitle3
            self.title4?.text = photoDay.textTitle4
            self.title5?.text = photoDay.textTitle5
            self.title6?.text = photoDay.textTitle6
            self.title7?.text = photoDay.textTitle7
            self.title8?.text = photoDay.textTitle8
            self.title9?.text = photoDay.textTitle9
            self.title10?.text = photoDay.textTitle10
            //self.title2?.text = photoDay.textBirth_date
            //self.title3?.text = photoDay.textKey
           // self.title4?.text = photoDay.textBio
            
            
            
            //self.image?.image = photoDay.url
            //self.image1?.image = UIImage(named: photoDay.url)
            
    //        let url = URL(string: photoDay.url)
    //          if let data = try? Data(contentsOf: url!) {
     //             self.image1?.image = UIImage(data: data)!

            
        }
    }
    //}
    
}

