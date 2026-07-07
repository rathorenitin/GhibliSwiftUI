//
//  AppCoordinator.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 2026-07-07.
//

import SwiftUI
import Combine

protocol Coordinator: ObservableObject {
    func start() -> AnyView
}

final class AppCoordinator: ObservableObject, Coordinator {
    let objectWillChange = ObservableObjectPublisher()

    func start() -> AnyView {
        let apiClient = ApiClient()
        let repository = MoviesListRepository(apiClient: apiClient)
        let useCase = MoviesListUseCase(repository: repository)
        let viewModel = MoviesListViewModel(useCase: useCase)

        return AnyView(MoviesListView(viewModel: viewModel))
    }
}
