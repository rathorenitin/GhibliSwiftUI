//
//  MoviesListView.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 28/06/26.
//

import SwiftUI

struct MoviesListView<ViewModel: MoviesListViewModelProtocol>: View {
    @StateObject private var viewModel: ViewModel
    @State private var selectedMovie: Movie?

    init(viewModel: @autoclosure @escaping () -> ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel())
    }

    var body: some View {
        NavigationStack {
            contentView
                .navigationTitle("Movies")
                .onAppear { viewModel.load() }
                .navigationDestination(item: $selectedMovie) { movie in
                    AppCoordinator().movieDetail(movie: movie)
                }
        }
    }

    @ViewBuilder
    private var contentView: some View {
        switch viewModel.state {
        case .loading:
            LoadingView()

        case .loaded(let movies):
            List(movies) { movie in
                MoviewView(model: movie, viewModel: viewModel) { selectedMovie = $0 }
            }

        case .empty(let message):
            EmptyStateView(message: message)

        case .error(let message):
            ErrorView(message: message, retry: { viewModel.load() })
        }
    }
}
