//
//  BugFactory.swift
//  SoManyBugs
//
//  Created by Jarrod Parkes on 4/17/15.
//  Copyright (c) 2015 Jarrod Parkes. All rights reserved.
//

import UIKit
import Foundation

class BugFactory {
        
    static let bugTints = [UIColor.blackColor(), UIColor.lightBlueColor(), UIColor.redColor(), UIColor.darkGreenColor()]
    static let shakeRotations = [M_PI/16, M_PI/8, M_PI/8, M_PI/24]
    static let shakeDurations = [0.3, 3.0, 0.1, 0.5]
    static let bugSize = CGSize(width: 128, height: 128)
    
    enum BugType: Int {
        case Basic, Slow, Fast, Smooth
    }
    
    var currentBugType = BugType.Basic
    
    func createBug() -> UIImageView {
        let bug = UIImageView(frame: CGRect(x: -100, y: -100, width: 128, height: 128))
        bug.image = UIImage(named: "spider")
        bug.tintColor = BugFactory.bugTints[currentBugType.rawValue]
        
        // add shake animation
        let shakeAnimation = CABasicAnimation(keyPath: "transform.rotation")
        shakeAnimation.toValue = 0.0
        shakeAnimation.fromValue = BugFactory.shakeRotations[currentBugType.rawValue]
        shakeAnimation.duration = BugFactory.shakeDurations[currentBugType.rawValue]
        shakeAnimation.repeatCount = Float.infinity
        shakeAnimation.autoreverses = true
        shakeAnimation.removedOnCompletion = false
        bug.layer.addAnimation(shakeAnimation, forKey: "shake")
        
        return bug
    }
    
    // MARK: - Shared Instance
    
    class func sharedInstance() -> BugFactory {
        
        struct Singleton {
            static var sharedInstance = BugFactory()
        }
        
        return Singleton.sharedInstance
    }
}