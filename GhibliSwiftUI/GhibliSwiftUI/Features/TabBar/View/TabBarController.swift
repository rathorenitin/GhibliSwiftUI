//
//  TabBarController.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 2026-08-06.
//

import SwiftUI

@Observable
final class TabBarController {
    private let moviesViewModel: MoviesListViewModel
    private let favoritesViewModel: FavoritesViewModel

    init(moviesViewModel: MoviesListViewModel, favoritesViewModel: FavoritesViewModel) {
        self.moviesViewModel = moviesViewModel
        self.favoritesViewModel = favoritesViewModel
    }

    func start() -> AnyView {
        AnyView(
            TabView {
                MoviesListView(viewModel: self.moviesViewModel)
                    .tabItem {
                        Label("Movies", systemImage: "film")
                    }

                FavoritesView(viewModel: self.favoritesViewModel)
                    .tabItem {
                        Label("Favorites", systemImage: "heart.fill")
                    }
            }
        )
    }
}
