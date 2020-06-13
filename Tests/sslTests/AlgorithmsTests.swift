//
//  AlgorithmsTests.swift
//  
//
//  Created by ibrahim oktay on 13.06.2020.
//

import XCTest
@testable import SSLCore

final class AlgorithmsTests: XCTestCase {}

extension AlgorithmsTests {
    
    func testRsaEncryption() {
        let value = Algorithm(value: "1.2.840.113549.1.1.1")
        XCTAssertEqual(value, Algorithm.rsaEncryption)
    }

    func testMd2WithRSAEncryption() {
        let value = Algorithm(value: "1.2.840.113549.1.1.2")
        XCTAssertEqual(value, Algorithm.md2WithRSAEncryption)
    }
    
    func testMd4withRSAEncryption() {
        let value = Algorithm(value: "1.2.840.113549.1.1.3")
        XCTAssertEqual(value, Algorithm.md4withRSAEncryption)
    }
    
    func testMd5WithRSAEncryption() {
        let value = Algorithm(value: "1.2.840.113549.1.1.4")
        XCTAssertEqual(value, Algorithm.md5WithRSAEncryption)
    }
    
    func testSha1_with_rsa_signature() {
        let value = Algorithm(value: "1.2.840.113549.1.1.5")
        XCTAssertEqual(value, Algorithm.sha1_with_rsa_signature)
    }
    
    func testRsaOAEPEncryptionSET() {
        let value = Algorithm(value: "1.2.840.113549.1.1.6")
        XCTAssertEqual(value, Algorithm.rsaOAEPEncryptionSET)
    }
    
    func testSha256WithRSAEncryption() {
        let value = Algorithm(value: "1.2.840.113549.1.1.11")
        XCTAssertEqual(value, Algorithm.sha256WithRSAEncryption)
    }
    
    func testSha384WithRSAEncryption() {
        let value = Algorithm(value: "1.2.840.113549.1.1.12")
        XCTAssertEqual(value, Algorithm.sha384WithRSAEncryption)
    }
    
    func testSha512WithRSAEncryption() {
        let value = Algorithm(value: "1.2.840.113549.1.1.13")
        XCTAssertEqual(value, Algorithm.sha512WithRSAEncryption)
    }
    
    func testSha224WithRSAEncryption() {
        let value = Algorithm(value: "1.2.840.113549.1.1.14")
        XCTAssertEqual(value, Algorithm.sha224WithRSAEncryption)
    }
    
    func testUnknown() {
        let value = Algorithm(value: "xyz")
        XCTAssertEqual(value, Algorithm.unknown)
    }
}
