//
//  ViewController.swift
//  CompanionNumberGenerator
//
//  Created by Abdulsalam Mansour on 9/18/20.
//  Copyright © 2020 abdulsalam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mobileNumberTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }

    @IBAction func onInserNumberClick(_ sender: Any) {
        print(mobileNumberTextField.text)
    }
    
}

