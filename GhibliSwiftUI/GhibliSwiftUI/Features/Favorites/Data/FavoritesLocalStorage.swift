//
//  FavoritesLocalStorage.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 2026-07-29.
//

import Foundation

protocol FavoritesLocalStorageProtocol {
    func isFavorite(movieID: String) -> Bool
    func setFavorite(movieID: String, isFavorite: Bool)
    func getFavoriteMovieIDs() -> [String]
}

final class FavoritesLocalStorage: FavoritesLocalStorageProtocol {
    private let defaults: UserDefaults
    private let key = "favorite_movie_ids"

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }

    func isFavorite(movieID: String) -> Bool {
        getFavoriteMovieIDs().contains(movieID)
    }

    func setFavorite(movieID: String, isFavorite: Bool) {
        var ids = getFavoriteMovieIDs()
        if isFavorite {
            if !ids.contains(movieID) {
                ids.append(movieID)
            }
        } else {
            ids.removeAll { $0 == movieID }
        }
        defaults.set(ids, forKey: key)
    }

    func getFavoriteMovieIDs() -> [String] {
        defaults.stringArray(forKey: key) ?? []
    }
}
