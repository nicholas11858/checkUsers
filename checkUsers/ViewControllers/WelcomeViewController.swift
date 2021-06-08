//
//  WelcomeViewController.swift
//  checkUsers
//
//  Created by user192060 on 5/25/21.
//

import UIKit

class WelcomeViewController: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet weak var welcomeLabel: UILabel!
    // MARK: - Public Properties
    var user: User = User.getEmptyUserData()
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Hello, \(user.login)"
    }
    // MARK: IB Actions
    @IBAction func tappedLogOut() {
        dismiss(animated: true)
    }
}
