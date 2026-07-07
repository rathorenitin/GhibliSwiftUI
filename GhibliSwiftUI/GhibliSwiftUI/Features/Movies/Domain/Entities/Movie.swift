//
//  Movie.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 2026-07-07.
//

import Foundation

struct Movie: Identifiable, Equatable {
    let id: String
    let title: String
    let description: String?
    let director: String?
    let producer: String?
    let releaseDate: String?
}
