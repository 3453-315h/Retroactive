//
//  SearchViewController.swift
//  Retroactive
//

import Cocoa

class AuthenticateViewController: NSViewController {
    @IBOutlet weak var iconView: DisplayOnlyImageView!
    @IBOutlet weak var searchingForLabel: DisplayOnlyTextField!
    @IBOutlet weak var explainationLabel: DisplayOnlyTextField!
    
    static func instantiate() -> AuthenticateViewController {
        return NSStoryboard.main!.instantiateController(withIdentifier: "AuthenticateViewController") as! AuthenticateViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        iconView.updateIcon()
        searchingForLabel.updateToken()
        explainationLabel.updateToken()
    }
    
    @IBAction func authenticateClicked(_ sender: Any) {
        let authenticateStatus = STPrivilegedTask.preAuthenticate()
        if (authenticateStatus == errAuthorizationSuccess) {
            self.navigationController.pushViewController(ProgressViewController.instantiate(), animated: true)
        }
    }
    
    @IBAction func viewSourceClicked(_ sender: Any) {
        AppDelegate.current.viewSource()
    }
    
    
}