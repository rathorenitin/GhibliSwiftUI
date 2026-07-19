//
//  CharactersRequest.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 19/07/26.
//

import Foundation

struct CharactersRequest: ApiRequestProtocol {
    var url: String

    // We keep default method (GET) and headers
    var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy {
        .useDefaultKeys
    }
    
    init(url: String) {
        self.url = url
    }
}
