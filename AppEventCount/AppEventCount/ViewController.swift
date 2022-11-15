//
//  ViewController.swift
//  AppEventCount
//
//  Created by Zach on 10/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var didFinishLaunchingLabel: UILabel!
    @IBOutlet weak var configurationForConnectingLabel: UILabel!
    @IBOutlet weak var willConnectToLabel: UILabel!
    @IBOutlet weak var didBecomeActiveLabel: UILabel!
    @IBOutlet weak var willResignActive: UILabel!
    @IBOutlet weak var willEnterForegroundLabel: UILabel!
    @IBOutlet weak var didEnterBackgroundLabel: UILabel!
    
    var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    
    var willConnectToCount = 0
    var didBecomeActiveCount = 0
    var willResignActiveCount = 0
    var willEnterForegroundCount = 0
    var didEnterBackgroundCount = 0
    
    func updateView() {
        didFinishLaunchingLabel.text = "The App has Launched \(appDelegate.launchCount) time(s)"
        configurationForConnectingLabel.text = "the App has Configured \(appDelegate.configurationForConnectingCount) times"
        willConnectToLabel.text = "The App has Connected \(willConnectToCount) times"
        didBecomeActiveLabel.text = " The App has Become Active \(didBecomeActiveCount) times"
        willResignActive.text = "The App Resigned \(willResignActiveCount) times"
        willEnterForegroundLabel.text = "The app entered the Foreground \(willEnterForegroundCount) times"
        didEnterBackgroundLabel.text = "The app entered the Background \(didEnterBackgroundCount) times"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

