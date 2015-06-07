//
//  ViewController.swift
//  Train Track
//
//  Created by Andrew Mathena on 6/3/15.
//  Copyright (c) 2015 Andrew Mathena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tren1: UIImageView!
    @IBOutlet weak var tren2: UIImageView!
    @IBOutlet weak var tren3: UIImageView!
    @IBOutlet weak var tren4: UIImageView!
    @IBOutlet weak var tren5: UIImageView!
    @IBOutlet weak var tren6: UIImageView!
    @IBOutlet weak var z1: UILabel!
    @IBOutlet weak var z2: UILabel!
    @IBOutlet weak var z3: UILabel!
    @IBOutlet weak var z4: UILabel!
    @IBOutlet weak var z5: UILabel!
    @IBOutlet weak var z6: UILabel!
    @IBOutlet weak var totalScore: UILabel!
    @IBOutlet weak var smoke3: UIImageView!
    @IBOutlet weak var smoke1: UIImageView!
    @IBOutlet weak var smoke2: UIImageView!
    @IBOutlet weak var smoke4: UIImageView!
    @IBOutlet weak var smoke5: UIImageView!
    @IBOutlet weak var smoke6: UIImageView!
    @IBOutlet weak var bground: UIImageView!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var bground_container: UIView!
    
    let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if (delegate.introw != true) {
            self.bground.alpha = 1.0
            self.logo.alpha = 1.0
        } else {
            self.bground_container.hidden = true
            self.logo.hidden = true
        }
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
        
        if (delegate.introw != true) {
            super.viewDidAppear(animated)
            
            UIView.animateWithDuration(0.8, animations: {
                self.logo.alpha = 0.0
                },
                completion: {
                    (value: Bool) in
                    UIView.animateWithDuration(0.2, animations: {
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
        
        let digit = sender.currentTitle!
        
        var blah = tren1
        var score = z1
        var fucc = 0
        var totScore = 0
        
        func wobble(x: UIImageView){
            UIView.animateWithDuration(0.3, animations: {
                x.transform =  CGAffineTransformMakeScale(0.5, 1)
                x.transform =  CGAffineTransformMakeScale(1, 1)
            })
        }
        
        func scoreKeep(x: UILabel) {
            fucc = x.text!.toInt()! - 1
            x.text = String(fucc)
            
            switch x {
            case z1:
                totScore = totalScore.text!.toInt()! - 1
                totalScore.text = String(totScore)
            case z2:
                totScore = totalScore.text!.toInt()! - 2
                totalScore.text = String(totScore)
            case z3:
                totScore = totalScore.text!.toInt()! - 4
                totalScore.text = String(totScore)
            case z4:
                totScore = totalScore.text!.toInt()! - 7
                totalScore.text = String(totScore)
            case z5:
                totScore = totalScore.text!.toInt()! - 10
                totalScore.text = String(totScore)
            case z6:
                totScore = totalScore.text!.toInt()! - 15
                totalScore.text = String(totScore)
            default: break
            }
            
        }
        
        if digit == "minus1" && z1.text!.toInt()! > 0 {
            blah = tren1
            score = z1
            scoreKeep(score)
            wobble(blah)
        } else if digit == "minus2" && z2.text!.toInt()! > 0 {
            blah = tren2
            score = z2
            scoreKeep(score)
            wobble(blah)
        } else if digit == "minus3" && z3.text!.toInt()! > 0 {
            blah = tren3
            score = z3
            scoreKeep(score)
            wobble(blah)
        } else if digit == "minus4" && z4.text!.toInt()! > 0 {
            blah = tren4
            score = z4
            scoreKeep(score)
            wobble(blah)
        } else if digit == "minus5" && z5.text!.toInt()! > 0 {
            blah = tren5
            score = z5
            scoreKeep(score)
            wobble(blah)
        } else if digit == "minus6" && z6.text!.toInt()! > 0 {
            blah = tren6
            score = z6
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
    }
    
    @IBAction func plus(sender: UIButton) {
        
        let digit = sender.currentTitle!
        
        var blah = tren1
        var score = z1
        var fucc = 0
        var totScore = 0
        var smokee = smoke3
        
        func smokePoof(x: UIImageView){
            
            x.hidden = false
            
            UIView.animateWithDuration(0.5, delay: 0.0, options: .TransitionCurlDown, animations: {
                var grow = CGAffineTransformMakeScale(4, 4)
                var move = CGAffineTransformMakeTranslation(0, -40)
                x.transform = CGAffineTransformConcat(grow, move)
                x.alpha = 0.0
                },
                completion: {
                    (value: Bool) in
                    x.hidden = true
                    var grow = CGAffineTransformMakeScale(1, 1)
                    var move = CGAffineTransformMakeTranslation(0, 0)
                    x.transform = CGAffineTransformConcat(grow, move)
                    x.alpha = 1.0
            })
        }
        
        func scoreKeep(x: UILabel) {
            fucc = x.text!.toInt()! + 1
            x.text = String(fucc)
            
            switch x {
            case z1:
                totScore = totalScore.text!.toInt()! + 1
                totalScore.text = String(totScore)
            case z2:
                totScore = totalScore.text!.toInt()! + 2
                totalScore.text = String(totScore)
            case z3:
                totScore = totalScore.text!.toInt()! + 4
                totalScore.text = String(totScore)
            case z4:
                totScore = totalScore.text!.toInt()! + 7
                totalScore.text = String(totScore)
            case z5:
                totScore = totalScore.text!.toInt()! + 10
                totalScore.text = String(totScore)
            case z6:
                totScore = totalScore.text!.toInt()! + 15
                totalScore.text = String(totScore)
            default: break
            }
            
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
        }
        
        scoreKeep(score)
        smokePoof(smokee)
        
        UIView.animateWithDuration(0.3, animations: {
            blah.transform =  CGAffineTransformMakeScale(1, 2)
            blah.transform =  CGAffineTransformMakeScale(1, 1)
            
            
        })
        
    }
    
}

