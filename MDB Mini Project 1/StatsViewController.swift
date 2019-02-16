//
//  StatsViewController.swift
//  MDB Mini Project 1
//
//  Created by Anita Shen on 2/7/19.
//  Copyright © 2019 Anita Shen. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    var statsText : UILabel!
    var longestStreak: UILabel!
    var longest : Int!
    var statsImage : UIImageView!
    
    var lastText : UILabel!
    var three = [String]()
    var last1: UILabel!
    var last2: UILabel!
    var last3: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
        
    }
    
    func setup(){
        statsImage =  UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width / 2, height: view.frame.height / 3))
        statsImage.center = CGPoint(x: view.frame.width / 2, y: view.frame.height / 5)
        statsImage.image = UIImage(named: "stats")
        statsImage.contentMode = .scaleAspectFit
        view.addSubview(statsImage)
        
        statsText = UILabel(frame: CGRect(x: 10, y: 200, width: view.frame.width, height: 100))
        statsText.text = "My Statistics"
        statsText.font = UIFont(name: "CourierNewPS-BoldMT", size: 36)
        statsText.textAlignment = .center
        view.addSubview(statsText)
        
        longestStreak = UILabel(frame: CGRect(x: 10, y: 300, width: view.frame.width, height: 100))
        longestStreak .text = "Longest Streak: \(longest!)"
        longestStreak.font = UIFont(name: "Courier", size: 30)
        longestStreak .textAlignment = .center
        view.addSubview(longestStreak)
        
        lastText = UILabel(frame: CGRect(x: 10, y: 350, width: view.frame.width, height: 100))
        lastText .text = "Last Three Names: "
        lastText.font = UIFont(name: "Courier", size: 30)
        lastText .textAlignment = .center
        view.addSubview(lastText)
    
        last1 = UILabel(frame: CGRect(x: view.frame.width / 8  , y: 400, width: view.frame.width, height: 100))
        last1.text = "1. \(three[0])"
        last1.font = UIFont(name: "Courier", size: 24)
        //last1 .textAlignment = .center
        view.addSubview(last1)
        
        last2 = UILabel(frame: CGRect(x: view.frame.width / 8, y: 450, width: view.frame.width, height: 100))
        last2.text = "2. \(three[1])"
        last2.font = UIFont(name: "Courier", size: 24)
        //last2 .textAlignment = .center
        view.addSubview(last2)
        
        last3 = UILabel(frame: CGRect(x: view.frame.width / 8, y: 500, width: view.frame.width, height: 100))
        last3.text = "3. \(three[2])"
        last3.font = UIFont(name: "Courier", size: 24)
        //last3 .textAlignment = .center
        view.addSubview(last3)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
