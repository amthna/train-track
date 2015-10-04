//
//  Anal.swift
//  Train Track
//
//  Created by Andrew Mathena on 10/3/15.
//  Copyright © 2015 Andrew Mathena. All rights reserved.
//

import Foundation

class Analytic {
    var category: String
    var action: String
    var value: NSNumber?
    
    init(category: String, action: String, value: NSNumber?) {
        self.category = category
        self.action = action
        self.value = value
    }
    
    func Analytic_Send() {
        let tracker = GAI.sharedInstance().defaultTracker
        tracker.send(GAIDictionaryBuilder.createEventWithCategory(self.category, action: self.action, label: nil, value: self.value).build() as [NSObject : AnyObject])
    }

}