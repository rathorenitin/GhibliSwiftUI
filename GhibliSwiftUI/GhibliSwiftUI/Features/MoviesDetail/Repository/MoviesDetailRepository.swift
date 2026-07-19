//
//  MoviesDetailRepository.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 11/07/26.
//

protocol MoviesDetailRepositoryProtocol {
    func fetchCharacters(rom URLString: String) async throws -> Characters
}

final class MoviesDetailRepository: MoviesDetailRepositoryProtocol {
    private let apiClient: ApiClientProtocol

    init(apiClient: ApiClientProtocol) {
        self.apiClient = apiClient
    }
    
    func fetchCharacters(rom URLString: String) async throws -> Characters {
        let request = CharactersRequest(url: URLString)
        let dtos: CharactersDTO = try await apiClient.executeAsync(request: request)
        return dtos.toDomain()
    }

}
