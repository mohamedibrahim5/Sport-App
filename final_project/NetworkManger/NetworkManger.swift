//
//  NetworkManger.swift
//  final_project
//
//  Created by mohamed ibrahim on 19/06/2022.
//

import Foundation

class NetworkManager: ApiService {
    func fetchUsers(endPoint: String, completion: @escaping (([Sport]?, Error?) -> Void)) {
        if let  url = URL(string: UrlServices(endPoint: endPoint).url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let decodedArray:Sports! = convertFromJson(data: data)
                    completion(decodedArray.sports,nil)
                }
                if let error = error {
                    completion(nil, error)
                }
            }.resume()
        }

    }
}


class LeaguesNetworkManger:leaguesService {
    func fetchLeagues(endPoint: String, completion: @escaping (([League]?, Error?) -> Void)) {
        if let  url = URL(string: UrlServices2(endPoint: endPoint).url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let decodedArray:Leagues! = convertFromJson(data: data)
                    completion(decodedArray.countries,nil)
                }
                if let error = error {
                    completion(nil, error)
                }
            }.resume()
        }
    }

}


// LeaguesDetailes


class LeaguesDetailesNetworkManger:leaguesDetaliesService {
    func fetchLeagues(endPoint: String, completion: @escaping (([LeaguesDetaile]?, Error?) -> Void)) {
        if let  url = URL(string: UrlServices3(endPoint: endPoint).url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let decodedArray:LeaguesDetailes! = convertFromJson(data: data)
                    completion(decodedArray.teams,nil)
                }
                if let error = error {
                    completion(nil, error)
                }
            }.resume()
        }
    }

}


// Event

class EventsNetworkManger:EventsService {
    func fetchLeagues(endPoint: String, completion: @escaping (([Event]?, Error?) -> Void)) {
        if let  url = URL(string: UrlServices4(endPoint: endPoint).url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let decodedArray:Events! = convertFromJson(data: data)
                    completion(decodedArray.event,nil)
                }
                if let error = error {
                    completion(nil, error)
                }
            }.resume()
        }
    }

}

// Latestevent
class LatestEventsNetworkManger:LatestEventsService {
    func fetchLeagues(endPoint: String, completion: @escaping (([LatestEvent]?, Error?) -> Void)) {
        if let  url = URL(string: UrlServices4(endPoint: endPoint).url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let decodedArray:LatestEvents! = convertFromJson(data: data)
                    completion(decodedArray.event,nil)
                }
                if let error = error {
                    completion(nil, error)
                }
            }.resume()
        }
    }

}

