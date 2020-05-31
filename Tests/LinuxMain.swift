import XCTest

import sslTests

var tests = [XCTestCaseEntry]()
tests += sslTests.allTests()
XCTMain(tests)
