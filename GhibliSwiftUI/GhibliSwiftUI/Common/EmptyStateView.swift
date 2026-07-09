//
//  EmptyStateView.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 09/07/26.
//

import SwiftUI

struct EmptyStateView: View {
    let message: String
    var body: some View {
        VStack {
            Text(message)
                .foregroundStyle(.secondary)
        }
    }
}
