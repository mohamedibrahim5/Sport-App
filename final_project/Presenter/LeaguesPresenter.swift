//
//  LeaguesPresenter.swift
//  final_project
//
//  Created by mohamed ibrahim on 20/06/2022.
//

import Foundation

class LeaguesPresenterr:LeaguesPresenter{
    
    let LeaguesView : LeaguesView
    init(LeaguesView:LeaguesView)
    {
        self.LeaguesView = LeaguesView
    }
    func fetchData(endPoint: String) {
        let leaguesModel = LeaguesModelController(LeaguesPresenter: self)
        leaguesModel.fetchDataFromApi(endPoint: endPoint)
    }
    
    func onSuccess(leagues: [League]) {
        LeaguesView.renderHomeView(leagues: leagues)
    }
    
    func onFail(error: Error) {
        LeaguesView.postErrorHomeView(error: error)
    }
    
    
}
