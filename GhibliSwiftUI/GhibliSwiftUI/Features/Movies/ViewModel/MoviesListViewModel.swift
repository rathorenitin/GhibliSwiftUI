//
//  MoviesListViewModel.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 28/06/26.
//

import Foundation

protocol MoviesListViewModelProtocol: FavoriteToggleViewModelProtocol {
    var state: ViewState<[Movie]> { get }
    var favoriteIDs: Set<String> { get }
    func load()
}

@Observable
final class MoviesListViewModel: MoviesListViewModelProtocol {
    var state: ViewState<[Movie]> = .loading
    var favoriteIDs: Set<String> = []
    private(set) var cachedMovies: [Movie] = []

    private let useCase: MoviesListUseCaseProtocol
    private let favoritesUseCase: FavoritesUseCaseProtocol

    init(useCase: MoviesListUseCaseProtocol, favoritesUseCase: FavoritesUseCaseProtocol) {
        self.useCase = useCase
        self.favoritesUseCase = favoritesUseCase
    }

    func load() {
        Task {
            if !cachedMovies.isEmpty {
                self.state = .loaded(cachedMovies)
                refreshFavorites()
                return
            }

            self.state = .loading
            do {
                let result = try await useCase.execute()
                cachedMovies = result

                if result.isEmpty {
                    self.state = .empty("No movies found")
                } else {
                    self.state = .loaded(result)
                }
                refreshFavorites()
            } catch {
                self.state = .error("Failed to load movies: \(error)")
            }
        }
    }

    func isFavorite(movieID: String) -> Bool {
        favoriteIDs.contains(movieID)
    }

    func toggleFavorite(movieID: String) {
        let isFavorite = favoriteIDs.contains(movieID)
        favoritesUseCase.toggleFavorite(movieID: movieID, isFavorite: !isFavorite)
        refreshFavorites()
    }

    private func refreshFavorites() {
        favoriteIDs = Set(favoritesUseCase.getFavoriteMovieIDs())
    }
}
