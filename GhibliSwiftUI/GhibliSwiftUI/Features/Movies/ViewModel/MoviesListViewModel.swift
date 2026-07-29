//
//  MoviesListViewModel.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 28/06/26.
//

import Combine
import Foundation

protocol MoviesListViewModelProtocol: ObservableObject {
    var state: ViewState<[Movie]> { get }
    var favoriteIDs: Set<String> { get }
    func load()
    func isFavorite(movieID: String) -> Bool
    func toggleFavorite(movieID: String)
}

final class MoviesListViewModel: ObservableObject, MoviesListViewModelProtocol {
    @Published private(set) var state: ViewState<[Movie]> = .loading
    @Published private(set) var favoriteIDs: Set<String> = []

    private let useCase: MoviesListUseCaseProtocol
    private let favoritesUseCase: FavoritesUseCaseProtocol

    init(useCase: MoviesListUseCaseProtocol, favoritesUseCase: FavoritesUseCaseProtocol) {
        self.useCase = useCase
        self.favoritesUseCase = favoritesUseCase
    }

    func load() {
        Task {
            self.state = .loading
            do {
                let result = try await useCase.execute()
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
