//
//  TestUtils.swift
//  Created by Kevin Dittmar on 2/13/22.
//
//  Helper methods meant to make unit testing easier
//

import Foundation
import XCTest

extension XCTestCase {
  /**
   Read the given JSON file in as `Data` to use for testing purposes
   - Parameter filename: the name of the JSON file to load
   - Returns: the JSON contents of the file as `Data` to be consumed by a unit test
   */
  func readJson(from filename: String) throws -> Data? {
    guard let path = Bundle.module.path(forResource: filename, ofType: "json") else {
      throw NSError(domain: "ResourceError", code: -1, userInfo: ["message": "JSON file \(filename).json not found"])
    }
  
    return try String(contentsOfFile: path).data(using: .utf8)
  }
}
