//
//  CharactersDTO.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 19/07/26.
//

import Foundation

struct CharactersDTO: Identifiable, Decodable, Equatable {
    let id: String
    let name: String
    let gender: String
    let age: String
    let eyeColor: String
    let hairColor: String
    let films: [String]
    let species: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, gender, age, films, species, url
        case eyeColor = "eye_color"
        case hairColor = "hair_color"
    }
    
    func toDomain() -> Characters {
        Characters(id: id,
                   name: name,
                   gender: gender,
                   age: age,
                   eyeColor: eyeColor,
                   hairColor: hairColor,
                   films: films,
                   species: species,
                   url: url)
    }
}
