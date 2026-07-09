//
//  MoviesListView.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 28/06/26.
//

import SwiftUI

struct MoviesListView<ViewModel: MoviesListViewModelProtocol>: View {
    @StateObject private var viewModel: ViewModel

    init(viewModel: @autoclosure @escaping () -> ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel())
    }

    var body: some View {
        NavigationView {
            contentView
                .navigationTitle("Movies")
                .onAppear { viewModel.load() }
        }
    }

    @ViewBuilder
    private var contentView: some View {
        switch viewModel.state {
        case .loading:
            LoadingView()

        case .loaded(let movies):
            List(movies) { movie in
                VStack(alignment: .leading, spacing: 4) {
                    Text(movie.title).font(.headline)
                    if let director = movie.director {
                        Text("Director: \(director)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    if let description = movie.description {
                        Text(description)
                            .font(.caption)
                            .lineLimit(2)
                    }
                }
            }

        case .empty(let message):
            EmptyStateView(message: "No Movies")

        case .error(let message):
            ErrorView(message: message, retry: { viewModel.load() })

        }
    }
}
