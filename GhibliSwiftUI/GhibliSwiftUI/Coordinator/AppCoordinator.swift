//
//  AppCoordinator.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 2026-07-07.
//

import SwiftUI

protocol Coordinator {
    func start() -> AnyView
}

@Observable
final class AppCoordinator: Coordinator {

    func start() -> AnyView {
        let apiClient = ApiClient()
        let moviesRepository = MoviesListRepository(apiClient: apiClient)
        let moviesUseCase = MoviesListUseCase(repository: moviesRepository)

        let favoritesRepository = FavoritesRepository(localStorage: FavoritesLocalStorage())
        let favoritesUseCase = FavoritesUseCase(repository: favoritesRepository)

        let moviesViewModel = MoviesListViewModel(useCase: moviesUseCase, favoritesUseCase: favoritesUseCase)
        let favoritesViewModel = FavoritesViewModel(useCase: moviesUseCase, favoritesUseCase: favoritesUseCase)
        let tabBarController = TabBarController(moviesViewModel: moviesViewModel, favoritesViewModel: favoritesViewModel)

        return tabBarController.start()
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
