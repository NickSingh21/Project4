//
//  MovieSearchView.swift
//  TMDBMovieApp
//
//  Created by Yogesh Patel on 19/04/24.
//

struct MovieSectionView: View {
    let title: String
    let movies: [Movie]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.title2)
                .bold()
                .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(movies, id: \.id) { movie in
                        MovieCard(movie: movie)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct MovieCard: View {
    let movie: Movie

    var body: some View {
        VStack {
            if let posterPath = movie.posterPath {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200\(posterPath)")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                } placeholder: {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 120, height: 180)
                        .cornerRadius(10)
                        .shimmering()
                }
            }

            Text(movie.title)
                .font(.caption)
                .lineLimit(1)
        }
        .frame(width: 120)
    }
}
