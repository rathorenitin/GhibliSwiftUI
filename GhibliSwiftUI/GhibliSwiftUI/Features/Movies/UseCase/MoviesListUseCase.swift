//
//  MoviesListUseCase.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 28/06/26.
//

import Foundation

protocol MoviesListUseCaseProtocol {
    func execute() async throws -> [Movie]
}

final class MoviesListUseCase: MoviesListUseCaseProtocol {
    private let repository: MoviesRepositoryProtocol

    init(repository: MoviesRepositoryProtocol) {
        self.repository = repository
    }

    func execute() async throws -> [Movie] {
        try await repository.fetchMovies()
    }
}
