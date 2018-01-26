//
//  HeartHarness.swift
//

import Foundation
import WatchConnectivity

final class HeartHarness: NSObject {
    
    static let instance = HeartHarness()
    
    override private init() {
        super.init()
        
        if WCSession.isSupported() {
            print("WCSession supported")
            let session = WCSession.default
            session.delegate = self
            session.activate()
            
        } else {
            print("WCSession not supported")
        }
    }

}

extension HeartHarness: WCSessionDelegate {
    
    func session(_: WCSession, activationDidCompleteWith state: WCSessionActivationState, error: Error?) {
        print("WCSession activationDidCompleteWith \(state)")
        
        if let error = error {
            print(error.localizedDescription)
        }
    }
    
    func session(_: WCSession, didReceiveMessage message: [String: Any]) {
        print("WCSession didReceiveMessage \(message)")
    }
    
}

