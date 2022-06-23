//
//  LeaguesDetailesController.swift
//  final_project
//
//  Created by mohamed ibrahim on 20/06/2022.
//

import Foundation

class LeaguesDetailesModelController: LeaguesDetailesModel {
    
    let apiService: leaguesDetaliesService = LeaguesDetailesNetworkManger()
    let LeaguesDetailesPresenter: LeaguesDetailesPresenter

    init(LeaguesDetailesPresenter: LeaguesDetailesPresenter)  {
        self.LeaguesDetailesPresenter = LeaguesDetailesPresenter
    }


    func fetchDataFromApi(endPoint: String) {

        apiService.fetchLeagues(endPoint: endPoint) { leagueDetailes, error in
            if let leagueDetailes = leagueDetailes {
                self.LeaguesDetailesPresenter.onSuccess(leagues: leagueDetailes)
            }
        }
    }
}


