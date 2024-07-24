//
//  UIViewController+Ext.swift
//  GHFollowers
//
//  Created by Mostafa Hosseini on 7/24/24.
//

import UIKit

extension UIViewController {
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(alertTitle: title, message: message, buttionTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            // fades in
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
