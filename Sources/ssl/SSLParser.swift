//
//  SSLParser.swift
//  
//
//  Created by ibrahim oktay on 30.05.2020.
//

import Foundation

enum ParseError: Error {
    case trustIsEmpty
    case copyCertificateValues
    case copyPublicKey
    case publicKeyRepresentation
}

@available(OSX 10.15, *)
struct SSLParser {
    
    static func parse(_ certificate: SecCertificate) throws -> SSLCertificateInfo {
        var info = SSLCertificateInfo()
        
        var commonName: CFString?
        SecCertificateCopyCommonName(certificate, &commonName)
        info.commonName = commonName.string
        
        var email: CFArray?
        SecCertificateCopyEmailAddresses(certificate, &email)
        info.emails = email.array
        
        
        var error: Unmanaged<CFError>?
        guard let dict = SecCertificateCopyValues(certificate, nil, &error) as? [CFString: [CFString: AnyObject]] else {
            throw ParseError.copyCertificateValues
        }

        try parseHash(certificate, info: &info)
        info.validFrom = SSLCertificateInfo.parseDate(from: dict, for: kSecOIDX509V1ValidityNotBefore)?.string
        info.validUntil = SSLCertificateInfo.parseDate(from: dict, for: kSecOIDX509V1ValidityNotAfter)?.string

        info.subjectSummary = SSLCertificateInfo.parseValue(from: dict, for: kSecOIDX509V1SubjectName)
        info.serialNumber = SSLCertificateInfo.parseValue(from: dict, for: kSecOIDX509V1SerialNumber)
        info.signature = SSLCertificateInfo.parseValue(from: dict, for: kSecOIDX509V1Signature)
        info.signatureAlgorithm = SSLCertificateInfo.parseValue(from: dict, for: kSecOIDX509V1SignatureAlgorithm)
        info.publicKeyAlgorithm = SSLCertificateInfo.parseValue(from: dict, for: kSecOIDX509V1SubjectPublicKeyAlgorithm)
        info.dnsNames = SSLCertificateInfo.parseValue(from: dict, for: "DNSNAMES" as CFString)
        
        return info
    }
    
    static func parse(_ secTrust: SecTrust?) throws -> [SSLCertificateInfo] {
        guard let trust = secTrust else {
            throw ParseError.trustIsEmpty
        }
        
        var certificateInfos = [SSLCertificateInfo]()
        for index in 0..<SecTrustGetCertificateCount(trust) {
            if let certificate = SecTrustGetCertificateAtIndex(trust, index) {
                let certificateInfo = try parse(certificate)
                certificateInfos.append(certificateInfo)
            }
        }
        
        return certificateInfos
    }
    
    static func parseHash(_ certificate: SecCertificate, info: inout SSLCertificateInfo) throws {
        var key: SecKey?
        key = SecCertificateCopyKey(certificate)
        
        guard let publicKey = key else {
            throw ParseError.copyPublicKey
        }
        
        var error: Unmanaged<CFError>?
        let cfdata = SecKeyCopyExternalRepresentation(publicKey, &error)
        if let data = cfdata.data {
            let base64Key = data.base64EncodedString()
            info.publicKey = base64Key
            info.publicKeySha256 = Utility.calculatePublicKeySha256Hash(data: data)
        } else {
            throw ParseError.publicKeyRepresentation
        }
        
        let data = SecCertificateCopyData(certificate) as Data
        info.fingerPrintSha1 = Utility.calculateSha1Fingerprint(data: data)
    }
}
