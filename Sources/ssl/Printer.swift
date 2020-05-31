//
//  Printer.swift
//  
//
//  Created by ibrahim oktay on 31.05.2020.
//

import Foundation

struct Printer {
    
    static func printc(_ certificates: [SSLCertificateInfo]) {
        for cert in certificates {
            print("------------------------------------------------------------")
            if cert.commonName != nil {
                print("Common Name: \(cert.commonName!)")
            }
            if cert.fingerPrintSha1 != nil {
                print("Fingerprint SHA-1: \(cert.fingerPrintSha1!)")
            }
            if cert.publicKeySha256 != nil {
                print("Public key SHA-256: \(cert.publicKeySha256!)")
            }
            if cert.dnsNames != nil {
                print("DNS Name: \(cert.dnsNames!)")
            }
            if cert.emails != nil && cert.emails.count > 0 {
                print("Emails: \(cert.emails.joined(separator: ", "))")
            }
            if cert.validFrom != nil {
                print("Valid from: \(cert.validFrom!)")
            }
            if cert.validUntil != nil {
                print("Valid until: \(cert.validUntil!)")
            }
            if cert.subjectSummary != nil {
                print("Summary: \(cert.subjectSummary!)")
            }
            if cert.serialNumber != nil {
                print("Serial Number: \(cert.serialNumber!)")
            }
            if cert.publicKeyAlgorithm != nil {
                print()
                print("Public Key Algorithm: \(cert.publicKeyAlgorithm!)")
            }
            if cert.publicKey != nil {
                print("-----BEGIN PUBLIC KEY-----")
                print(cert.publicKey!)
                print("-----END PUBLIC KEY-----")
            }
            if cert.signatureAlgorithm != nil {
                print()
                print("Signature Algorithm: \(cert.signatureAlgorithm!)")
            }
            if cert.signature != nil {
                print("-----BEGIN SIGNATURE-----")
                print(cert.signature!)
                print("-----END SIGNATURE-----")
            }
            print()
        }
    }
}
