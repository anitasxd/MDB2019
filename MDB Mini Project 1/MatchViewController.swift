//
//  MatchViewController.swift
//  MDB Mini Project 1
//
//  Created by Anita Shen on 2/7/19.
//  Copyright © 2019 Anita Shen. All rights reserved.
//

import UIKit

class MatchViewController: UIViewController {
    var scoreTitle : UILabel!
    var score : UILabel!
    var userScore = 0
    var lastThree = [String]()
    var longestStreak = 0
    var bestStreak = 0
    
    var instruction : UILabel!
    var resultLabel : UILabel!
    var memberImage : UIImageView!
    var current_member : String!
    var memberIndex: Int!
    
    var answerButton: Int!
    var option1: UIButton!
    var option2: UIButton!
    var option3: UIButton!
    var option4: UIButton!
    
    var startStop : UIButton!
    
    var option1_name: String!
    var option2_name: String!
    var option3_name: String!
    var option4_name: String!
    
    var timer = Timer()
    var timerTitle : UILabel!
    var timerLabel : UILabel!
    var seconds = 5
    //var isTimerRunning = true
    //var resumeTapped = false
    
    var stat: UIButton!
    var statsBar : UIBarButtonItem!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupImage()
        setButtons()
        startStopButton()
        setupTimer()
        setupScore()
        round()
        
    }
    
    func setupTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(MatchViewController.updateTimer)), userInfo: nil, repeats: true)
        timerTitle = UILabel(frame: CGRect(x: view.frame.width / 2 - 75, y: 355, width: view.frame.width, height: 100))
        timerTitle.text = "Timer: "
        timerTitle.font = UIFont(name: "Courier", size: 28)
        view.addSubview(timerTitle)
        timerLabel = UILabel(frame: CGRect(x: view.frame.width / 2 + 25, y: 355, width: view.frame.width, height: 100))
        timerLabel.text = "\(seconds)"
        timerLabel.font = UIFont(name: "Courier", size: 28)
        view.addSubview(timerLabel)
        
    }
    
    func setupScore(){
        scoreTitle = UILabel(frame: CGRect(x: view.frame.width / 2 - 75 , y: 377, width: view.frame.width, height: 100))
        scoreTitle.text = "Score: "
        scoreTitle.font = UIFont(name: "Courier", size: 28)
        view.addSubview(scoreTitle)
        score = UILabel(frame: CGRect(x: view.frame.width / 2 + 25 , y: 377, width: view.frame.width, height: 100))
        //userScore = UserDefaults.standard.integer(forKey: "Score")
        score.text = "\(userScore)"
        score.font = UIFont(name: "Courier", size: 28)
        view.addSubview(score)
    }
    
    
    func setupImage(){
        memberImage  =  UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width / 1.45, height: view.frame.width / 1.45))
        memberImage.center = CGPoint(x: view.frame.width / 2, y: view.frame.height / 3)
        memberImage.contentMode = .scaleAspectFill
        memberImage.clipsToBounds = true
        view.addSubview(memberImage)
    
    }
    
    func startStopButton(){
        startStop = UIButton(frame: CGRect(x: 30, y: 650, width: view.frame.width - 100, height: 30))
        startStop.center = CGPoint(x: view.frame.width / 2, y: view.frame.height - 50)
        startStop.setTitleColor(.white, for: .normal)
        startStop.setTitle("Stop Game", for: .normal)
        startStop.backgroundColor = UIColor(hue: 0.60, saturation: 0.61, brightness: 0.96, alpha: 1.0)
        startStop.layer.cornerRadius = 10
        startStop.addTarget(self, action: #selector(startStopPressed), for: .touchUpInside)
        view.addSubview(startStop)
    }
    
    func round(){
        getRandom()
        changeImage()
        //setButtons()
        setButtonAnswer()
        changeButtons()
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if self.seconds < 1 {
            timer.invalidate()
            UIView.animate(withDuration: 1.0) {
                self.option1.backgroundColor =  .red
                self.option2.backgroundColor =  .red
                self.option3.backgroundColor =  .red
                self.option4.backgroundColor =  .red
            }
            UIView.animate(withDuration: 0.7) {
                self.option1.backgroundColor =  UIColor(hue: 0.5583, saturation: 0.61, brightness: 0.96, alpha: 1.0)
                self.option2.backgroundColor =  UIColor(hue: 0.5583, saturation: 0.61, brightness: 0.96, alpha: 1.0)
                self.option3.backgroundColor =  UIColor(hue: 0.5583, saturation: 0.61, brightness: 0.96, alpha: 1.0)
                self.option4.backgroundColor =  UIColor(hue: 0.5583, saturation: 0.61, brightness: 0.96, alpha: 1.0)
            }
        
            resetTimer()
            runTimer()
            round()
        } else {
            self.seconds-=1
            timerLabel.text = "\(seconds)"
        }
    }
   
    func resetTimer() {
        seconds = 6
    }
    
    func getRandom(){
        memberIndex = Int(arc4random_uniform(UInt32(Constants.names.count)))
        current_member = Constants.names[memberIndex]
    }
    
    func changeImage(){
        memberImage.image = Constants.getImageFor(name: Constants.names[memberIndex])
    }
    
    func setButtonAnswer(){
        let n = Int(arc4random_uniform(UInt32(4))) + 1
        answerButton = n
    }
    
    func checkName(name: String) -> String{
        var x = name
        while x == option1_name || x == option2_name || x == option3_name || x == option4_name{
            x = Constants.names[Int(arc4random_uniform(UInt32(Constants.names.count)))]
        }
        return x
    }
    
    func getImageFor(name: String) -> UIImage {
        let noWhitespace = name.components(separatedBy: .whitespaces).joined().lowercased()
        return UIImage(named: noWhitespace)!
    }
    
    func setButtons(){
        option1 = UIButton(frame: CGRect(x: 30, y:450, width: view.frame.width-60, height: 40))
        option1.setTitleColor(.white, for: .normal)
        option1.backgroundColor = UIColor(hue: 0.5583, saturation: 0.61, brightness: 0.96, alpha: 1.0)
        option1.layer.cornerRadius = 5
        view.addSubview(option1)
        
        option2 = UIButton(frame: CGRect(x: 30, y:500, width: view.frame.width-60, height: 40))
        option2.setTitleColor(.white, for: .normal)
        option2.backgroundColor = UIColor(hue: 0.5583, saturation: 0.61, brightness: 0.96, alpha: 1.0)
        option2.layer.cornerRadius = 5
        view.addSubview(option2)
        
        option3 = UIButton(frame: CGRect(x: 30, y:550, width: view.frame.width-60, height: 40))
        option3.setTitleColor(.white, for: .normal)
        option3.backgroundColor = UIColor(hue: 0.5583, saturation: 0.61, brightness: 0.96, alpha: 1.0)
        option3.layer.cornerRadius = 5
        view.addSubview(option3)
        
        option4 = UIButton(frame: CGRect(x: 30, y:600, width: view.frame.width-60, height: 40))
        option4.setTitleColor(.white, for: .normal)
        option4.backgroundColor = UIColor(hue: 0.5583, saturation: 0.61, brightness: 0.96, alpha: 1.0)
        option4.layer.cornerRadius = 5
        view.addSubview(option4)
        
        
    }
    
    
    func changeButtons(){
        if answerButton == 1{
            option1_name = current_member
            option1.setTitle(current_member, for: .normal)
            option1.addTarget(self, action: #selector(correctAttempt), for: .touchUpInside)
            
            option2_name = checkName(name: Constants.names[Int(arc4random_uniform(UInt32(Constants.names.count)))] )
            option2.setTitle(option2_name, for: .normal)
            option2.addTarget(self, action: #selector(incorrectAttempt), for: .touchUpInside)
            
            option3_name = checkName(name: Constants.names[Int(arc4random_uniform(UInt32(Constants.names.count)))] )
            option3.setTitle(option3_name, for: .normal)
            option3.addTarget(self, action: #selector(incorrectAttempt), for: .touchUpInside)
            
            option4_name = checkName(name: Constants.names[Int(arc4random_uniform(UInt32(Constants.names.count)))] )
            option4.setTitle(option4_name, for: .normal)
            option4.addTarget(self, action: #selector(incorrectAttempt), for: .touchUpInside)
            
        } else if answerButton == 2{
            option1_name =  checkName(name: Constants.names[Int(arc4random_uniform(UInt32(Constants.names.count)))] )
            option1.setTitle(option1_name, for: .normal)
            option1.addTarget(self, action: #selector(incorrectAttempt), for: .touchUpInside)
            
            option2_name = current_member
            option2.setTitle(current_member, for: .normal)
            option2.addTarget(self, action: #selector(correctAttempt), for: .touchUpInside)
            
            option3_name = checkName(name: Constants.names[Int(arc4random_uniform(UInt32(Constants.names.count)))] )
            option3.setTitle(option3_name, for: .normal)
            option3.addTarget(self, action: #selector(incorrectAttempt), for: .touchUpInside)
            
            option4_name = checkName(name: Constants.names[Int(arc4random_uniform(UInt32(Constants.names.count)))] )
            option4.setTitle(option4_name, for: .normal)
            option4.addTarget(self, action: #selector(incorrectAttempt), for: .touchUpInside)
            
        } else if answerButton == 3{
            option1_name =  checkName(name: Constants.names[Int(arc4random_uniform(UInt32(Constants.names.count)))] )
            option1.setTitle(option1_name, for: .normal)
            option1.addTarget(self, action: #selector(incorrectAttempt), for: .touchUpInside)
            
            option2_name = checkName(name: Constants.names[Int(arc4random_uniform(UInt32(Constants.names.count)))] )
            option2.setTitle(option2_name, for: .normal)
            option2.addTarget(self, action: #selector(incorrectAttempt), for: .touchUpInside)
            
            option3_name = current_member
            option3.setTitle(current_member, for: .normal)
            option3.addTarget(self, action: #selector(correctAttempt), for: .touchUpInside)
            
            option4_name = checkName(name: Constants.names[Int(arc4random_uniform(UInt32(Constants.names.count)))] )
            option4.setTitle(option4_name, for: .normal)
            option4.addTarget(self, action: #selector(incorrectAttempt), for: .touchUpInside)
        } else{
            option1_name = checkName(name: Constants.names[Int(arc4random_uniform(UInt32(Constants.names.count)))] )
            option1.setTitle(option1_name, for: .normal)
            option1.addTarget(self, action: #selector(incorrectAttempt), for: .touchUpInside)
            
            option2_name = checkName(name: Constants.names[Int(arc4random_uniform(UInt32(Constants.names.count)))] )
            option2.setTitle(option2_name, for: .normal)
            option2.addTarget(self, action: #selector(incorrectAttempt), for: .touchUpInside)
            
            option3_name = checkName(name: Constants.names[Int(arc4random_uniform(UInt32(Constants.names.count)))] )
            option3.setTitle(option3_name, for: .normal)
            option3.addTarget(self, action: #selector(incorrectAttempt), for: .touchUpInside)
            
            option4_name = current_member
            option4.setTitle(current_member, for: .normal)
            option4.addTarget(self, action: #selector(correctAttempt), for: .touchUpInside)
        }
        
    }
    
    func userStatistics()
    {
        stat = UIButton(frame: CGRect(x: 0, y:0, width: 20, height: 20))
        //stat.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        stat.setTitle("Start!", for: .normal)
        stat.setTitleColor(.blue, for: .normal)
        stat.addTarget(self, action: #selector(switchStats), for: .touchUpInside)
        statsBar = UIBarButtonItem(customView: stat)
        self.navigationItem.setRightBarButton(statsBar, animated: true)
    }
    
    func checkLongest(){
        if longestStreak > bestStreak {
            bestStreak = longestStreak
        }
        longestStreak = 0
    }
    
    
    @objc func correctAttempt(sender: UIButton){
        UIView.animate(withDuration: 1.0) {
            sender.backgroundColor =  .green
        }
        UIView.animate(withDuration: 0.7) {
            sender.backgroundColor =  UIColor(hue: 0.5583, saturation: 0.61, brightness: 0.96, alpha: 1.0)
        }
        userScore+=1
        longestStreak = longestStreak + 1
        score.text = "\(userScore)"
        appendLastThree()
        resetTimer()
        round()
        
    }
    
    @objc func incorrectAttempt(sender: UIButton){
        UIView.animate(withDuration: 1.0) {
            sender.backgroundColor =  .red
        }
        UIView.animate(withDuration: 0.7) {
            sender.backgroundColor =  UIColor(hue: 0.5583, saturation: 0.61, brightness: 0.96, alpha: 1.0)
        }
        checkLongest()
        resetTimer()
        round()
    }
    
    @objc func startStopPressed(sender: UIButton){
        //UserDefaults.standard.set(userScore, forKey: "Score")
        performSegue(withIdentifier: "backMain", sender: self)
    }
    
    @objc func switchStats(sender: UIButton){
        performSegue(withIdentifier: "toStatsButton", sender: self)
    }
    
    func appendLastThree(){
        if lastThree.count == 3{
            lastThree[0] = lastThree[1]
            lastThree[1] = lastThree[2]
            lastThree[2] = Constants.names[memberIndex]
        }
        else{
            lastThree.append(Constants.names[memberIndex])
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let vc = segue.destination as? StatsViewController{
            vc.longest = bestStreak
            vc.three = lastThree
        }
    }
    

}
