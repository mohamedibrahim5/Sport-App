//
//  EventModelController.swift
//  final_project
//
//  Created by mohamed ibrahim on 22/06/2022.
//

import Foundation


class EventsModelController: EventsModel {
    
    let apiService: EventsService = EventsNetworkManger()
    let eventsPresenter: EventsPresenter

    init(eventPresenter: EventsPresenter)  {
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
