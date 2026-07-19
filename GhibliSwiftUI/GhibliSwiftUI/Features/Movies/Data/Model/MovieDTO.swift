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
    let description: String
    let director: String
    let producer: String
    let release_date: String
    let image: String
    let bannerImage: String
    let score: String
    let duration: String
    let people: [String]
    
    enum CodingKeys: String, CodingKey {
        case id, title, description, director, producer, release_date, image, people
        case bannerImage = "movie_banner"
        case duration = "running_time"
        case score = "rt_score"
    }
    
    func toDomain() -> Movie {
        Movie(id: id,
              title: title,
              description: description,
              director: director,
              producer: producer,
              releaseDate: release_date,
              image: image,
              bannerImage: bannerImage,
              score: score,
              duration: duration,
              people: people)
    }
}
