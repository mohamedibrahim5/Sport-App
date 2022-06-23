//
//  ApiServics.swift
//  final_project
//
//  Created by mohamed ibrahim on 19/06/2022.
//

import Foundation

protocol ApiService {
    func fetchUsers(endPoint: String, completion: @escaping (([Sport]?, Error?) -> Void))
}

protocol leaguesService {
    func fetchLeagues (endPoint: String, completion: @escaping (([League]?, Error?) -> Void))
}


protocol leaguesDetaliesService {
    func fetchLeagues (endPoint: String, completion: @escaping (([LeaguesDetaile]?, Error?) -> Void))
}

protocol EventsService {
    func fetchLeagues (endPoint: String, completion: @escaping (([Event]?, Error?) -> Void))
}

protocol LatestEventsService {
    func fetchLeagues (endPoint: String, completion: @escaping (([LatestEvent]?, Error?) -> Void))
}
