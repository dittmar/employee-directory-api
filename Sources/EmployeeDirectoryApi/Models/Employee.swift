//
//  Employee.swift
//  Created by Kevin Dittmar on 2/13/22.
//
//  A representation of an employee, including their name, contact information,
//  and other similar information that you'd find in an employee directory
//

import Foundation

struct Employee: Decodable {
  enum EmploymentType: String, Decodable {
    case contractor = "CONTRACTOR"
    case fullTime = "FULL_TIME"
    case partTime = "PART_TIME"
  }
  
  enum Team: String, Decodable {
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
  
  let uuid: String
  let fullName: String
  let phoneNumber: String
  let emailAddress: String
  let biography: String?
  let smallPhotoUrlString: String?
  let largePhotoUrlString: String?
  let team: Team
  let employeeType: EmploymentType
}
