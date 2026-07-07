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
            List(viewModel.movies) { movie in
                VStack(alignment: .leading) {
                    Text(movie.title).font(.headline)
                    if let director = movie.director {
                        Text("Director: \(director)").font(.subheadline)
                    }
                }
            }
            .navigationTitle("Movies")
            .onAppear { viewModel.load() }
        }
    }
}
