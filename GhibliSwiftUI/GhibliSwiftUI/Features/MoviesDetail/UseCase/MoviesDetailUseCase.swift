//
//  MoviesDetailUseCase.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 11/07/26.
//

protocol MoviesDetailUseCaseProtocol {
}

final class MoviesDetailUseCase: MoviesDetailUseCaseProtocol {
    private let repository: MoviesDetailRepositoryProtocol

    init(repository: MoviesDetailRepositoryProtocol) {
        self.repository = repository
    }
}
