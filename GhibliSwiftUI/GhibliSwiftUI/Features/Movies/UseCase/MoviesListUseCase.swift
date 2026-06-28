//
//  MoviesListUseCase.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 28/06/26.
//

import Foundation

protocol MoviesListUseCaseProtocol {
}

final class MoviesListUseCase: MoviesListUseCaseProtocol {
    private let repository: MoviesListRepositoryProtocol

    init(repository: MoviesListRepositoryProtocol) {
        self.repository = repository
    }

    
}
