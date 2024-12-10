//
//  String+Extension.swift
//  TMDBMovieApp
//
// Created by Nicholas Doorgasingh
//

import Foundation

extension String {

    var imageURL: URL? {
        URL(string: "https://image.tmdb.org/t/p/original/\(self)")
    }

}
