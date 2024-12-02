//
//  UserDefaults.swift
//  IMusic
//
//  Created by Ekaterina Yashunina on 23.04.2024.
//

import Foundation

extension UserDefaults {

    static let favouriteTrackKey = "favouriteTrackKey"

    func savedTracks() -> [SearchViewModel.Cell] {
        let defaults = UserDefaults.standard

        guard let savedTracks = defaults.object(forKey: UserDefaults.favouriteTrackKey) as? Data else { return [] }
        guard let decodedTracks = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedTracks) as? [SearchViewModel.Cell] else { return [] }
        return decodedTracks
    }

}
