//
//  MoviesDetailRepository.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 11/07/26.
//

protocol MoviesDetailRepositoryProtocol {
}

final class MoviesDetailRepository: MoviesDetailRepositoryProtocol {
    private let apiClient: ApiClientProtocol

    init(apiClient: ApiClientProtocol) {
        self.apiClient = apiClient
    }
}
