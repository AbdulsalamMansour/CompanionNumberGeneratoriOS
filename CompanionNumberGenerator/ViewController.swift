//
//  ViewController.swift
//  CompanionNumberGenerator
//
//  Created by Abdulsalam Mansour on 9/18/20.
//  Copyright © 2020 abdulsalam. All rights reserved.
//

import UIKit
import Contacts
class ViewController: UIViewController {
    
    @IBOutlet weak var mobileNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
    }
    
    @IBAction func onInserNumberClick(_ sender: Any) {
        
        let insertedNumber = mobileNumberTextField.text!.changeToEnglishNumber()
        
        if insertedNumber.isEmpty {
            Alert.showAlert(on: self, message: ErrorMessages.inserMobileNumber)
            
        } else if insertedNumber.count == 10 || insertedNumber.count == 13 || insertedNumber.count == 14 {
            validateNumberAndCallGenerator(insertedNumber: insertedNumber)
            
        } else {
            Alert.showAlert(on: self, message: ErrorMessages.insertValidMobileNumber)
        }
    }
    
    func validateNumberAndCallGenerator(insertedNumber: String){
        
        switch insertedNumber.count {
        case 10:
            if insertedNumber.starts(with: "05"){
                self.showSpinner()
                generateAndStoreNumbers(insertedNumber: "+97\(insertedNumber)")
            } else {
                Alert.showAlert(on: self, message: ErrorMessages.insertValidMobileNumber)
            }
            
        case 13:
            if insertedNumber.starts(with: "+97059"){
                showSpinner()
                generateAndStoreNumbers(insertedNumber: insertedNumber)
            } else {
                Alert.showAlert(on: self, message: ErrorMessages.insertValidMobileNumber)
            }
            
        case 14:
            if insertedNumber.starts(with: "0097059"){
                showSpinner()
                generateAndStoreNumbers(insertedNumber: "+\(insertedNumber.dropFirst(2))")
            } else {
                Alert.showAlert(on: self, message: ErrorMessages.insertValidMobileNumber)
            }
            
        default:
            Alert.showAlert(on: self, message: ErrorMessages.insertValidMobileNumber)
        }
        
    }
    
    func generateAndStoreNumbers(insertedNumber: String){
        
        DispatchQueue.global(qos: .background).async {
            let store = CNContactStore()
            let saveRequest = CNSaveRequest()
            
            let prefix = insertedNumber.dropLast(3)
            for suffix in 1...1000 {
                let contact = CNMutableContact()
                contact.familyName = "\(prefix)\(String(format: "%03d", suffix))"
                contact.phoneNumbers = [CNLabeledValue(
                    label: CNLabelPhoneNumberiPhone,
                    value: CNPhoneNumber(stringValue: "\(prefix)\(String(format: "%03d", suffix))"))]
                saveRequest.add(contact, toContainerWithIdentifier: nil)
            }
            
            do {
                try store.execute(saveRequest)
                DispatchQueue.main.async {
                    Alert.showAlert(on: self, message: ErrorMessages.contactsStored)
                }
            } catch {
                DispatchQueue.main.async {
                    Alert.showAlert(on: self, message: "Saving contact failed, error: \(error)")
                }
            }
            
            DispatchQueue.main.async {
                self.removeSpinner()
            }
        }
    }
    
}
