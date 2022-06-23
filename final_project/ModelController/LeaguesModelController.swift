//
//  LeaguesModelController.swift
//  final_project
//
//  Created by mohamed ibrahim on 20/06/2022.
//

import Foundation

class LeaguesModelController: LeaguesModel {
    
    let apiService: leaguesService = LeaguesNetworkManger()
    let LeaguesPresenter: LeaguesPresenter
    
    init(LeaguesPresenter: LeaguesPresenter)  {
        self.LeaguesPresenter = LeaguesPresenter
    }
    
    
    func fetchDataFromApi(endPoint: String) {
        
        apiService.fetchLeagues(endPoint: endPoint) { league, error in
            if let league = league {
                self.LeaguesPresenter.onSuccess(leagues: league)
            }
        }
    }
}
