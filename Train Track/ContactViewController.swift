//
//  ContactViewController.swift
//  Train Track
//
//  Created by Andrew Mathena on 6/6/15.
//  Copyright (c) 2015 Andrew Mathena. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox

class ContactViewController: UIViewController {

    @IBOutlet weak var bg: UIView!
    @IBOutlet weak var bro: UIImageView!
    @IBOutlet weak var info: UIImageView!
    @IBOutlet weak var thanks: UIImageView!
    
    var pianoSound5 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("clik", ofType: "wav")!)
    var audioPlayer5 = AVAudioPlayer()
    
    @IBOutlet weak var tomas_switch: UISwitch!
    @IBOutlet weak var tomas_label: UILabel!
    @IBOutlet weak var setting_label: NSLayoutConstraint!
    @IBOutlet weak var settings: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        audioPlayer5 = try! AVAudioPlayer(contentsOfURL: pianoSound5)
        audioPlayer5.prepareToPlay()
        
        tomas_label.adjustsFontSizeToFitWidth = true
        //for settings togglez
        let defaults = NSUserDefaults.standardUserDefaults()

        if (defaults.objectForKey("SwitchState") != nil) {
            tomas_switch.on = defaults.boolForKey("SwitchState")
        } else {
            tomas_switch.on = false
        }
        
        self.bro.transform = CGAffineTransformMakeTranslation(200, 0)
        self.info.transform = CGAffineTransformMakeTranslation(-200, 0)
        self.thanks.alpha = 0.0
        self.tomas_switch.alpha = 0.0
        self.tomas_label.alpha = 0.0
        self.settings.alpha = 0.0
        self.bg.alpha = 0.0
    }
    @IBAction func clak(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        if (defaults.boolForKey("SwitchState") == true) {
            if audioPlayer5.playing {
                audioPlayer5.stop()
                audioPlayer5.currentTime = 0.0
                audioPlayer5.play()
            } else {
                audioPlayer5.play()
            }
            
        }
        
    }
    @IBAction func togg(sender: UISwitch) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if tomas_switch.on {
            defaults.setBool(true, forKey: "SwitchState")
        } else {
            defaults.setBool(false, forKey: "SwitchState")
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.4, animations: {
            self.bro.transform = CGAffineTransformMakeTranslation(0, 0)
            self.info.transform = CGAffineTransformMakeTranslation(0, 0)
            self.tomas_label.alpha = 1.0
            self.tomas_switch.alpha = 1.0
            self.thanks.alpha = 1.0
            self.settings.alpha = 1.0
            self.bg.alpha = 1.0
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
