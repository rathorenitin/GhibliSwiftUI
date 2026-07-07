//
//  ApiEndPoint.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 07/07/26.
//

import Foundation

/*
 Instead of using below constant variable we should fetch it from config on basis of enviorment
 */
enum AppConstants {
    static let baseURL = "https://ghibliapi.vercel.app/"
}

enum ApiEndPoint {
    case films
}

extension ApiEndPoint: ApiComponent {
    var baseURL: String? {
        AppConstants.baseURL // we can fetch this from dependency
    }
    
    var path: String {
        switch self {
        case .films:
            return "films"
        }
    }
    
    var absoluteURL: String? {
        guard let urlString = baseURL else {
            return nil
        }
        return urlString.appending(self.path)
    }
    
}
