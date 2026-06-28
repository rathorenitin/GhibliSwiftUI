//
//  MoviesListViewModel.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 28/06/26.
//

import Combine

protocol MoviesListViewModelProtocol {
}

final class MoviesListViewModel: ObservableObject, MoviesListViewModelProtocol {
    private let useCase: MoviesListUseCaseProtocol
    init(useCase: MoviesListUseCaseProtocol) {
        self.useCase = useCase
    }

}
