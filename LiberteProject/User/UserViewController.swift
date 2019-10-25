//
//  UserViewController.swift
//  LiberteProject
//
//  Created by Pham Tung on 9/24/19.
//  Copyright © 2019 Pham Tung. All rights reserved.
//

import UIKit
import Firebase

enum Account {
    case Login
    case Register
}

class UserViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    var isState: Account = Account.Login
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Liberté"
        
    }

    @IBAction func signIn(_ sender: Any) {
        if isState == Account.Login {
            print("Login")
            let signinManager = FireBaseAuthManager()
            if let email = emailTextField.text, let password = passwordTextField.text {
                signinManager.signin(email: email, password: password) { [weak self] (success) in
                    guard let strongSelf = self else {return}
                    var message: String = ""
                    if success {
                        // tạo biến userDefault để lưu trạng thái login xuống bộ nhớ máy
                        let userDefault = UserDefaults.standard
                        userDefault.set(true, forKey: "login") // UserDefault phân biệt với nhau bởi forKey
                        
                        let infoVC = UserInfo()
                        let navigation = UINavigationController(rootViewController: infoVC)
                        strongSelf.present(navigation, animated: true, completion: nil)
                    } else {
                        message = "Email hoặc password không đúng"
                    }
                    
                    AlertHelper.showAlert(message: message, viewController: strongSelf)
                }
            }
        } else {
            print("Register")
            let registerManager = FireBaseAuthManager()
            if let email = emailTextField.text, let password = passwordTextField.text {
                registerManager.createUser(email: email, password: password) { [weak self] (status) in
                    guard let strongSelf = self else {return}
                    var message: String = ""
                    if status {
                        message = "Tạo tài khoản thành công"
                        strongSelf.isState = Account.Login
                        strongSelf.changeUI(strongSelf.isState)
                    } else {
                        message = "Lỗi khi tạo tài khoản"
                    }
                    
                    AlertHelper.showAlert(message: message, viewController: strongSelf)
                }
            }
        }
    }
    
    @IBAction func signUp(_ sender: Any) {
        if isState == Account.Login {
            isState = Account.Register
            changeUI(isState)
        } else {
            isState = Account.Login
            changeUI(isState)
            
        }
    }
    
    func changeUI(_ isState: Account) {
        if isState == Account.Register {
            loginButton.setTitle("Đăng ký", for: .normal)
            registerButton.setTitle("Đã có tài khoản? Đăng nhập", for: .normal)
        } else {
            loginButton.setTitle("Đăng nhập", for: .normal)
            registerButton.setTitle("Chưa có tài khoản? Đăng ký", for: .normal)
        }
    }
    
}
