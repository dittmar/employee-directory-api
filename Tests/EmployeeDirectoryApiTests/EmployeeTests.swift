//
//  EmployeeTests.swift
//  Created by Kevin Dittmar on 2/13/22.
//
//  Test the decoding of a JSON payload into a list of `Employee`s, like what
//  is done by invoking the GetEmployeesEndpoint
//

@testable import EmployeeDirectoryApi
import XCTest

final class EmployeeTests: XCTestCase {
  func testGetEmployees() throws {
    let employees = try JSONDecoder().decode(GetEmployeesEndpoint.Response.self, from: readJson(from: "employees")!).employees
    XCTAssertEqual(3, employees.count)
    
    let jackDorsey = employees.first { $0.fullName == "Jack Dorsey" }
    XCTAssertEqual("5554544932", jackDorsey?.phoneNumber)
    XCTAssertEqual("jdorsey.demo@squareup.com", jackDorsey?.emailAddress)
    XCTAssertEqual("I work for you.", jackDorsey?.biography)
    XCTAssertEqual("d8265dcd-1914-4f93-8068-07f5426f0866", jackDorsey?.uuid)
    XCTAssertNotNil(jackDorsey?.smallPhotoUrlString)
    XCTAssertNotNil(jackDorsey?.largePhotoUrlString)
    XCTAssertEqual(.core, jackDorsey?.team)
    XCTAssertEqual(.fullTime, jackDorsey?.employeeType)
    
    let timNakamura = employees.first { $0.fullName == "Tim Nakamura" }
    XCTAssertEqual("5557510409", timNakamura?.phoneNumber)
    XCTAssertEqual("tnakamura.demo@squareup.com", timNakamura?.emailAddress)
    XCTAssertEqual("Hardware packaging designer on the hardware team, working from LA.", timNakamura?.biography)
    XCTAssertEqual("7fb13023-d013-41ac-84f1-e554890ccb32", timNakamura?.uuid)
    XCTAssertNotNil(timNakamura?.smallPhotoUrlString)
    XCTAssertNotNil(timNakamura?.largePhotoUrlString)
    XCTAssertEqual(.hardware, timNakamura?.team)
    XCTAssertEqual(.contractor, timNakamura?.employeeType)
    
    let camilleRogers = employees.first { $0.fullName == "Camille Rogers" }
    XCTAssertEqual("5558531970", camilleRogers?.phoneNumber)
    XCTAssertEqual("crogers.demo@squareup.com", camilleRogers?.emailAddress)
    XCTAssertEqual("Designer on the web marketing team.", camilleRogers?.biography)
    XCTAssertEqual("a98f8a2e-c975-4ba3-8b35-01f719e7de2d", camilleRogers?.uuid)
    XCTAssertNotNil(camilleRogers?.smallPhotoUrlString)
    XCTAssertNotNil(camilleRogers?.largePhotoUrlString)
    XCTAssertEqual(.webMarketing, camilleRogers?.team)
    XCTAssertEqual(.partTime, camilleRogers?.employeeType)
  }
  
  func testGetEmployeesEmpty() throws {
    let employees = try JSONDecoder().decode(GetEmployeesEndpoint.Employees.self, from: readJson(from: "empty_employees")!).employees
    
    XCTAssertTrue(employees.isEmpty)
  }
  
  func testGetEmployeesMalformed() throws {
    let json = try readJson(from: "malformed_employees")!
    
    XCTAssertThrowsError(try JSONDecoder().decode(GetEmployeesEndpoint.Employees.self, from: json))
  }
  
  // Make sure that an employee with the minimum data required works
  func testSpareEmployee() throws {
    let employee = try JSONDecoder().decode(Employee.self, from: readJson(from: "sparse_employee")!)
    
    XCTAssertEqual("some-uuid", employee.uuid)
    XCTAssertEqual("Kevin Dittmar", employee.fullName)
    XCTAssertEqual("kevinhd4@gmail.com", employee.emailAddress)
    XCTAssertEqual(.pointOfSale, employee.team)
    XCTAssertEqual(.fullTime, employee.employeeType)
  }
}
