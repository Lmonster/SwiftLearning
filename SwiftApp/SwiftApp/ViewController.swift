//
//  ViewController.swift
//  SwiftApp
//
//  Created by lmonster on 15/12/31.
//  Copyright © 2015年 lmonster. All rights reserved.
//

// Swift Learning in Demo Day 1

import UIKit

let RGBColor = {
    (red red:Int,green green:Int,blue blue:Int,alpha alpha:Float) -> UIColor in
    let redValue:Float = Float(red)/Float(255)
    let greenValue:Float = Float(red)/Float(255)
    let blueValue:Float = Float(red)/Float(255)
    return UIColor(colorLiteralRed:redValue,green:greenValue,blue:blueValue,alpha:alpha)
}

class ViewController: UIViewController {
    
    let screenWidth = UIScreen.mainScreen().bounds.size.width
    let screenHeight = UIScreen.mainScreen().bounds.size.height
    let counterWidth = 120
    let counterHeight = 40
    let addButton:UIButton = {
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        let button = UIButton(frame: CGRect(x:screenWidth/2-60, y:screenHeight/2-20 , width: 120, height: 40))
        return button
    }()
    let counterLabel:UILabel = {
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        let label = UILabel(frame: CGRect(x: screenWidth/2-120, y: screenHeight/2-60-120, width: 240, height: 120))
        return label
    }()
    
    var counterNumber = 0 {
        didSet {
            self.counterLabel.text = String(counterNumber)
        }
    }
    
    override func viewDidLoad() {
        self.title = "Counter";
        
        // we can custom navigation bar or hack naviagiton bar in many ways
        // this blog is good explained this http://www.appcoda.com/customize-navigation-status-bar-ios-7/
        
        self.navigationController!.navigationBar.translucent = true
        self.addButton.layer.cornerRadius = 4
        self.addButton.layer.borderColor = UIColor.whiteColor().CGColor
        self.addButton.layer.borderWidth = 1
        self.addButton.setTitle("Counter +1", forState: UIControlState.Normal)
        self.addButton.addTarget(self, action: Selector("addCounter"), forControlEvents: UIControlEvents.TouchUpInside)
        
        let longPressGesture = UILongPressGestureRecognizer()
        longPressGesture.addTarget(self, action: Selector("fastAddCounter"))
        self.addButton.addGestureRecognizer(longPressGesture)
        
        self.view.addSubview(self.addButton)
        
        self.counterLabel.text = "0"
        self.counterLabel.font = UIFont.systemFontOfSize(60)
        self.counterLabel.textColor = UIColor.whiteColor()
        self.counterLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(self.counterLabel)
        
        let titleShadow = NSShadow()
        titleShadow.shadowColor = UIColor.blackColor()
        titleShadow.shadowOffset = CGSizeMake(3, 3)
        titleShadow.shadowBlurRadius = 20
        self.navigationController!.navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName:UIColor.whiteColor(),
            NSShadowAttributeName:titleShadow,
            NSFontAttributeName:UIFont.boldSystemFontOfSize(20)
        ]
        let resetButton = UIBarButtonItem(title: "重置", style: UIBarButtonItemStyle.Plain, target: self, action: "resetCounter")
        self.navigationItem.leftBarButtonItem = resetButton
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
    }
    
    // using selector in Swift way 1
    func addCounter() {
        ++self.counterNumber
    }
    
    // handle long press
    func fastAddCounter() {
        ++self.counterNumber
        print("\(self.counterNumber)\n")
    }
    
    // using selector in Swift way 2 AND @objc seems to be unnecessary
    @objc func resetCounter() {
        self.counterNumber = 0
    }
    
}
