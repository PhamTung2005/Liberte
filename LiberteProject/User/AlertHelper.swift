//
//  AlertHelper.swift
//  LiberteProject
//
//  Created by Pham Tung on 10/15/19.
//  Copyright © 2019 Pham Tung. All rights reserved.
//

import Foundation
import UIKit

class AlertHelper {
    static func showAlert(message: String, viewController: UIViewController?) {
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        let alertController = UIAlertController(title: "Thông báo", message: message, preferredStyle: .alert)
        alertController.addAction(alertAction)
        viewController?.present(alertController, animated: true, completion: nil)
    }
}
