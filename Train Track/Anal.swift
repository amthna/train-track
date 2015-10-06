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
    var label: String?
    
    init(category: String, action: String, label: String?) {
        self.category = category
        self.action = action
        self.label = label
    }
    
    func Analytic_Send() {
        let tracker = GAI.sharedInstance().defaultTracker
        tracker.send(GAIDictionaryBuilder.createEventWithCategory(self.category, action: self.action, label: self.label, value: nil).build() as [NSObject : AnyObject])
    }

}