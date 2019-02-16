//
//  ViewController.swift
//  MDB Mini Project 1
//
//  Created by Anita Shen on 2/7/19.
//  Copyright © 2019 Anita Shen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var welcomeText : UILabel!
    var instruction : UILabel!
    var welcomeImage : UIImageView!
    var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setup()
    }
    
    func setup(){
        welcomeImage  =  UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        //welcomeImage.center = CGPoint(x: view.frame.width, y: view.frame.height)
        welcomeImage.image = UIImage(named: "background")
        //welcomeImage.contentMode = .scaleAspectFit
        view.addSubview(welcomeImage)
        
        welcomeText = UILabel(frame: CGRect(x: 10, y: 350, width: view.frame.width, height: 100))
        welcomeText.text = "Match the MDB Member!"
        welcomeText.font = UIFont(name: "CourierNewPS-BoldMT", size: 24)
        welcomeText.textAlignment = .center
        view.addSubview(welcomeText)
        
        instruction = UILabel(frame: CGRect(x: 10, y: 420, width: view.frame.width, height: 50))
        instruction.text = "Press Start"
        instruction.font = UIFont(name: "CourierNewPSMT", size: 16)
        instruction.textAlignment = .center
        view.addSubview(instruction)
        
        startButton = UIButton(frame: CGRect(x: 10, y: 1000, width: view.frame.width / 2, height: 50))
        startButton.center = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2 + 150)
        startButton.setTitle("Start!", for: .normal)
        startButton.backgroundColor = UIColor(hue: 0.60, saturation: 0.61, brightness: 0.96, alpha: 1.0)
        startButton.addTarget(self, action: #selector(startClicked), for: .touchUpInside)
        view.addSubview(startButton)
    }
    
    @objc func startClicked() {
        performSegue(withIdentifier: "toResult", sender: self)
    }

}

