//
//  HomeRowView.swift
//  TMDBMovieApp
//
//  Created by Nicholas Doorgasingh
//

struct MovieRow: View {
    let movie: Movie

    var body: some View {
        HStack {
            if let posterPath = movie.posterPath {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200\(posterPath)")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 75)
                        .cornerRadius(5)
                } placeholder: {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 50, height: 75)
                        .cornerRadius(5)
                        .shimmering() // Requires Shimmer package
                }
            }

            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                Text(movie.releaseDate)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding(.vertical, 4)
    }
}
