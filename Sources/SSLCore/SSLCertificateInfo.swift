//
//  SSLCertificateInfo.swift
//  
//
//  Created by ibrahim oktay on 30.05.2020.
//

import Foundation

public struct SSLCertificateInfo {
    var subjectSummary: String!
    var fingerPrintSha1: String!
    var publicKeySha256: String!
    var publicKey: String!

    var commonName: String!
    var emails: [String]!
    var dnsNames: String!
    var serialNumber: String!
    var validFrom: String!
    var validUntil: String!
    var publicKeyAlgorithm: String!
    var signature: String!
    var signatureAlgorithm: String!
}

extension SSLCertificateInfo {
    
    static func parseValue(from dict: [CFString: [CFString: AnyObject]], for key: CFString) -> String? {
        guard dict[key]?[kSecPropertyKeyType] != nil else {
            return nil
        }
        let type: CFString = dict[key]?[kSecPropertyKeyType] as! CFString
 
        if type == kSecPropertyTypeData {
            let cfdata = dict[key]?[kSecPropertyKeyValue] as! CFData
            let data = cfdata as Data
            let str = data.map { String(format: "%02X ", $0) }.joined()
            return str
        } else if type == kSecPropertyTypeSection {
            let value = dict[key]?[kSecPropertyKeyValue] as? [[CFString: String]]
            if key == kSecOIDX509V1SubjectName {
                let summary = value?.compactMap{ $0[kSecPropertyKeyValue] ?? "" }.joined(separator: ",  ")
                return summary
            } else if key == kSecOIDX509V1SignatureAlgorithm || key == kSecOIDX509V1SubjectPublicKeyAlgorithm{
                let algorithmValue = value?[0][kSecPropertyKeyValue] ?? ""
                return Algorithm(value: algorithmValue).rawValue
            }
            return nil
        } else if type == kSecPropertyTypeArray {
            let cfarray = dict[key]?[kSecPropertyKeyValue] as! CFArray
            let value = cfarray as? [String]
            if value == nil {
                return nil
            }
            return value!.joined(separator: ",  ")
        }
        
        return dict[key]?[kSecPropertyKeyValue] as? String
    }
    
    static func parseDate(from dict: [CFString: [CFString: AnyObject]], for key: CFString) -> Date? {
        let value = dict[key]?[kSecPropertyKeyValue]
        guard let time = (value as? NSNumber)?.doubleValue else {
            return nil
        }
        return Date(timeIntervalSinceReferenceDate: time)
    }
    
}
