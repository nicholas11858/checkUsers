//
//  UserInfoViewController.swift
//  checkUsers
//
//  Created by NIKOLAY OSIPOV on 29.05.2021.
//

import UIKit

class UserInfoViewController: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var hobbyLabel: UILabel!
    // MARK: - Public Properties
    var user: User = User.getEmptyUserData()
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        nameLabel.text = user.person.name
        surnameLabel.text = user.person.surname
        hobbyLabel.text = user.person.hobby
    }
}
