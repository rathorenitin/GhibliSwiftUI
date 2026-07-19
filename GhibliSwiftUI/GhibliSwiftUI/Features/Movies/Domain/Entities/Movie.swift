//
//  Movie.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 2026-07-07.
//

import Foundation

struct Movie: Identifiable, Equatable, Hashable {
    let id: String
    let title: String
    let description: String
    let director: String
    let producer: String
    let releaseDate: String
    let image: String
    let bannerImage: String
    let score: String
    let duration: String
    let people: [String]
}
