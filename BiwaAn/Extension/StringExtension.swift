//
//  String.swift
//  GoCheap
//
//  Created by Mdt on 8/18/20.
//

import Foundation
import UIKit

extension String {
    
    func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    func escape() -> String {
        let allowedCharacters = self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        return allowedCharacters
    }
    
    //Converts String to Int
    public func toInt() -> Int {
        if let num = NumberFormatter().number(from: self) {
            return num.intValue
        } else {
            return 0
        }
    }
    
    func sizeOfText(_ font: UIFont) -> CGSize {
        return self.size(withAttributes: [NSAttributedString.Key.font: font])
    }
    
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self, options: Data.Base64DecodingOptions(rawValue: 0)) else {
            return nil
        }
        
        return String(data: data as Data, encoding: String.Encoding.utf8)
    }
    
    func toBase64() -> String? {
        guard let data = self.data(using: String.Encoding.utf8) else {
            return nil
        }
        
        return data.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
    }
    
    var asData: Data? {
        data(using: .utf8)
    }
    
    func asData(_ encoding: String.Encoding) -> Data? {
        data(using: encoding)
    }
}

extension Int {
    //Converts Int to String
    public func toString() -> String {
        return "\(self)"
    }
}

extension Optional {
    func asStringOrEmpty() -> String {
        switch self {
        case .some(let value):
            return String(describing: value)
        case _:
            return ""
        }
    }
    
    func asStringOrNilText() -> String {
        switch self {
        case .some(let value):
            return String(describing: value)
        case _:
            return "(nil)"
        }
    }
    
    func asIntOrEmpty() -> String {
        switch self {
        case .some(let value):
            return String(describing: value)
        case _:
            return "0"
        }
    }
}

extension Data {
    var asString: String {
        return String(data: self, encoding: .utf8) ?? ""
    }
}
