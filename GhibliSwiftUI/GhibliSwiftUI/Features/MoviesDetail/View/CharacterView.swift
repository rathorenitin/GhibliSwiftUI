//
//  CharacterView.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 23/07/26.
//

import SwiftUI

struct CharacterView: View {
    let character: Characters
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 4) {
            Text(character.name)
            
            HStack(spacing: 8) {
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 8) {
                        Label(character.gender, systemImage: "person.fill")
                        Text("Age: \(character.age)")
                    }
                    HStack(spacing: 8) {
                        Label(character.eyeColor, systemImage: "eye")
                        Text("Hair: \(character.hairColor)")
                    }
                }
            }
            .foregroundColor(.secondary)
            .font(.caption)
            .lineLimit(1)
        }
    }
}
