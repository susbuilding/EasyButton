//
//  ViewController.swift
//  easy button
//
//  Created by Susanna Huang on 4/22/17.
//  Copyright © 2017 Susanna Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum Method: String {
        case get = "GET"
        case put = "PUT"
    }
    
    private static let APIKey = "gWxP6yCTmYWL0FolPHOtiUvrAm0ktRxdxT76TFdM"
    private static let APIURL = "http://10.3.125.234/api/"
//    get request
//    private static let LightsEndPoint = "lights/"
    private static let LightsEndPoint = "/lights/3/state"
    
    private func getLights() {
        guard let url = URL(string: ViewController.APIURL + ViewController.APIKey + ViewController.LightsEndPoint) else { return }
        
        let session = URLSession.shared
        var request = URLRequest(url: url)
        let jsonData = try? JSONSerialization.data(withJSONObject: ["hue":20000])
//        request.httpMethod = Method.get.rawValue
        request.httpMethod = Method.put.rawValue
        request.httpBody = jsonData
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                print("error was \(error)")
                return
            }
            
            let string = String(data: data, encoding: .utf8) ?? ""
            print(string)
        }
        
        task.resume()
    }
    
    private func turnOnLight() {
        guard let url = URL(string: ViewController.APIURL + ViewController.APIKey + ViewController.LightsEndPoint) else { return }
        
        let session = URLSession.shared
        var request = URLRequest(url: url)
        let jsonData = try? JSONSerialization.data(withJSONObject: ["on":true])
        request.httpMethod = Method.put.rawValue
        request.httpBody = jsonData
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                print("error was \(error)")
                return
            }
            
            let string = String(data: data, encoding: .utf8) ?? ""
            print(string)
        }
        
        task.resume()
    }
    
    @IBOutlet weak var Helloworldlabel: UILabel!

    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Helloworldlabel.text = "Simple Lights"
        button.setTitle("Turn on Light", for: .normal)
    }

    @IBAction func didTapButton(_ sender: Any) {
        print("ya clicked me!")
//        getLights()
        turnOnLight()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

