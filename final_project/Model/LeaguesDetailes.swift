//
//  LeaguesDetailes.swift
//  final_project
//
//  Created by mohamed ibrahim on 20/06/2022.
//

import Foundation


class LeaguesDetailes: NSObject, Codable {
    let teams: [LeaguesDetaile]?
}

class LeaguesDetaile: NSObject, Codable {
    let idTeam, idSoccerXML , strTeam , idLeague,strSport,strLeague,strAlternate,strTeamBadge,intFormedYear,strTeamFanart1,strDescriptionEN,strStadium:String?
}
