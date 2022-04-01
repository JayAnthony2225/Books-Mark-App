//
//  LabelViewController.swift
//  Books-Mark-App
//
//  Created by Marco Cruz Velázquez on 3/1/22.
//

import UIKit

class LabelViewController: UIViewController {
    var powered : UILabel?
    var kodemia : UIImageView?
    var backBase : UIImageView?
    var text: String = "ViewController" {
        didSet {
            guard let label = self.view.subviews.first as? UILabel else {
                return
            }
            label.text = text
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "Helvetica Bold", size: 26)
        self.view.addSubview(label)
        self.view.backgroundColor = .nightBlue
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            ])
        initUI()
    }

    func initUI(){
        powered = UILabel(frame: CGRect(x: 70, y: 750, width: width - 150 , height: 40))
        powered?.textAlignment = NSTextAlignment.center
        powered?.backgroundColor = .clear
        powered?.textColor = .white
        powered?.font = UIFont(name: "Arial Bold", size: 14)
        powered?.text = "Powered by "
        view.addSubview(powered!)
    
        kodemia = UIImageView(frame: CGRect(x: 160 + 100, y: 789 - 30, width: 32, height: 32))
        kodemia?.image = UIImage(named:"k2")
        kodemia?.layer.masksToBounds = true
        kodemia?.contentMode = .scaleAspectFill
        kodemia?.layer.cornerRadius = 15
        view.addSubview(kodemia!)
        
        backBase = UIImageView(frame: CGRect(x: 210 + 100, y: 790 - 30, width: 30, height: 30))
        backBase?.image = UIImage(named:"bb2")
        backBase?.layer.masksToBounds = true
        backBase?.contentMode = .scaleAspectFill
        backBase?.layer.cornerRadius = 15
        view.addSubview(backBase!)
    
    }
    
    
}
