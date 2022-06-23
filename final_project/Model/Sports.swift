//
//  Sports.swift
//  final_project
//
//  Created by mohamed ibrahim on 19/06/2022.
//

import Foundation

// MARK: - Sports
class Sports: NSObject, Codable {
    let sports: [Sport]?

  
}

// MARK: - Sport
class Sport: NSObject, Codable {
    let idSport, strSport: String?
    let strFormat: StrFormat?
    let strSportThumb: String?
    let strSportIconGreen: String?
    let strSportDescription: String?

    
}

enum StrFormat: String, Codable {
    case eventSport = "EventSport"
    case teamvsTeam = "TeamvsTeam"
}
