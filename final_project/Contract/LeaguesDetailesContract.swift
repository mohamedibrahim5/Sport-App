//
//  LeaguesDetailesContract.swift
//  final_project
//
//  Created by mohamed ibrahim on 20/06/2022.
//

import Foundation

protocol  LeaguesDetailesView{
    func renderHomeView(leagues: [LeaguesDetaile])
    func postErrorHomeView(error: Error)
}

protocol LeaguesDetailesPresenter {
    func fetchData(endPoint: String)
    func onSuccess(leagues: [LeaguesDetaile])
    func onFail(error: Error)
}

protocol LeaguesDetailesModel {
    func fetchDataFromApi(endPoint: String)
}
