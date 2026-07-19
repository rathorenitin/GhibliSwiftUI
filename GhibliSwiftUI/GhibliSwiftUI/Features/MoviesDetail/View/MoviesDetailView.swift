//
//  MoviesDetailView.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 11/07/26.
//

import SwiftUI

struct MoviesDetailView<ViewModel: MoviesDetailViewModelProtocol>: View  {
    
    @StateObject private var viewModel: ViewModel
    
    init(viewModel: @autoclosure @escaping () -> ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel())
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                
                //1 banner image
                ImageView(urlPath: viewModel.movie.bannerImage)
                    .frame(height: 250)
                    .containerRelativeFrame(.horizontal)
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    // 2 title
                    Text(viewModel.movie.title)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    // 3 details
                    Grid(alignment: .leading) {
                        MovieInfoView(title: "Director:", value: viewModel.movie.director)
                        MovieInfoView(title: "Producer:", value: viewModel.movie.producer)
                        MovieInfoView(title: "Release Date:", value: viewModel.movie.releaseDate)
                        MovieInfoView(title: "Running Time:", value: "\(viewModel.movie.duration) minutes")
                        MovieInfoView(title: "Score:", value: "\(viewModel.movie.score)/100")
                    }
                    .padding(.vertical, 8)
                    
                    Divider()
                    
                    // 4 description
                    Text("Description")
                        .font(.headline)
                    
                    Text(viewModel.movie.description)
                    
                }
                .padding()
            }
        }
    }
    
}
