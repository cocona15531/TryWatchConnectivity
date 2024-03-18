//
//  ViewController.swift
//  TryWatchConnectivity
//
//  Created by Issei Ueda on 2024/03/17.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController {
    
    var session: WCSession?
    @IBOutlet weak var StateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if WCSession.isSupported() {
            session = WCSession.default
            session?.delegate = self
            session?.activate()
        }
    }
    
    @IBAction func CheckButton(_ sender: Any) {
    }
    
}

//MARK: - WCSessionDelegate

extension ViewController: WCSessionDelegate {
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            self.StateLabel.text = "接続されました"
        }
        print("didReceiveMessage")
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        if let error = error {
            print(error.localizedDescription)
        } else {
            print("The session has completed activation.")
        }
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("sessionDidBecomeInactive")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        print("sessionDidDeactivate")
    }
}

