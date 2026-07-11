//
//  MoviesDetailViewModel.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 11/07/26.
//

import Foundation
import Combine

protocol MoviesDetailViewModelProtocol: ObservableObject {
    var movie: Movie { get }
}

final class MoviesDetailViewModel: ObservableObject, MoviesDetailViewModelProtocol {
    @Published var movie: Movie
    
    private let useCase: MoviesDetailUseCaseProtocol
    init(movie: Movie, useCase: MoviesDetailUseCaseProtocol) {
        self.movie = movie
        self.useCase = useCase
    }
}
