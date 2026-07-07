//
//  MovieDTO.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 2026-07-07.
//

import Foundation

struct MovieDTO: Decodable {
    let id: String
    let title: String
    let description: String?
    let director: String?
    let producer: String?
    let release_date: String?

    enum CodingKeys: String, CodingKey {
        case id, title, description, director, producer, release_date
    }

    func toDomain() -> Movie {
        Movie(id: id,
              title: title,
              description: description,
              director: director,
              producer: producer,
              releaseDate: release_date)
    }
}
