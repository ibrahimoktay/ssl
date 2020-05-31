//
//  Algorithms.swift
//  
//
//  Created by ibrahim oktay on 30.05.2020.
//

import Foundation

enum Algorithm: String {
    
    case rsaEncryption = "rsaEncryption"
    case md2WithRSAEncryption = "md2WithRSAEncryption"
    case md4withRSAEncryption = "md4withRSAEncryption"
    case md5WithRSAEncryption = "md5WithRSAEncryption"
    case sha1_with_rsa_signature = "sha1-with-rsa-signature"
    case rsaOAEPEncryptionSET = "rsaOAEPEncryptionSET"
    case sha256WithRSAEncryption = "sha256WithRSAEncryption"
    case sha384WithRSAEncryption = "sha384WithRSAEncryption"
    case sha512WithRSAEncryption = "sha512WithRSAEncryption"
    case sha224WithRSAEncryption = "sha224WithRSAEncryption"
    case unknown = "Unknown"
    
    init(value: String) {
        switch value {
        case "1.2.840.113549.1.1.1":
            self = .rsaEncryption
        case "1.2.840.113549.1.1.2":
            self = .md2WithRSAEncryption
        case "1.2.840.113549.1.1.3":
            self = .md4withRSAEncryption
        case "1.2.840.113549.1.1.4":
            self = .md5WithRSAEncryption
        case "1.2.840.113549.1.1.5":
            self = .sha1_with_rsa_signature
        case "1.2.840.113549.1.1.6":
            self = .rsaOAEPEncryptionSET
        case "1.2.840.113549.1.1.11":
            self = .sha256WithRSAEncryption
        case "1.2.840.113549.1.1.12":
            self = .sha384WithRSAEncryption
        case "1.2.840.113549.1.1.13":
            self = .sha512WithRSAEncryption
        case "1.2.840.113549.1.1.14":
            self = .sha224WithRSAEncryption
        default:
            self = .unknown
        }
    }
}
