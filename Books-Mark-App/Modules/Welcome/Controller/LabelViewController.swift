//
//  LabelViewController.swift
//  Books-Mark-App
//
//  Created by Marco Cruz Velázquez on 3/1/22.
//

import UIKit

class LabelViewController: UIViewController {

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
        label.font = UIFont(name: "Helvetica Bold", size: 30)
        self.view.addSubview(label)
        self.view.backgroundColor = .nightBlue
       
        // Do any additional setup after loading the view.
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            ])
    }


}
