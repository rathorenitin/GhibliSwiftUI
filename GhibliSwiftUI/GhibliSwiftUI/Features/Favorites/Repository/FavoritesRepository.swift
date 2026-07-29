//
//  FavoritesRepository.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 2026-07-29.
//

import Foundation

protocol FavoritesRepositoryProtocol {
    func isFavorite(movieID: String) -> Bool
    func toggleFavorite(movieID: String, isFavorite: Bool)
    func getFavoriteMovieIDs() -> [String]
}

final class FavoritesRepository: FavoritesRepositoryProtocol {
    private let localStorage: FavoritesLocalStorageProtocol

    init(localStorage: FavoritesLocalStorageProtocol) {
        self.localStorage = localStorage
    }

    func isFavorite(movieID: String) -> Bool {
        localStorage.isFavorite(movieID: movieID)
    }

    func toggleFavorite(movieID: String, isFavorite: Bool) {
        localStorage.setFavorite(movieID: movieID, isFavorite: isFavorite)
    }

    func getFavoriteMovieIDs() -> [String] {
        localStorage.getFavoriteMovieIDs()
    }
}
