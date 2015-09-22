//
//  ViewController.swift
//  Train Track
//
//  Created by Andrew Mathena on 6/3/15.
//  Copyright (c) 2015 Andrew Mathena. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox

class ViewController: UIViewController {
    
    var pianoSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("buzza", ofType: "wav")!)
    var pianoSound2 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("horn2", ofType: "wav")!)
    var audioPlayer = AVAudioPlayer()
    var audioPlayer2 = AVAudioPlayer()
    
    //train images (for animations)
    @IBOutlet weak var tren1: UIImageView!
    @IBOutlet weak var tren2: UIImageView!
    @IBOutlet weak var tren3: UIImageView!
    @IBOutlet weak var tren4: UIImageView!
    @IBOutlet weak var tren5: UIImageView!
    @IBOutlet weak var tren6: UIImageView!
    @IBOutlet weak var tren7: UIImageView!
    @IBOutlet weak var tren8: UIImageView!
    
    //scores n smokes n crap
    @IBOutlet weak var z1: UILabel!
    @IBOutlet weak var z2: UILabel!
    @IBOutlet weak var z3: UILabel!
    @IBOutlet weak var z4: UILabel!
    @IBOutlet weak var z5: UILabel!
    @IBOutlet weak var z6: UILabel!
    @IBOutlet weak var z7: UILabel!
    @IBOutlet weak var z8: UILabel!
    @IBOutlet weak var totalScore: UILabel!
    @IBOutlet weak var smoke3: UIImageView!
    @IBOutlet weak var smoke1: UIImageView!
    @IBOutlet weak var smoke2: UIImageView!
    @IBOutlet weak var smoke4: UIImageView!
    @IBOutlet weak var smoke5: UIImageView!
    @IBOutlet weak var smoke6: UIImageView!
    @IBOutlet weak var smoke7: UIImageView!
    @IBOutlet weak var smoke8: UIImageView!
    @IBOutlet weak var bground: UIImageView!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var bground_container: UIView!
    @IBOutlet weak var dude: UILabel!
    
    let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        audioPlayer = try! AVAudioPlayer(contentsOfURL: pianoSound)
        audioPlayer.prepareToPlay()
        audioPlayer2 = try! AVAudioPlayer(contentsOfURL: pianoSound2)
        audioPlayer2.prepareToPlay()
        
        // Do any additional setup after loading the view, typically from a nib.
        if (delegate.introw != true) {
            self.bground.alpha = 1.0
            self.logo.alpha = 1.0
           // println("one")
        } else {
            self.bground_container.hidden = true
            self.logo.hidden = true
           // println("two")
        }
    }
    
    
    
    override func viewDidAppear(animated: Bool) {
        
        
        if (delegate.introw != true) {
            super.viewDidAppear(animated)
            
            UIView.animateWithDuration(1.5, animations: {
                self.logo.alpha = 0.0
                },
                completion: {
                    (value: Bool) in
                    UIView.animateWithDuration(0.3, animations: {
                        self.bground_container.alpha = 0.0
                        },
                        completion: {
                            (value: Bool) in
                            self.logo.hidden = true
                            self.bground_container.hidden = true
                    })
            })
            delegate.introw = true;
        } else {
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func minus(sender: UIButton) {
        var defaults = NSUserDefaults.standardUserDefaults()
        
        if (defaults.boolForKey("SwitchState") == true) {
            if audioPlayer2.playing {
                audioPlayer2.stop()
                audioPlayer2.currentTime = 0.0
                audioPlayer2.play()
            } else {
                audioPlayer2.play()
            }
            
        }
        
        let digit = sender.currentTitle!
        
        var blah = tren1
        var score = z1
        var friend = 0
        var totScore = 0
        
        func wobble(x: UIImageView){
            UIView.animateWithDuration(0.3, animations: {
                x.transform =  CGAffineTransformMakeScale(0.5, 1)
                x.transform =  CGAffineTransformMakeScale(1, 1)
            })
        }
        
        let dudePush = { (scorex: String) -> () in
            if Int(scorex) > 300 && self.dude.hidden == true {
                self.dude.transform = CGAffineTransformMakeTranslation(-200, 0)
                self.dude.hidden = false
                UIView.animateWithDuration(0.4, animations: {
                    self.dude.transform = CGAffineTransformMakeTranslation(0, 0)
                })
            } else if Int(scorex) > 300 && self.dude.hidden == false {
                
            } else {
                
                UIView.animateWithDuration(0.4, animations: {
                    self.dude.transform = CGAffineTransformMakeTranslation(-200, 0)
                    },
                    completion: {
                        (value: Bool) in
                        self.dude.hidden = true
                })
            }
        }
    
    
    
    
        func scoreKeep(x: UILabel) {
            friend = Int(x.text!)! - 1
            x.text = String(friend)
            
            switch x {
            case z1:
                totScore = Int(totalScore.text!)! - 1
                totalScore.text = String(totScore)
            case z2:
                totScore = Int(totalScore.text!)! - 2
                totalScore.text = String(totScore)
            case z3:
                totScore = Int(totalScore.text!)! - 4
                totalScore.text = String(totScore)
            case z4:
                totScore = Int(totalScore.text!)! - 7
                totalScore.text = String(totScore)
            case z5:
                totScore = Int(totalScore.text!)! - 10
                totalScore.text = String(totScore)
            case z6:
                totScore = Int(totalScore.text!)! - 15
                totalScore.text = String(totScore)
            case z7:
                totScore = Int(totalScore.text!)! - 18
                totalScore.text = String(totScore)
            case z8:
                totScore = Int(totalScore.text!)! - 21
                totalScore.text = String(totScore)
            default: break
            }
            
            dudePush(totalScore.text!)
            

            
        }
        
        if digit == "minus1" && Int(z1.text!)! > 0 {
            blah = tren1
            score = z1
            scoreKeep(score)
            wobble(blah)
        } else if digit == "minus2" && Int(z2.text!)! > 0 {
            blah = tren2
            score = z2
            scoreKeep(score)
            wobble(blah)
        } else if digit == "minus3" && Int(z3.text!)! > 0 {
            blah = tren3
            score = z3
            scoreKeep(score)
            wobble(blah)
        } else if digit == "minus4" && Int(z4.text!)! > 0 {
            blah = tren4
            score = z4
            scoreKeep(score)
            wobble(blah)
        } else if digit == "minus5" && Int(z5.text!)! > 0 {
            blah = tren5
            score = z5
            scoreKeep(score)
            wobble(blah)
        } else if digit == "minus6" && Int(z6.text!)! > 0 {
            blah = tren6
            score = z6
            scoreKeep(score)
            wobble(blah)
        } else if digit == "minus7" && Int(z7.text!)! > 0 {
            blah = tren7
            score = z7
            scoreKeep(score)
            wobble(blah)
        } else if digit == "minus8" && Int(z8.text!)! > 0 {
            blah = tren8
            score = z8
            scoreKeep(score)
            wobble(blah)
        }
        
    }
    
    @IBAction func clear(sender: AnyObject) {
        totalScore.text = "0"
        z1.text = "0"
        z2.text = "0"
        z3.text = "0"
        z4.text = "0"
        z5.text = "0"
        z6.text = "0"
        z7.text = "0"
        z8.text = "0"
        
        UIView.animateWithDuration(0.4, animations: {
            self.dude.transform = CGAffineTransformMakeTranslation(-200, 0)
            },
            completion: {
                (value: Bool) in
                self.dude.hidden = true
        })
    }
    
    @IBAction func plus(sender: UIButton) {
        
        let digit = sender.currentTitle!
        var defaults = NSUserDefaults.standardUserDefaults()
        var blah = tren1
        var score = z1
        var friend = 0
        var totScore = 0
        var smokee = smoke3
        
        if (defaults.boolForKey("SwitchState") == true) {
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            if audioPlayer.playing {
                audioPlayer.stop()
                audioPlayer.currentTime = 0.0
                audioPlayer.play()
            } else {
                audioPlayer.play()
            }
        }
    
        func smokePoof(x: UIImageView){
            
            x.hidden = false
            
            UIView.animateWithDuration(0.5, delay: 0.0, options: .TransitionCurlDown, animations: {
                let grow = CGAffineTransformMakeScale(4, 4)
                let move = CGAffineTransformMakeTranslation(0, -40)
                x.transform = CGAffineTransformConcat(grow, move)
                x.alpha = 0.0
                },
                completion: {
                    (value: Bool) in
                    x.hidden = true
                    let grow = CGAffineTransformMakeScale(1, 1)
                    let move = CGAffineTransformMakeTranslation(0, 0)
                    x.transform = CGAffineTransformConcat(grow, move)
                    x.alpha = 1.0
            })
        }
        
        let dudePush = { (scorex: String) -> () in
            if Int(scorex) > 300 && self.dude.hidden == true {
                self.dude.transform = CGAffineTransformMakeTranslation(-200, 0)
                self.dude.hidden = false
                UIView.animateWithDuration(0.4, animations: {
                    self.dude.transform = CGAffineTransformMakeTranslation(0, 0)
                })
            } else if Int(scorex) > 300 && self.dude.hidden == false {
                
            } else {
                
                UIView.animateWithDuration(0.4, animations: {
                    self.dude.transform = CGAffineTransformMakeTranslation(-200, 0)
                    },
                    completion: {
                        (value: Bool) in
                        self.dude.hidden = true
                })
            }
        }
        
        func scoreKeep(x: UILabel) {
            friend = Int(x.text!)! + 1
            x.text = String(friend)
            
            switch x {
            case z1:
                totScore = Int(totalScore.text!)! + 1
                totalScore.text = String(totScore)
            case z2:
                totScore = Int(totalScore.text!)! + 2
                totalScore.text = String(totScore)
            case z3:
                totScore = Int(totalScore.text!)! + 4
                totalScore.text = String(totScore)
            case z4:
                totScore = Int(totalScore.text!)! + 7
                totalScore.text = String(totScore)
            case z5:
                totScore = Int(totalScore.text!)! + 10
                totalScore.text = String(totScore)
            case z6:
                totScore = Int(totalScore.text!)! + 15
                totalScore.text = String(totScore)
            case z7:
                totScore = Int(totalScore.text!)! + 18
                totalScore.text = String(totScore)
            case z8:
                totScore = Int(totalScore.text!)! + 21
                totalScore.text = String(totScore)
            default: break
            }
            
            dudePush(totalScore.text!)
            
        }
        
        if digit == "plus1" {
            blah = tren1
            score = z1
            smokee = smoke1
        } else if digit == "plus2" {
            blah = tren2
            score = z2
            smokee = smoke2
        } else if digit == "plus3" {
            blah = tren3
            score = z3
            smokee = smoke3
        } else if digit == "plus4" {
            blah = tren4
            score = z4
            smokee = smoke4
        } else if digit == "plus5" {
            blah = tren5
            score = z5
            smokee = smoke5
        } else if digit == "plus6" {
            blah = tren6
            score = z6
            smokee = smoke6
        } else if digit == "plus7" {
            blah = tren7
            score = z7
             smokee = smoke7
        }else if digit == "plus8" {
            blah = tren8
            score = z8
            smokee = smoke8
        }
        
        scoreKeep(score)
        smokePoof(smokee)
        
        UIView.animateWithDuration(0.3, animations: {
            blah.transform =  CGAffineTransformMakeScale(1, 2)
            blah.transform =  CGAffineTransformMakeScale(1, 1)
            
            
        })
        
    }
    
}

