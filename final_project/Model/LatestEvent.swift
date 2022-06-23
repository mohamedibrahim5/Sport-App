//
//  LatestEvent.swift
//  final_project
//
//  Created by mohamed ibrahim on 23/06/2022.
//

import Foundation

class LatestEvents: NSObject, Codable {
    var event: [LatestEvent]?
}

class LatestEvent: NSObject, Codable{
    var strEvent,intHomeScore,intAwayScore,intRound,strSeason,strTime,dateEvent,strFilename : String?
}
