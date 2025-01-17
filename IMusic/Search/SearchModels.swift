//
//  SearchModels.swift
//  IMusic
//
//  Created by Ekaterina Yashunina on 22.03.2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import SwiftUI

enum Search {
   
  enum Model {
    struct Request {
      enum RequestType {
          case getTracks(searchTerm: String)
      }
    }
    struct Response {
      enum ResponseType {
          case presentTracks(searchResponse: SearchResponse?)
          case presentFooterView
      }
    }
    struct ViewModel {
      enum ViewModelData {
          case displayTracks(searchViewModel: SearchViewModel)
          case displayFooterView
      }
    }
  }
  
}

class SearchViewModel: NSObject, NSCoding {

    func encode(with coder: NSCoder) {
        coder.encode(cells, forKey: "cells")
    }

    required init?(coder: NSCoder) {
        cells = coder.decodeObject(forKey: "cells") as? [SearchViewModel.Cell] ?? []
    }

    @objc(_TtCC6IMusic15SearchViewModel4Cell)class Cell: NSObject, NSCoding, Identifiable {
        
        var id = UUID()
        var iconUrlString: String?
        var trackName: String
        var collectionName: String
        var artistName: String
        var previewUrl: String?

        func encode(with coder: NSCoder) {
            coder.encode(iconUrlString, forKey: "iconUrlString")
            coder.encode(trackName, forKey: "trackName")
            coder.encode(collectionName, forKey: "collectionName")
            coder.encode(artistName, forKey: "artistName")
            coder.encode(previewUrl, forKey: "previewUrl")
        }

        required init?(coder: NSCoder) {
            iconUrlString = coder.decodeObject(forKey: "iconUrlString") as? String? ?? ""
            trackName = coder.decodeObject(forKey: "trackName") as? String ?? ""
            collectionName = coder.decodeObject(forKey: "collectionName") as? String ?? ""
            artistName = coder.decodeObject(forKey: "artistName") as? String ?? ""
            previewUrl = coder.decodeObject(forKey: "previewUrl") as? String? ?? ""
        }

        init(iconUrlString: String? = nil, trackName: String, collectionName: String, artistName: String, previewUrl: String? = nil) {
            self.iconUrlString = iconUrlString
            self.trackName = trackName
            self.collectionName = collectionName
            self.artistName = artistName
            self.previewUrl = previewUrl
        }
    }

    init(cells: [Cell]){
        self.cells = cells
    }

    let cells: [Cell]
}
