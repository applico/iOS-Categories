//
//  String+Additions.swift
//  iOSCategories
//
//  Created by Applico on 6/1/15.
//  Copyright (c) 2015 Applico Inc. All rights reserved.
//

import Foundation

extension String {
    
    static func randomStringOfLength(length: Int) -> String {
        let characterSet = Array("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
        var randomString = String()
        randomString.reserveCapacity(length)
        
        for index in 0...length - 1 {
            randomString.append(characterSet[Int(arc4random_uniform(UInt32(characterSet.count)))])
        }
        
        return randomString
    }

}
