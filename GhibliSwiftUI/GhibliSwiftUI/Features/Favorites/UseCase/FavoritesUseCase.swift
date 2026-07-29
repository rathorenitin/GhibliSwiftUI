//
//  FavoritesUseCase.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 2026-07-29.
//

import Foundation

protocol FavoritesUseCaseProtocol {
    func isFavorite(movieID: String) -> Bool
    func toggleFavorite(movieID: String, isFavorite: Bool)
    func getFavoriteMovieIDs() -> [String]
}

final class FavoritesUseCase: FavoritesUseCaseProtocol {
    private let repository: FavoritesRepositoryProtocol

    init(repository: FavoritesRepositoryProtocol) {
        self.repository = repository
    }

    func isFavorite(movieID: String) -> Bool {
        repository.isFavorite(movieID: movieID)
    }

    func toggleFavorite(movieID: String, isFavorite: Bool) {
        repository.toggleFavorite(movieID: movieID, isFavorite: isFavorite)
    }

    func getFavoriteMovieIDs() -> [String] {
        repository.getFavoriteMovieIDs()
    }
}
