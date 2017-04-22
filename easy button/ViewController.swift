//
//  ViewController.swift
//  easy button
//
//  Created by Susanna Huang on 4/22/17.
//  Copyright © 2017 Susanna Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Helloworldlabel: UILabel!

    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Helloworldlabel.text = "Goodbye world"
        button.setTitle("Easy button", for: .normal)
    }

    @IBAction func didTapButton(_ sender: Any) {
        print("ya clicked me")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

