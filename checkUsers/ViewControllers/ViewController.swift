//
//  ViewController.swift
//  checkUsers
//
//  Created by user192060 on 5/25/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    // MARK: - IB Outlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    // MARK: - Piblic Properties
    var user: User = User.getEmptyUserData()
    // MARK: - Private Properties
    private var users = User.getUserData()
    // MARK: Life Cycles Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.text = ""
        passwordTextField.text = ""
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let access = checkUser(username: usernameTextField.text!, password: passwordTextField.text!, users: users)
        
        if access {
            guard let tabBarController = segue.destination as? UITabBarController
            else { return }
            let viewControllers  = tabBarController.viewControllers
            
            for viewController in viewControllers! {
                if let welcomeVC = viewController as? WelcomeViewController {
                    welcomeVC.user = user
                } else if let userInfoVC = viewController as? UserInfoViewController {
                    userInfoVC.user = user
                }
            }
        } else {
            createAlert(
                title: "Error",
                message: "Login or password is incorrect"
            )
        }
    }
    
    // MARK: - IB Actions
    @IBAction func tappedForgetUsernameButton() {
        createAlert(title: "Reminder", message: "It's impossible! I know millions of logins.")
    }
    
    @IBAction func tappedForgetPassword() {
        let username = usernameTextField.text!
        forgetPassword(user: username, users: users)
}

    @IBAction func Unwind(for segue: UIStoryboardSegue) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    // MARK: - Public Methods
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == usernameTextField {
            usernameTextField.returnKeyType = .next
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.returnKeyType = .done
            passwordTextField.becomeFirstResponder()
        }
        
        if textField == passwordTextField {
            usernameTextField.becomeFirstResponder()
            self.performSegue(withIdentifier: "presentWelcome", sender: self)
        }
        return true
    }
    // MARK: - Private Methods
    private func forgetPassword(user: String, users: [User]) {
        for people in users {
            if people.login == user  {
                createAlert(
                    title: "Reminder",
                    message: "Your password is \(people.password)"
                )
            } else {
                createAlert(
                    title: "Error",
                    message: "Login is incorrect"
                )
            }
        }
    }
    
    private func checkUser(username: String, password: String, users: [User]) -> Bool {
        for people in users {
            if people.login == username && people.password == password {
                user = User(login: people.login, password: people.password, person: people.person)
                return true
            }
        }
        return false
    }
    
    private func createAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertController.Style.alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
