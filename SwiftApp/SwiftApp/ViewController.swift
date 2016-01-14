//
//  ViewController.swift
//  SwiftApp
//
//  Created by lmonster on 15/12/31.
//  Copyright © 2015年 lmonster. All rights reserved.
//

// Swift Learning in Demo Day 2

//* iAD(it's a way to earn money especially for individual developers)
//  ******************************************************************
//  before we use iAd ,we need to impot iAd module (module is the same 
//  as framework).
//  
//  It provides two class to display ads:
//  1.ADBannerView
//  2.ADInterstitialAd
//
//  We use ADBannerView to show view or ADInterstitialAd to manage ads
//  and show id.
//
//  !!Attention:
//  ADInterstitialAd is not a view object.
//  ******************************************************************

import UIKit
import iAd

let ScreenWidth = UIScreen.mainScreen().bounds.size.width
let ScreenHeight = UIScreen.mainScreen().bounds.size.height

class ViewController: UIViewController,ADBannerViewDelegate,ADInterstitialAdDelegate {
    
    override func viewDidLoad() {
        self.title = "iAD";
        
        // This is the view that provide the ads.
        // we can select view type through ADAdType enum(it has tow type now--banner,mediumRectanle)
        let adBanner = ADBannerView(adType: ADAdType.Banner)
        adBanner.frame.origin = CGPoint(x: 0, y: ScreenHeight - 50)
        adBanner.delegate = self;
        self.view.addSubview(adBanner)
        
        let adInterstitialAd = ADInterstitialAd()
        adInterstitialAd.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = UIColor(white: 0.8, alpha: 1.0)
    }
    
    
    // ADBanner delegate
    func bannerViewWillLoadAd(banner: ADBannerView!) {
    }
    
    func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
        return true
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
    }
    
    // ADInterititial delegate
    func interstitialAdActionDidFinish(interstitialAd: ADInterstitialAd!) {
        print("interstitialad load finish")
    }
    
    func interstitialAdDidUnload(interstitialAd: ADInterstitialAd!) {
        interstitialAd.presentInView(self.view)
    }
    
    func interstitialAd(interstitialAd: ADInterstitialAd!, didFailWithError error: NSError!) {
        print(error)
    }
}
