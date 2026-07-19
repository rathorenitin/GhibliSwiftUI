//
//  MoviesDetailUseCase.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 11/07/26.
//

protocol MoviesDetailUseCaseProtocol {
    func fetchCharacters(from URLString: String) async throws -> Characters
}

final class MoviesDetailUseCase: MoviesDetailUseCaseProtocol {
    private let repository: MoviesDetailRepositoryProtocol

    init(repository: MoviesDetailRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchCharacters(from URLString: String) async throws -> Characters {
        try await repository.fetchCharacters(rom: URLString)
    }
}
