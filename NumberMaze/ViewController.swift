//
//  ViewController.swift
//  NumberMaze
//
//  Created by Joseph Leiferman on 4/15/16.
//  Copyright © 2016 electricBrain. All rights reserved.
//

import UIKit
import AVFoundation
import Darwin

class ViewController: UIViewController {
    
    //variables below
    
    // audio
    var count = 0
    var zero : AVAudioPlayer?
    var one : AVAudioPlayer?
    var two : AVAudioPlayer?
    var three : AVAudioPlayer?
    var four : AVAudioPlayer?
    var five : AVAudioPlayer?
    var six : AVAudioPlayer?
    var seven : AVAudioPlayer?
    var eight : AVAudioPlayer?
    var nine : AVAudioPlayer?
    var WetLand_BG: AVAudioPlayer?
    var wrong: AVAudioPlayer?
    // labels
    var target = Int(arc4random_uniform(10))
    // randomly picked matrix
    var currentMatrix = Int(arc4random_uniform(3))
    // three different configurations
    var compList: [Int] = []
    var matrix0: [[Int]] = [[1,1,0,1,1,1],[0,1,1,1,0,1],[0,0,0,0,0,1]]
    var matrix0C: [Int]  =  [1,1,0,1,1,1,0,1,1,1,0,1,0,0,0,0,0,1]
    var matrix1: [[Int]] = [[1,1,1,1,1,1],[0,0,0,0,0,1],[0,0,0,0,0,1]]
    var matrix1C:  [Int] =  [1,1,1,1,1,1,0,0,0,0,0,1,0,0,0,0,0,1]
    var matrix2: [[Int]] = [[1,0,0,0,0,0],[1,0,0,1,1,1],[1,1,1,1,0,1]]
    var matrix2C:  [Int] =  [1,0,0,0,0,0,1,0,0,1,1,1,1,1,1,1,0,1]
    // target label
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var returnLabel: UIButton!
    
    //methods below
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // load sounds
        if let wrong = self.setupAudioPlayerWithFile("wrong", type: "wav") {
            self.wrong = wrong
        }
        if let zero = self.setupAudioPlayerWithFile("zero", type: "wav") {
            self.zero = zero
        }
        if let one = self.setupAudioPlayerWithFile("one", type: "wav") {
            self.one = one
        }
        if let two = self.setupAudioPlayerWithFile("two", type: "wav") {
            self.two = two
        }
        if let three = self.setupAudioPlayerWithFile("three", type: "wav") {
            self.three = three
        }
        if let four = self.setupAudioPlayerWithFile("four", type: "wav") {
            self.four = four
        }
        if let five = self.setupAudioPlayerWithFile("five", type: "wav") {
            self.five = five
        }
        if let six = self.setupAudioPlayerWithFile("six", type: "wav") {
            self.six = six
        }
        if let seven = self.setupAudioPlayerWithFile("seven", type: "wav") {
            self.seven = seven
        }
        if let eight = self.setupAudioPlayerWithFile("eight", type: "wav") {
            self.eight = eight
        }
        if let nine = self.setupAudioPlayerWithFile("nine", type: "wav") {
            self.nine = nine
        }
        if let WetLand_BG = self.setupAudioPlayerWithFile("Wetlands_BG", type: "wav") {
            self.WetLand_BG = WetLand_BG
        }
        startGame()
        reset()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // will control the start of the game
    func startGame() {
        // start music
        WetLand_BG?.volume = 0.3
        WetLand_BG?.play()
        // draw the matrix that will displayed
        createLayout()
        // update all labels
        updateLabel()
    }
    
    // what will happen when a button is clicked
    @IBAction func isClicked(sender: UIButton) {
        // change color
        sender.backgroundColor = UIColor.greenColor()
        // if they guess wrong let them know
        if sender.currentTitle != "\(target)" {
            sender.backgroundColor = UIColor.redColor()
            wrong?.play()
            sleep(1/8)
         
        }
        // play audio according to the button the pressed
        if sender.currentTitle == "1" {
            
            one?.play()
        }
        else if sender.currentTitle == "2" {
            
            
            two?.play()
        }
        else if sender.currentTitle == "3" {
            
            
            three?.play()
        }
        else if sender.currentTitle == "4" {
            
            
            four?.play()
        }
        else if sender.currentTitle == "5" {
            
            
            five?.play()
        }
        else if sender.currentTitle == "6" {
            
            
            six?.play()
        }
        else if sender.currentTitle == "7" {
            
            
            seven?.play()
        }
        else if sender.currentTitle == "8" {
            
            
            eight?.play()
        }
        else if sender.currentTitle == "9" {
            
            nine?.play()
        }
        else if sender.currentTitle == "zero" {
            
            zero?.play()
        }
        // check if they have completed the correct path
        checkCompletion()
    }
    
    // will determine if they finished correctly
    func checkCompletion() {
        
        
        count += 1
        
        if currentMatrix == 0 && count >= 10{
            // check each label for color and label
            for view in self.view.subviews as [UIView] {
                if let btn = view as? UIButton {
                    if btn.currentTitle == "\(target)" {
                        if btn.backgroundColor == UIColor.greenColor() {
                            compList.append(1)
                            
                        }
                    
                }
                    
                }
            }
            
            while compList.count < 18 {
                compList.append(0)
            }
            
            compList.sortInPlace()
            matrix0C.sortInPlace()
            
            
            if compList == matrix0C {
                let alert = UIAlertController(title: "", message: "Great Job!", preferredStyle: .Alert)
                let action = UIAlertAction(title: "Continue", style: .Default, handler:
                    {action in self.startGame()})
                alert.addAction(action)
                presentViewController(alert, animated: true, completion: nil)
                
                
                reset()
                }
            else {
                let alert = UIAlertController(title: "", message: "So Close!", preferredStyle: .Alert)
                let action = UIAlertAction(title: "Continue", style: .Default, handler:
                    {action in self.startGame()})
                alert.addAction(action)
                presentViewController(alert, animated: true, completion: nil)
                
                
                reset()
                
            }
            
            
        }
        else if currentMatrix == 1 && count >= 8{
            // check each label for color and label
            for view in self.view.subviews as [UIView] {
                if let btn = view as? UIButton {
                    if btn.currentTitle == "\(target)" {
                        if btn.backgroundColor == UIColor.greenColor() {
                            compList.append(1)
                            
                        }
                        
                    }
                    
                }
            }
            
            while compList.count < 18 {
                compList.append(0)
            }
            
            compList.sortInPlace()
            matrix1C.sortInPlace()
            
            
            if compList == matrix1C {
                let alert = UIAlertController(title: "", message: "Great Job!", preferredStyle: .Alert)
                let action = UIAlertAction(title: "Continue", style: .Default, handler:
                    {action in self.startGame()})
                alert.addAction(action)
                presentViewController(alert, animated: true, completion: nil)
                
                
                reset()
            }
            else {
                let alert = UIAlertController(title: "", message: "So Close!", preferredStyle: .Alert)
                let action = UIAlertAction(title: "Continue", style: .Default, handler:
                    {action in self.startGame()})
                alert.addAction(action)
                presentViewController(alert, animated: true, completion: nil)
                
                
                reset()
            }
        }
        else if currentMatrix == 2 && count >= 10 {
            // check each label for color and label
            for view in self.view.subviews as [UIView] {
                if let btn = view as? UIButton {
                    if btn.currentTitle == "\(target)" {
                        if btn.backgroundColor == UIColor.greenColor() {
                            compList.append(1)
                            
                        }
                        
                    }
                    
                }
            }
            
            while compList.count < 18 {
                compList.append(0)
            }
            
            compList.sortInPlace()
            matrix2C.sortInPlace()
            
            
            if compList == matrix2C {
                let alert = UIAlertController(title: "", message: "Great Job!", preferredStyle: .Alert)
                let action = UIAlertAction(title: "Continue", style: .Default, handler:
                    {action in self.startGame()})
                alert.addAction(action)
                presentViewController(alert, animated: true, completion: nil)
                
                
                reset()
            }
            else {
                let alert = UIAlertController(title: "", message: "So Close!", preferredStyle: .Alert)
                let action = UIAlertAction(title: "Continue", style: .Default, handler:
                    {action in self.startGame()})
                alert.addAction(action)
                presentViewController(alert, animated: true, completion: nil)
                
                
                reset()
            }
        }
        

        
    }
    // start the game over again
    func reset() {
        
        compList = []
        count = 0
        removeButtons()
        target = Int(arc4random_uniform(10))
        currentMatrix = Int(arc4random_uniform(3))
        startGame()
    }
    // set up each audio sounds
    func setupAudioPlayerWithFile(file:NSString, type:NSString) -> AVAudioPlayer? {
        //1
        let path = NSBundle.mainBundle().pathForResource(file as String, ofType: type as String)
        
        let url = NSURL.fileURLWithPath(path!)
        
        //2
        var audioPlayer: AVAudioPlayer?
        
        //3
        do {
            try audioPlayer = AVAudioPlayer(contentsOfURL: url)
        } catch {
            print("Player not avaiable")
        }
        return audioPlayer
    
    }
    // function to update the target label
    func updateLabel() {
        targetLabel.text = "\(target)"
    }

    // will create the layout of the buttons depening on the random variable currentMatrix
    func createLayout() {
        
        var startX = 40
        var curY = 58
        
        if currentMatrix == 0 {
            
            var tracker = 0
            for x in matrix0 {
                for y in x {
                if tracker == 6 || tracker == 12{
                    tracker = 0
                    startX += 83
                    curY = 58
                }
                if y == 1 {
                    
                    let button   = UIButton(type: UIButtonType.System) as UIButton
                    button.frame = CGRectMake(CGFloat(startX), CGFloat(curY), 75, 75)
                    button.layer.cornerRadius = 0.5 * button.bounds.size.width
                    button.backgroundColor = UIColor(red: 149/255,green: 198/255,blue: 255/255, alpha: 1.0)
                    button.setTitle("\(target)", forState: UIControlState.Normal)
                    button.addTarget(self, action: #selector(ViewController.isClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
                    button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
                    self.view.addSubview(button)
                }
                else if y == 0{
                    
                    let button   = UIButton(type: UIButtonType.System) as UIButton
                    button.frame = CGRectMake(CGFloat(startX), CGFloat(curY), 75, 75)
                    button.layer.cornerRadius = 0.5 * button.bounds.size.width
                    button.backgroundColor = UIColor(red: 149/255,green: 198/255,blue: 255/255, alpha: 1.0)
                    button.setTitle("\(Int(arc4random_uniform(10)))", forState: UIControlState.Normal)
                    button.addTarget(self, action: #selector(ViewController.isClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
                    button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
                    self.view.addSubview(button)
                }
                tracker += 1
                curY += 83
                }
            }
        }
        else if currentMatrix == 1 {
            
            var tracker = 0
            for x in matrix1 {
                for y in x {
                if tracker == 6 || tracker == 12{
                    tracker = 0
                    startX += 83
                    curY = 58
                }
                if y == 1 {
                    
                    let button   = UIButton(type: UIButtonType.System) as UIButton
                    button.frame = CGRectMake(CGFloat(startX), CGFloat(curY), 75, 75)
                    button.layer.cornerRadius = 0.5 * button.bounds.size.width
                    button.backgroundColor = UIColor(red: 149/255,green: 198/255,blue: 255/255, alpha: 1.0)
                    button.setTitle("\(target)", forState: UIControlState.Normal)
                    button.addTarget(self, action: #selector(ViewController.isClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
                    button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
                    self.view.addSubview(button)
                }
                else if y == 0{
                                        let button   = UIButton(type: UIButtonType.System) as UIButton
                    button.frame = CGRectMake(CGFloat(startX), CGFloat(curY), 75, 75)
                    button.layer.cornerRadius = 0.5 * button.bounds.size.width
                    button.backgroundColor = UIColor(red: 149/255,green: 198/255,blue: 255/255, alpha: 1.0)
                    button.setTitle("\(Int(arc4random_uniform(10)))", forState: UIControlState.Normal)
                    button.addTarget(self, action: #selector(ViewController.isClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
                    button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
                    self.view.addSubview(button)
                }
                tracker += 1
                curY += 83
                }
            }
        }
        else if currentMatrix == 2 {
            
            var tracker = 0
            for x in matrix2 {
                
                for y in x {
                    if tracker == 6 || tracker == 12{
                        tracker = 0
                        startX += 83
                        curY = 58
                    }
                    if y == 1 {
                    
                        let button   = UIButton(type: UIButtonType.System) as UIButton
                        button.frame = CGRectMake(CGFloat(startX), CGFloat(curY), 75, 75)
                        button.layer.cornerRadius = 0.5 * button.bounds.size.width
                        button.backgroundColor = UIColor(red: 149/255,green: 198/255,blue: 255/255, alpha: 1.0)
                        button.setTitle("\(target)", forState: UIControlState.Normal)
                        button.addTarget(self, action: #selector(ViewController.isClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
                        button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
                        self.view.addSubview(button)
                    }
                    else if y == 0{
                        
                        let button   = UIButton(type: UIButtonType.System) as UIButton
                        button.frame = CGRectMake(CGFloat(startX), CGFloat(curY), 75, 75)
                        button.layer.cornerRadius = 0.5 * button.bounds.size.width
                        button.backgroundColor = UIColor(red: 149/255,green: 198/255,blue: 255/255, alpha: 1.0)
                        button.setTitle("\(Int(arc4random_uniform(10)))", forState: UIControlState.Normal)
                        button.addTarget(self, action: #selector(ViewController.isClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
                        button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
                        self.view.addSubview(button)
                    }
                    tracker += 1
                    curY += 83
                }
                
            }
        }
       
     updateLabel()
    }
    func removeButtons() {
        let subviews = self.view.subviews as [UIView]
        for v in subviews {
            if let button = v as? UIButton {
                if button.currentTitle != "Return" {
                    if button.buttonType != UIButtonType.InfoLight{
                        button.removeFromSuperview()
                    }
                }
            }
        }
    }

 }

