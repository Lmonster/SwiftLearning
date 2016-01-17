//
//  ViewController.swift
//  SwiftApp
//
//  Created by lmonster on 15/12/31.
//  Copyright © 2015年 lmonster. All rights reserved.
//

// Swift Learning in Demo Day 3

// ***************************************************************
//
// the class created by coder doesn't need to be import. 
// The compiler does all the work for you
// !Attention: after you change the name of the class or file name
// the compiler won't aysnc it immediately unless you restart Xcode
//
// ***************************************************************

import UIKit

let ScreenWidth = UIScreen.mainScreen().bounds.size.width
let ScreenHeight = UIScreen.mainScreen().bounds.size.height
let rgbColor = {(colorValue:Int) -> UIColor
    in
    let blue = Float(colorValue & 0xff) / 255.0
    let green = Float((colorValue >> 8) & 0xff) / 255.0
    let red = Float((colorValue >> 16) & 0xff) / 255.0
    return UIColor(colorLiteralRed: red, green:green, blue:blue,alpha:1)
}

class ViewController: UIViewController {
    
    private let numberLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: (ScreenWidth - 120) / 2, y: 120, width: 240, height: 120))
        return label
    } ()
    
    private let slider: UISlider = {
        let sliderView = UISlider(frame: CGRect(x: 120, y: 240, width: 240, height: 20))
        return sliderView
    } ()
    
    private let textField: UITextField = {
        let temp = UITextField(frame: CGRect(x: 120, y: 65, width: 240, height: 120))
        return temp
    } ()
    
    
    override func viewDidLoad() {
        
        self.title = "UISlider and UITextView"
        
        self.view.addSubview(numberLabel)
        numberLabel.textColor = UIColor.blackColor()
        numberLabel.font = UIFont.systemFontOfSize(50)
        
        self.view.addSubview(slider)
        slider.addTarget(self, action: "sliderValueChanged:", forControlEvents: UIControlEvents.ValueChanged)
        
        // slider value
        slider.maximumValue = 100
        slider.minimumValue = 0
        
        // tint of tracks
        slider.minimumTrackTintColor = rgbColor(0xf1c40f)
        slider.maximumTrackTintColor = rgbColor(0x95a5a6)
        
        self.view.addSubview(self.textField)
        self.textField.layer.cornerRadius = 5
        self.textField.layer.borderWidth = 2
        self.textField.layer.borderColor = UIColor(white: 0.5, alpha: 1).CGColor
        self.textField.font = UIFont.systemFontOfSize(30)
        self.textField.text = "0$"
        
        let view: keyboardView = keyboardView()
        view.frame = CGRect(x: 0, y: 0, width: 320, height: 30)
        view.backgroundColor = UIColor.orangeColor()
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 120, height: 30))
        label.text = "this input accessory view"
        label.sizeToFit()
        view.addSubview(label)
        self.textField.inputAccessoryView = view
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.backgroundColor = UIColor(white: 0.9, alpha: 1)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.textField.resignFirstResponder()
    }
    
    func sliderValueChanged (aSlider: UISlider!) {
        self.textField.text = "\(aSlider.value)$"
    }
}
