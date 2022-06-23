//
//  Events.swift
//  final_project
//
//  Created by mohamed ibrahim on 22/06/2022.
//

import Foundation

// MARK: - Events
class Events: NSObject, Codable {
    var event: [Event]?
}

class Event: NSObject, Codable{
    var strEvent,strEventAlternate,strFilename,strLeague,strSeason,strTimestamp,strTime,dateEvent,strVenue : String?
}
