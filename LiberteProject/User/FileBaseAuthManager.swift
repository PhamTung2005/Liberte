//
//  FileBaseAuthManager.swift
//  LiberteProject
//
//  Created by Pham Tung on 10/15/19.
//  Copyright © 2019 Pham Tung. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth

class FireBaseAuthManager {
    
    // tạo tài khoản
    // @escaping để truyền vào hàm một closure như một biến tham số
    func createUser(email: String, password: String, completionBlock: @escaping ((_ success: Bool) -> Void)) {
        Auth.auth().createUser(withEmail: email, password: password) { (userResult, error) in
            if let user = userResult?.user { // kiểm tra userResult.user nếu khác nil thì gán lại vào user
                print(user)
                completionBlock(true)
            } else {
                completionBlock(true)
            }
        }
    }
    
    // Đăng nhập
    func signin(email: String, password: String, completionBlock: @escaping ((_ success: Bool) -> Void)) {
        Auth.auth().signIn(withEmail: email, password: password) { (AuthDataResult, error) in
            if let error = error {
                completionBlock(false)
            } else {
                completionBlock(true)
            }
        }
    }
    
    // Đăng xuất
    func signOut(completionBlock: @escaping ((_ success: Bool) -> Void)) {
        do {
            try Auth.auth().signOut()
            completionBlock(true)
        } catch let signOutError as NSError {
            print("Lỗi: \(signOutError)")
            completionBlock(false)
        }
    }
    
}
