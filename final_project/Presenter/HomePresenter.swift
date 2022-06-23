//
//  HomePresenter.swift
//  final_project
//
//  Created by mohamed ibrahim on 19/06/2022.
//

import Foundation

class HomePresenter: IHomePresenter {
    
    let iHomeView: IHomeView
    
    init(iHomeView: IHomeView) {
        self.iHomeView = iHomeView
    }
    
    func fetchData(endPoint: String) {
        let homeModel = HomeModelController(iHomePresenter: self) // 2
        homeModel.fetchDataFromApi(endPoint: endPoint)
    }
    
    func onSuccess(users usersusers :[Sport]) {
        iHomeView.renderHomeView(users: usersusers)
    }
    
    func onFail(error: Error) {
        iHomeView.postErrorHomeView(error: error)
    }
    
    
}
