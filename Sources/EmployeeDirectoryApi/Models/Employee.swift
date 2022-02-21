//
//  Employee.swift
//  Created by Kevin Dittmar on 2/13/22.
//
//  A representation of an employee, including their name, contact information,
//  and other similar information that you'd find in an employee directory
//

import Foundation

public struct Employee: Decodable {
  public enum EmploymentType: String, Decodable {
    case contractor = "CONTRACTOR"
    case fullTime = "FULL_TIME"
    case partTime = "PART_TIME"
  }
  
  public enum Team: String, Decodable {
    case appointments = "Appointments"
    case cash = "Cash"
    case core = "Core"
    case hardware = "Hardware"
    case invoices = "Invoices"
    case pointOfSale = "Point of Sale"
    case pointOfSalePlatform = "Point of Sale Platform"
    case restaurants = "Restaurants"
    case retail = "Retail"
    case webMarketing = "Public Web & Marketing"
  }
  
  // Create a mapping between our Swift property names and the JSON payload property names
  public enum CodingKeys: String, CodingKey {
    case biography
    case emailAddress = "email_address"
    case employeeType = "employee_type"
    case fullName = "full_name"
    case largePhotoUrlString = "photo_url_large"
    case phoneNumber = "phone_number"
    case smallPhotoUrlString = "photo_url_small"
    case team
    case uuid
  }
  
  public let uuid: String
  public let fullName: String
  public let phoneNumber: String?
  public let emailAddress: String
  public let biography: String?
  public let smallPhotoUrlString: String?
  public let largePhotoUrlString: String?
  public let team: Team
  public let employeeType: EmploymentType
}
