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
                
                
                // 2 title
                Text(viewModel.movie.title)
                    .font(.title)
                    .fontWeight(.bold)
            }
        }
    }
}
