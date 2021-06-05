//
//  ErrorMsg.swift
//  ErrorHandling
//
//  Created by Gurjinder Singh on 05/06/21.
//

import Foundation
import UIKit

protocol Alert {
    func showAlert(title: String,message: String)->UIAlertController
}

extension Alert where Self: UIViewController {
    func showAlert(title: String,message: String)->UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionCancel = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(actionCancel)
        return alertController
    }
}

enum UserDetailError: Error{
    case noValidName(minChar: Int)
    case noValidAge
    case unexpected(code: Int)
}

extension UserDetailError {
    var description: String {
        switch self {
        case .noValidAge:
            return "Age must me greater than 18"
        case .noValidName(let minChar):
            return "Name must be min of \(minChar) char"
        case .unexpected(let code):
            return "Unexpected error code \(code)"
        }
    }
}

extension UserDetailError {
    var isFatal: Bool {
        if case UserDetailError.unexpected = self {
            return true
        } else {
            return false
        }
    }
}
