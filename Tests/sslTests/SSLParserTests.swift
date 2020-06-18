//
//  SSLParserTests.swift
//  
//
//  Created by ibrahim oktay on 18.06.2020.
//


import XCTest
@testable import SSLCore

final class SSLParserTests: XCTestCase {
    
    func testParseSecTrustWithNil() {
        let result = try? SSLParser.parse(nil)
        XCTAssertNil(result)
    }
}

