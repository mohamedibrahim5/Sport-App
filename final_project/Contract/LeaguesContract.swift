//
//  LeaguesContract.swift
//  final_project
//
//  Created by mohamed ibrahim on 20/06/2022.
//

import Foundation

protocol  LeaguesView{
    func renderHomeView(leagues: [League])
    func postErrorHomeView(error: Error)
}

protocol LeaguesPresenter {
    func fetchData(endPoint: String)
    func onSuccess(leagues: [League])
    func onFail(error: Error)
}

protocol LeaguesModel {
    func fetchDataFromApi(endPoint: String)
}
