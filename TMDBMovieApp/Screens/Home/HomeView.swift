//
//  HomeView.swift
//  TMDBMovieApp
//
//  Created by Yogesh Patel on 15/04/24.
//

import SwiftUI
import Shimmer

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State private var searchText: String = ""

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                headerView

                // Search Bar
                TextField("Search movies...", text: $searchText)
                    .padding(10)
                    .background(Color(.systemGray5))
                    .cornerRadius(8)
                    .padding(.horizontal)

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 8) {
                        // Display filtered movies
                        if !searchText.isEmpty {
                            ForEach(filteredMovies, id: \.id) { movie in
                                MovieRow(movie: movie)
                                    .padding()
                            }
                        } else {
                            // Default sections when no search text
                            MovieSectionView(title: "Upcomings", movies: viewModel.upcomingMovies)
                            MovieSectionView(title: "Populars", movies: viewModel.popularMovies)
                            MovieSectionView(title: "Top Rated", movies: viewModel.topRatedMovies)
                        }
                    }
                }

                Spacer()
            }
            .padding()
            .ignoresSafeArea(edges: .bottom)
            .task {
                await viewModel.loadMovies()
            }
        }
    }

    var headerView: some View {
        VStack(alignment: .leading) {
            Text("Welcome back")
                .foregroundStyle(.secondary)
                .font(.caption)
            Text("Nicholas Doorgasingh")
                .font(.title)
        }
    }

    // Filter logic for search
    var filteredMovies: [Movie] {
        let allMovies = viewModel.upcomingMovies + viewModel.popularMovies + viewModel.topRatedMovies
        return allMovies.filter { $0.title.lowercased().contains(searchText.lowercased()) }
    }
}

#Preview {
    HomeView().preferredColorScheme(.dark)
}
