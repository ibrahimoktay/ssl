//
//  UtilityTests.swift
//  
//
//  Created by ibrahim oktay on 3.06.2020.
//

import XCTest
@testable import SSLCore

final class UtilityTests: XCTestCase {}

extension UtilityTests {
    
    func testCalculatePublicKeySha256Hash() {
        let data = Data(base64Encoded: "MIIBCgKCAQEAuzK00Niemp6MeSlMK6jvXEPUkzuUeP8wVMcbyOUvG5nNEI1nyFQMB1rk9AZ/x9aEtCzNLU5EJgEa6je+7/THFQfDFkxrJhkJ0v9ZEERbiomBlB3+4l+aX4o22LDpH2+AIlSsrClDVVLYFb6SaHuUVlEY0KfVw1pHqNg8xh1y3AQ2nazPFSwuh9fw/Ul3Va7sSqnbiykeNWf+nZUg3XmNYAp4c9wodaWG3zH7Ewk2psPgLUbcJSt29q30x334aMI7szNeVCrfm66/3BAZQI0E72vK7rWFPSvTjYJfqRtruwb+deg8JjcvMc/cDo03jqXodDPTf3sKvHIG0fOyxWsYtQIDAQAB")
        let hash = Utility.calculatePublicKeySha256Hash(data: data)
        XCTAssertEqual(hash, "4PhpWPCTGkqmmjRFussirzvNSi4LjL7WWhUSAVFIXDc=")
    }
    
    func testCalculatePublicKeySha256HashNil() {
        let hash = Utility.calculatePublicKeySha256Hash(data: nil)
        XCTAssertNil(hash)
    }
    
    func testCalculateSha1Fingerprint() {
        let data = "this is test".data(using: .utf8)
        let hash = Utility.calculateSha1Fingerprint(data: data!)
        XCTAssertEqual(hash, "B6 79 4B 20 00 D9 4D 34 82 03 D0 27 9C 2E 73 22 B9 22 CB 16 ")
    }
    
    func testCalculateSha1FingerprintNotNil() {
        let data = "something".data(using: .utf8)
        let hash = Utility.calculateSha1Fingerprint(data: data!)
        XCTAssertNotNil(hash)
    }
}
