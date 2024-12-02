//
//  SearchInteractor.swift
//  IMusic
//
//  Created by Ekaterina Yashunina on 22.03.2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SearchBusinessLogic {
  func makeRequest(request: Search.Model.Request.RequestType)
}

class SearchInteractor: SearchBusinessLogic {
    
    var networkService = NetworkService()
  var presenter: SearchPresentationLogic?
  var service: SearchService?
  
  func makeRequest(request: Search.Model.Request.RequestType) {
    if service == nil {
      service = SearchService()
    }

      switch request{
      case .getTracks(let searchTerm):
          print("interactor .getTracks")
          presenter?.presentData(response: Search.Model.Response.ResponseType.presentFooterView)
          networkService.fetchTracks(searchText: searchTerm) { [weak self] searchResponse in
              self?.presenter?.presentData(response: Search.Model.Response.ResponseType.presentTracks(searchResponse: searchResponse))
          }
      }
  }
  
}
