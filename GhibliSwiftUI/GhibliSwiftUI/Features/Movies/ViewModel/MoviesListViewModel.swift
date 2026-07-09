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
    func load()
}

final class MoviesListViewModel: ObservableObject, MoviesListViewModelProtocol {
    @Published private(set) var state: ViewState<[Movie]> = .loading

    private let useCase: MoviesListUseCaseProtocol
    init(useCase: MoviesListUseCaseProtocol) {
        self.useCase = useCase
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
            } catch {
                self.state = .error("Failed to load movies: \(error)")
            }
        }
    }
}
