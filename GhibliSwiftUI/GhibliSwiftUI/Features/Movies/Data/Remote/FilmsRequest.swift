//
//  FilmsRequest.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 2026-07-07.
//

import Foundation

struct FilmsRequest: ApiRequestProtocol {
    var url: String {
        ApiEndPoint.films.absoluteURL ?? ""
    }

    // We keep default method (GET) and headers
    var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy {
        .useDefaultKeys
    }
}
