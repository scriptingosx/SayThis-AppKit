//
//  AppDelegate.swift
//  SayThis
//
//  Created by Armin on 22/04/16.
//  Copyright © 2016 Armin. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var sayThisTextField: NSTextField!
    @IBOutlet weak var sayProgress: NSProgressIndicator!
    @IBOutlet weak var voicePopup: NSPopUpButton!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @IBAction func talk(_ sender: NSButton) {
        let path = "/usr/bin/say"
        let textToSay = sayThisTextField.stringValue

        var arguments = [textToSay]
        
        if let voice = voicePopup.titleOfSelectedItem {
            arguments += ["-v", voice]
        }
        
        sender.isEnabled = false
        sayProgress.startAnimation(self)
        
        let task = Process.launchedProcess(launchPath: path, arguments: arguments)
        task.waitUntilExit()
        
        sender.isEnabled = true
        sayProgress.stopAnimation(self)
    }

}

