//
//  ViewController.swift
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController {
    
    @IBOutlet var installedLabel: UILabel!
    @IBOutlet var reachableLabel: UILabel!
    @IBOutlet var pairedLabel: UILabel!
    @IBOutlet var sessionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateLabels()
        
        let session = WCSession.default
        session.delegate = self
        session.activate()
    }
    
    private func updateLabels() {
        let session = WCSession.default
        
        reachableLabel.text = session.isReachable ? "Reachable" : "Not Reachable"
        installedLabel.text = session.isWatchAppInstalled ? "Installed" : "Not Installed"
        pairedLabel.text = session.isPaired ? "Paired" : "Not Paired"
        
        switch session.activationState {
        case .activated:
            sessionLabel.text = "Activated"
        case .inactive:
            sessionLabel.text = "Inactive"
        case .notActivated:
            sessionLabel.text = "Not Activated"
        }
    }
    
}

extension ViewController: WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {        
        DispatchQueue.main.async {
            self.updateLabels()
        }
    }
    
    func sessionReachabilityDidChange(_ session: WCSession) {
        DispatchQueue.main.async {
            self.updateLabels()
        }
    }
    
    func sessionWatchStateDidChange(_ session: WCSession) {
        DispatchQueue.main.async {
            self.updateLabels()
        }
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        DispatchQueue.main.async {
            self.updateLabels()
        }
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        DispatchQueue.main.async {
            self.updateLabels()
        }
    }
}
