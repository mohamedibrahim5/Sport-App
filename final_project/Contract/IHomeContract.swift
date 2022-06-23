//
//  IHomeContract.swift
//  final_project
//
//  Created by mohamed ibrahim on 19/06/2022.
//

import Foundation

protocol IHomeView {
    func renderHomeView(users: [Sport])
    func postErrorHomeView(error: Error)
}

protocol IHomePresenter {
    func fetchData(endPoint: String)
    func onSuccess(users: [Sport])
    func onFail(error: Error)
}

protocol IHomeModel {
    func fetchDataFromApi(endPoint: String)
}



