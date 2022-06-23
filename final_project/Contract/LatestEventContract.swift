//
//  LatestEventContract.swift
//  final_project
//
//  Created by mohamed ibrahim on 23/06/2022.
//

import Foundation

protocol LatestEventsView {
    func renderHomeView(users: [LatestEvent])
    func postErrorHomeView(error: Error)
}

protocol LatestEventsPresenter {
    func fetchData(endPoint: String)
    func onSuccess(users: [LatestEvent])
    func onFail(error: Error)
}

protocol LatestEventsModel {
    func fetchDataFromApi(endPoint: String)
}
