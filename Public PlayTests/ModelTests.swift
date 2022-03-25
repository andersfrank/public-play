//
//  Public_PlayTests.swift
//  Public PlayTests
//
//  Created by Anders Frank on 2022-03-24.
//

import XCTest
@testable import Public_Play

class ModelTests: XCTestCase {
    func testLoadSVTData() throws {
        let welcome = try Welcome.loadJSON()
        welcome.data
    }
}
