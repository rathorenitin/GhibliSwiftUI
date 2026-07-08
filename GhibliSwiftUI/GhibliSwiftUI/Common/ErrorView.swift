//
//  ErrorView.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 07/07/26.
//

import SwiftUI

struct ErrorView: View {
    let message: String
    let retry: (() -> Void)?
    var body: some View {
        VStack(spacing: 20) {
            Text(message)
                .foregroundStyle(.red)
            if let retry {
                Button(action: retry) {
                    Text("Retry")
                }
            }
        }
    }
}
