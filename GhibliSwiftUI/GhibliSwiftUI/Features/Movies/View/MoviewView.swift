//
//  MoviewView.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 10/07/26.
//

import SwiftUI

struct MoviewView: View {
    let model: Movie

    private var hasMetadata: Bool {
        !model.director.isEmpty || !model.releaseDate.isEmpty || !model.description.isEmpty
    }

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            ImageView(urlPath: model.image)
                .frame(width: 100, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 10))

            VStack(alignment: .leading, spacing: 6) {
                Text(model.title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .lineLimit(2)

                if !model.director.isEmpty {
                    Text("Director: \(model.director)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }

                if !model.releaseDate.isEmpty {
                    Text("Release: \(model.releaseDate)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                if hasMetadata && !model.description.isEmpty {
                    Text(model.description)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .lineLimit(3)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 4)
        }
        .padding(.vertical, 6)
    }
}
