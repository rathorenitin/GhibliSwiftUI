//
//  MoviesListViewModel.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 28/06/26.
//

import Combine
import Foundation

protocol MoviesListViewModelProtocol: ObservableObject {
    var movies: [Movie] { get }
    func load()
}

final class MoviesListViewModel: ObservableObject, MoviesListViewModelProtocol {
    @Published private(set) var movies: [Movie] = []

    private let useCase: MoviesListUseCaseProtocol
    init(useCase: MoviesListUseCaseProtocol) {
        self.useCase = useCase
    }

    func load() {
        Task {
            do {
                let result = try await useCase.execute()
                DispatchQueue.main.async {
                    self.movies = result
                }
            } catch {
                print("Failed to load movies: \(error)")
            }
        }
    }
}
