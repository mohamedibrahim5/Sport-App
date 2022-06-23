//
//  LeaguesDetailesPresenter.swift
//  final_project
//
//  Created by mohamed ibrahim on 20/06/2022.
//

import Foundation

class LeaguesDetailesPresenterr:LeaguesDetailesPresenter{
    
    
    
    let LeaguesDetailes : LeaguesDetailesView
    init(LeaguesDetailes:LeaguesDetailesView)
    {
        self.LeaguesDetailes = LeaguesDetailes
    }
    func fetchData(endPoint: String) {
        let leaguesDetailesModel = LeaguesDetailesModelController(LeaguesDetailesPresenter: self)
        leaguesDetailesModel.fetchDataFromApi(endPoint: endPoint)
    }
    
    func onSuccess(leagues: [LeaguesDetaile]) {
        LeaguesDetailes.renderHomeView(leagues: leagues)
    }
    
    func onFail(error: Error) {
        LeaguesDetailes.postErrorHomeView(error: error)
    }
    
    
}
