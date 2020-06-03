//
//  Extension.swift
//  
//
//  Created by ibrahim oktay on 30.05.2020.
//

import Foundation

extension Optional where Wrapped == CFString {
    
    var string: String? {
        return self as String?
    }
}

extension Optional where Wrapped == CFArray {
    
    var array: [String]? {
        return self as? [String]
    }
}

extension Optional where Wrapped == CFData {
    
    var data: Data? {
        return self as Data?
    }
}

extension Date {
    var string: String {
        let formatter = DateFormatter()
        formatter.dateFormat =  "d MMM y"
        return formatter.string(from: self)
    }
}
