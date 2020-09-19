//
//  String+Ext.swift
//  CompanionNumberGenerator
//
//  Created by Abdulsalam Mansour on 9/18/20.
//  Copyright © 2020 abdulsalam. All rights reserved.
//

import Foundation
extension String {
    func changeToEnglishNumber()->String{
        var NumberStr: String = self
        NumberStr = NumberStr.replacingOccurrences(of: "٠", with: "0", options: .literal, range: nil)
        NumberStr = NumberStr.replacingOccurrences(of: "١", with: "1", options: .literal, range: nil)
        NumberStr = NumberStr.replacingOccurrences(of: "٢", with: "2", options: .literal, range: nil)
        NumberStr = NumberStr.replacingOccurrences(of: "٣", with: "3", options: .literal, range: nil)
        NumberStr = NumberStr.replacingOccurrences(of: "٤", with: "4", options: .literal, range: nil)
        NumberStr = NumberStr.replacingOccurrences(of: "٥", with: "5", options: .literal, range: nil)
        NumberStr = NumberStr.replacingOccurrences(of: "٦", with: "6", options: .literal, range: nil)
        NumberStr = NumberStr.replacingOccurrences(of: "٧", with: "7", options: .literal, range: nil)
        NumberStr = NumberStr.replacingOccurrences(of: "٨", with: "8", options: .literal, range: nil)
        NumberStr = NumberStr.replacingOccurrences(of: "٩", with: "9", options: .literal, range: nil)
        return NumberStr
    }
}
