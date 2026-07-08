//
//  ViewState.swift
//  GhibliSwiftUI
//
//  Created by Nitin Singh Rathore on 07/07/26.
//

enum ViewState<Result> {
    case loading
    case loaded(Result)
    case empty(String)
    case error(String)
}
