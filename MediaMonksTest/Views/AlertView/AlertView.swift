//
//  AlertView.swift
//  MediaMonksTest
//
//  Created by Miguel Vicario on 07/01/21.
//

import UIKit

public class AlertView {
    static public func showAcceptAlert(title: String, message: String, viewController: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
        viewController.present(alert, animated: true)
    }
}
