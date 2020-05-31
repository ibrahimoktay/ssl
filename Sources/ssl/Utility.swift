//
//  Utility.swift
//  
//
//  Created by ibrahim oktay on 30.05.2020.
//

import Foundation
import CryptoKit

struct Utility {

    private static let rsa2048Asn1Header: [UInt8] = [
      0x30, 0x82, 0x01, 0x22, 0x30, 0x0d, 0x06, 0x09, 0x2a, 0x86, 0x48, 0x86,
      0xf7, 0x0d, 0x01, 0x01, 0x01, 0x05, 0x00, 0x03, 0x82, 0x01, 0x0f, 0x00
    ]
    
    @available(OSX 10.15, *)
    static func calculatePublicKeySha256Hash(data: Data?) -> String? {
        guard let data = data else {
            return nil
        }
        // Add ASN1 header
        var keyWithHeader = Data(rsa2048Asn1Header)
        keyWithHeader.append(data)
        return Data(SHA256.hash(data: keyWithHeader)).base64EncodedString()
    }
    
    @available(OSX 10.15, *)
    static func calculateSha1Fingerprint(data: Data) -> String? {
        let digest = Insecure.SHA1.hash(data: data)
        let fingerprint = digest.makeIterator().map { String(format: "%02X ", $0) }.joined()
        return fingerprint
    }
}

