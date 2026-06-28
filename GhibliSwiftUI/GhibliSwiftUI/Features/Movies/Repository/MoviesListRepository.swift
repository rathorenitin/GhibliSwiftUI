//
//  MoviesListRepository.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 28/06/26.
//

import Foundation

protocol MoviesListRepositoryProtocol {
        
}

// MARK: - PatientRepository

final class MoviesListRepository: MoviesListRepositoryProtocol {
    
    private let apiClient: ApiClientProtocol

    // MARK: - initialization
    init(apiClient: ApiClientProtocol) {
        self.apiClient = apiClient
    }
    
}
