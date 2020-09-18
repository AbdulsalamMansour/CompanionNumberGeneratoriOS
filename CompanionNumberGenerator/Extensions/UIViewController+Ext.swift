//
//  UIViewController+Ext.swift
//  CompanionNumberGenerator
//
//  Created by Abdulsalam Mansour on 9/18/20.
//  Copyright © 2020 abdulsalam. All rights reserved.
//

import UIKit

fileprivate var indicatorContainer : UIView?

extension UIViewController {
    
    func showSpinner(){
        indicatorContainer = UIView(frame: self.view.bounds)
        indicatorContainer?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = indicatorContainer!.center
        activityIndicator.startAnimating()
        indicatorContainer?.addSubview(activityIndicator)
        self.view.addSubview(indicatorContainer!)
    }
    
    func removeSpinner(){
        indicatorContainer?.removeFromSuperview()
        indicatorContainer = nil
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
