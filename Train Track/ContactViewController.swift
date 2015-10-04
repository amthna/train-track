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
    @IBOutlet weak var rate: UIButton!
    @IBOutlet weak var email: UIButton!
    @IBOutlet weak var url: UIButton!
    
        
        override func viewWillAppear(animated: Bool) {
            super.viewWillAppear(true)
            
            let name = "settings"
            // The UA-XXXXX-Y tracker ID is loaded automatically from the
            // GoogleService-Info.plist by the `GGLContext` in the AppDelegate.
            // If you're copying this to an app just using Analytics, you'll
            // need to configure your tracking ID here.
            // [START screen_view_hit_swift]
            let tracker = GAI.sharedInstance().defaultTracker
            tracker.set(kGAIScreenName, value: name)
            
            let builder = GAIDictionaryBuilder.createScreenView()
            tracker.send(builder.build() as [NSObject : AnyObject])
            // [END screen_view_hit_swift]
        }
        
    
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
        self.rate.transform = CGAffineTransformMakeTranslation(-200, 0)
        self.url.transform = CGAffineTransformMakeTranslation(-200, 0)
        self.email.transform = CGAffineTransformMakeTranslation(-200, 0)
        
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
            
            //GA
            let analytic = Analytic(category: "Settings", action: "Sound On", value: nil)
            analytic.Analytic_Send()
            
        } else {
            defaults.setBool(false, forKey: "SwitchState")
            
            //GA
            let analytic = Analytic(category: "Settings", action: "Sound Off", value: nil)
            analytic.Analytic_Send()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.4, animations: {
            self.bro.transform = CGAffineTransformMakeTranslation(0, 0)
         //   self.info.transform = CGAffineTransformMakeTranslation(0, 0)
            self.rate.transform = CGAffineTransformMakeTranslation(0, 0)
            self.url.transform = CGAffineTransformMakeTranslation(0, 0)
            self.email.transform = CGAffineTransformMakeTranslation(0, 0)
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
    
    @IBAction func rate_click(sender: AnyObject) {
        //GA
        let analytic = Analytic(category: "Settings", action: "Rate Me Click", value: nil)
        analytic.Analytic_Send()
        
            UIApplication.sharedApplication().openURL(NSURL(string : "https://itunes.apple.com/us/app/apple-store/id1003597505?mt=8")!);
        
    }

    @IBAction func email_click(sender: AnyObject) {
        //GA
        let analytic = Analytic(category: "Settings", action: "Email Click", value: nil)
        analytic.Analytic_Send()
        
        let email = "tre@naturebro.com"
        let url = NSURL(string: "mailto:\(email)")
        UIApplication.sharedApplication().openURL(url!)
    }
    
    @IBAction func url_click(sender: AnyObject) {
        //GA
        let analytic = Analytic(category: "Settings", action: "URL Click", value: nil)
        analytic.Analytic_Send()
        
        UIApplication.sharedApplication().openURL(NSURL(string : "http://www.naturebro.com")!);
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
