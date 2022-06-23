//
//  EventsContract.swift
//  final_project
//
//  Created by mohamed ibrahim on 22/06/2022.
//

import Foundation

protocol EventsView {
    func renderHomeView(users: [Event])
    func postErrorHomeView(error: Error)
}

protocol EventsPresenter {
    func fetchData(endPoint: String)
    func onSuccess(users: [Event])
    func onFail(error: Error)
}

protocol EventsModel {
    func fetchDataFromApi(endPoint: String)
}
