//
//  LatestEventModelController.swift
//  final_project
//
//  Created by mohamed ibrahim on 23/06/2022.
//

import Foundation

class LatestEventsModelController: LatestEventsModel {
    
    let apiService: LatestEventsService = LatestEventsNetworkManger()
    let eventsPresenter: LatestEventsPresenter

    init(eventPresenter: LatestEventsPresenter)  {
        self.eventsPresenter = eventPresenter
    }


    func fetchDataFromApi(endPoint: String) {

        apiService.fetchLeagues(endPoint: endPoint) { eventDetailes, error in
            if let eventDetailes = eventDetailes {
                self.eventsPresenter.onSuccess(users: eventDetailes)
           }
        }
    }
}
