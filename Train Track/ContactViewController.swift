//
//  ContactViewController.swift
//  Train Track
//
//  Created by Andrew Mathena on 6/6/15.
//  Copyright (c) 2015 Andrew Mathena. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var bro: UIImageView!
    @IBOutlet weak var info: UIImageView!
    @IBOutlet weak var thanks: UIImageView!
    
    @IBOutlet weak var tomas_switch: UISwitch!
    @IBOutlet weak var tomas_label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
