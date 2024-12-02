//
//  SearchResponseModel.swift
//  IMusic
//
//  Created by Ekaterina Yashunina on 21.03.2024.
//

import Foundation

struct SearchResponse: Decodable {
    var resultCount: Int
    var results: [Track]
}

struct Track: Decodable {
    var trackName: String
    var collectionName: String?
    var artistName: String
    var artworkUrl100: String?
    var previewUrl: String? 
}
