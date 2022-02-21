//
//  GetEmployeesEndpoint.swift
//  Created by Kevin Dittmar on 2/13/22.
//
//  Gets a list of employees from the server
//

import Foundation

public enum GetEmployeesEndpoint: Endpoint {
  case getEmployees
  case getEmptyEmployees
  case getMalformedEmployees
  
  public struct Employees: Decodable {
    public let employees: [Employee]
  }
  
  public typealias Response = Employees
  
  public var method: HttpMethod { .get }
  
  public var path: String {
    switch self {
    case .getEmployees:
      return "\(Self.awsBaseUrl)/employees.json"
    case .getEmptyEmployees:
      return "\(Self.awsBaseUrl)/employees_empty.json"
    case .getMalformedEmployees:
      return "\(Self.awsBaseUrl)/employees_malformed.json"
    }
  }
}
