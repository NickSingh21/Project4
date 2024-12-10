//
//  CastModel.swift
//  TMDBMovieApp
//
//  Created by Nicholas Doorgasingh
//

import Foundation

struct CastResponseModel: Decodable {
    let cast: [CastModel]
}

struct CastModel: Decodable, Identifiable {
    var id = UUID()
    let name, character: String
    let imageURL: String?

    enum CodingKeys: String, CodingKey {
        case name, character
        case imageURL = "profile_path"
    }
}
