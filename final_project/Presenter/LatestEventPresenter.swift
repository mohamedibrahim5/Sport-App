//
//  LatestEventPresenter.swift
//  final_project
//
//  Created by mohamed ibrahim on 23/06/2022.
//

import Foundation

class LatestEventPresenterr:LatestEventsPresenter{
    
    let LeaguesDetailes : LatestEventsView
    init(LeaguesDetailes:LatestEventsView)
    {
        self.LeaguesDetailes = LeaguesDetailes
    }
    func fetchData(endPoint: String) {
        let eventsModel = LatestEventsModelController(eventPresenter: self)
        eventsModel.fetchDataFromApi(endPoint: endPoint)
    }
    
    func onSuccess(users: [LatestEvent]) {
        LeaguesDetailes.renderHomeView(users: users)
    }
    
    func onFail(error: Error) {
        LeaguesDetailes.postErrorHomeView(error: error)
    }
}
