//
//  ImageView.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 10/07/26.
//

import SwiftUI

struct ImageView: View {
    
    let url: URL?
    
    init(urlPath: String) {
        self.url = URL(string: urlPath)
    }
    
    init(url: URL?) {
        self.url = url
    }
    
    var body: some View {
        AsyncImage(url: url) { state in
            switch state {
            case .empty:
                LoadingView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .clipped()
            case .failure(_):
                EmptyStateView(message: "Image download failed")
            @unknown default:
                fatalError()
            }
            
        }
    }
}
