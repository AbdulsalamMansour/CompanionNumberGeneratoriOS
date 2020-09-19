
//
//  Alert.swift
//  CompanionNumberGenerator
//
//  Created by Abdulsalam Mansour on 9/18/20.
//  Copyright © 2020 abdulsalam. All rights reserved.
//

import Foundation
import UIKit

struct Alert {
    
    private static func showBasicAlert(on vc: UIViewController, with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.async { vc.present(alert, animated: true) }
    }
    
    
    static func showIncompleteFormAlert(on vc: UIViewController, message: String) {
        showBasicAlert(on: vc, with: "Alert !", message: message)
    }
    
}
