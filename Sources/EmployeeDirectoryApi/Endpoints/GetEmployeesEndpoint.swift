//
//  GetEmployeesEndpoint.swift
//  Created by Kevin Dittmar on 2/13/22.
//
//  Gets a list of employees from the server
//

import Foundation

struct GetEmployeesEndpoint: Endpoint {
  struct Employees: Decodable {
    let employees: [Employee]
  }
  typealias Response = Employees
  
  var method: HttpMethod { .get }
  var path: String { "\(Self.awsBaseUrl)/employees.json" }
}
