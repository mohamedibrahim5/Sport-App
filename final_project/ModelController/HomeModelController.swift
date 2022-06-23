//
//  HomeModelController.swift
//  final_project
//
//  Created by mohamed ibrahim on 19/06/2022.
//

import Foundation

class HomeModelController: IHomeModel {
    
    let apiService: ApiService = NetworkManager()
    let iHomePresenter: IHomePresenter
    
    init(iHomePresenter: IHomePresenter)  {
        self.iHomePresenter = iHomePresenter
    }
    
    func fetchDataFromApi(endPoint: String) {
        apiService.fetchUsers(endPoint: endPoint) { sport, error in
            if let sport = sport {
                self.iHomePresenter.onSuccess(users: sport)
            }
        }
    }
}
