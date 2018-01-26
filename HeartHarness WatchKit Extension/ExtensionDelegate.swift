//
//  ExtensionDelegate.swift
//

import WatchKit

class ExtensionDelegate: NSObject, WKExtensionDelegate {

    func applicationDidFinishLaunching() {
        let _ = HeartHarness.instance
    }

}
