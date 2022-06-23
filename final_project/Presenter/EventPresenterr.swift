//
//  EventPresenterr.swift
//  final_project
//
//  Created by mohamed ibrahim on 22/06/2022.
//

import Foundation

class EventPresenterr:EventsPresenter{
    
    let LeaguesDetailes : EventsView
    init(LeaguesDetailes:EventsView)
    {
        self.LeaguesDetailes = LeaguesDetailes
    }
    func fetchData(endPoint: String) {
        let eventsModel = EventsModelController(eventPresenter: self)
        eventsModel.fetchDataFromApi(endPoint: endPoint)
    }
    
    func onSuccess(users: [Event]) {
        LeaguesDetailes.renderHomeView(users: users)
    }
    
    func onFail(error: Error) {
        LeaguesDetailes.postErrorHomeView(error: error)
    }
}
