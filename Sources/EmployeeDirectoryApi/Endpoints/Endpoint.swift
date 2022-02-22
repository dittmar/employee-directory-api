//
//  Endpoint.swift
//  Created by Kevin Dittmar on 2/13/22.
//
//  Protocol for an API endpoint that includes everything that an endpoint
//  needs to function properly
//

import Foundation

/// Enum used to define which HTTP method an endpoint will be using
public enum HttpMethod {
  case delete
  case get
  case post
  case put
}

public protocol Endpoint {
  // The response that the endpoint returns
  associatedtype Response: Decodable
  
  /// The HTTP method for this endpoint (e.g. GET)
  var method: HttpMethod { get }
  /// The URL for the endpoint
  var path: String { get }
  
  /// Invoke this `Endpoint` and return its response decoded into the  expected return type
  ///  - Parameter urlSession: the `URLSession` to use for this endpoint call.
  ///  - Returns: the response from the server for the invoked endpoint
  func invoke(urlSession: URLSession) async throws -> Response
}

extension Endpoint {
  /// base URL for Amazon AWS endpoint URLs
  static var awsBaseUrl: String { "https://s3.amazonaws.com/sq-mobile-interview" }
  
  /// Invoke this `Endpoint` and return its response decoded into the  expected return type
  /// - Parameter urlSession: the `URLSession` to use for this endpoint call.  Defaults to `.shared`
  /// - Throws: Throws an error with code -1 if the URL derived from the endpoint is malformed
  public func invoke(urlSession: URLSession = .shared) async throws -> Response {
    guard let url = URL(string: path) else {
      throw NSError(domain: "com.dittmar.Employee-Directory-API", code: -1, userInfo: ["message": "Invalid endpoint URL"])
    }
    
    let (data, _) = try await urlSession.data(from: url, delegate: nil)
    return try JSONDecoder().decode(Response.self, from: data)
  }
}
