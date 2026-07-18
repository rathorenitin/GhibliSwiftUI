//
//  MovieInfoView.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 14/07/26.
//

import SwiftUI

struct MovieInfoView: View {
    
    let title: String
    let value: String
    
    var body: some View {
        GridRow {
            Text(title)
                .font(.subheadline)
                .fontWeight(.medium)
            
            Text(value)
                .font(.subheadline)
        }
    }
}
