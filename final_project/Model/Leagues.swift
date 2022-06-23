//
//  Leagues.swift
//  final_project
//
//  Created by mohamed ibrahim on 20/06/2022.
//

import Foundation

// MARK: - Legs
class Leagues: NSObject, Codable {
    let countries: [League]?

}

// MARK: - League
class League: NSObject, Codable {
  var  idLeague,idSoccerXML,idAPIfootball,strSport,strLeague,strLeagueAlternate,strYoutube,strBadge : String?
}
