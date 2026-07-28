//
//  FavoriteButton.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 23/07/26.
//

import SwiftUI

struct FavoriteButton: View {
    
    var isFavroite: Bool
    var callBack: ((Bool) -> ())
    
    var body: some View {
        Button {
            callBack(!isFavroite)
        } label: {
            Image(systemName: isFavroite ? "heart.fill" : "heart")
                .foregroundStyle(isFavroite ? Color.red : Color.black)
        }
    }
}
