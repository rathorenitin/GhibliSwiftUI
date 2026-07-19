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
    var state: ViewState<[Characters]> { get }
    func load()
}

final class MoviesDetailViewModel: ObservableObject, MoviesDetailViewModelProtocol {
    @Published var movie: Movie
    @Published private(set) var state: ViewState<[Characters]> = .loading
    
    private let useCase: MoviesDetailUseCaseProtocol
    init(movie: Movie, useCase: MoviesDetailUseCaseProtocol) {
        self.movie = movie
        self.useCase = useCase
    }
    
    func load() {
        Task {
            self.state = .loading
            var loadedCharacters: [Characters] = []
            do {
                try await withThrowingTaskGroup(of: Characters.self) { group in
                    
                    for personInfoURL in movie.people {
                        group.addTask {
                            try await self.useCase.fetchCharacters(from: personInfoURL)
                        }
                    }
                    
                    // collect results as they complete
                    for try await character in group {
                        loadedCharacters.append(character)
                    }
                }
                
                state = .loaded(loadedCharacters)
                
            } catch {
                self.state = .error("Failed to load movies: \(error)")
            }
        }
    }
}
