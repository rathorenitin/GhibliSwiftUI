//
//  AppCoordinator.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 2026-07-07.
//

import SwiftUI
import Combine

protocol Coordinator: ObservableObject {
    func start() -> AnyView
}

final class AppCoordinator: ObservableObject, Coordinator {
    let objectWillChange = ObservableObjectPublisher()

    func start() -> AnyView {
        let apiClient = ApiClient()
        let repository = MoviesListRepository(apiClient: apiClient)
        let useCase = MoviesListUseCase(repository: repository)

        let favoritesRepository = FavoritesRepository(localStorage: FavoritesLocalStorage())
        let favoritesUseCase = FavoritesUseCase(repository: favoritesRepository)
        let viewModel = MoviesListViewModel(useCase: useCase, favoritesUseCase: favoritesUseCase)

        return AnyView(MoviesListView(viewModel: viewModel))
    }


    func movieDetail(movie: Movie) -> AnyView {
        let apiClient = ApiClient()
        let repository = MoviesDetailRepository(apiClient: apiClient)
        let useCase = MoviesDetailUseCase(repository: repository)
        let favoritesRepository = FavoritesRepository(localStorage: FavoritesLocalStorage())
        let favoritesUseCase = FavoritesUseCase(repository: favoritesRepository)
        let viewModel = MoviesDetailViewModel(movie: movie, useCase: useCase, favoritesUseCase: favoritesUseCase)

        return AnyView(MoviesDetailView(viewModel: viewModel))
    }
}
