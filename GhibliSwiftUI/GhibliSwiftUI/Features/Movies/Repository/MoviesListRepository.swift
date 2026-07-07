//
//  MoviesListRepository.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 28/06/26.
//

import Foundation

protocol MoviesRepositoryProtocol {
    func fetchMovies() async throws -> [Movie]
}

final class MoviesListRepository: MoviesRepositoryProtocol {
    private let apiClient: ApiClientProtocol

    init(apiClient: ApiClientProtocol) {
        self.apiClient = apiClient
    }

    func fetchMovies() async throws -> [Movie] {
        let request = FilmsRequest()
        let dtos: [MovieDTO] = try await apiClient.executeAsync(request: request)
        return dtos.map { $0.toDomain() }
    }
}
