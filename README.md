Original App Design Project - README Template
===

# Nicks_Movie_Previewer

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview

### Description

NicksMoviePreviewer is a SwiftUI-based iOS app that allows users to explore, preview, and track movies using data from the MovieDB API. Users can search for movies, view detailed information about each title, and create a personalized list of favorites.

### App Evaluation

[Evaluation of your app across the following attributes]
- **Category:** Entertainment
- **Mobile:** Yes, exclusively for mobile use on iOS 13 and above.
- **Story:**  NicksMoviePreviewer makes movie discovery easy and fun by providing previews, trailers, and the ability to create a custom watchlist.
- **Market:**  Designed for movie enthusiasts, casual viewers, and anyone looking for recommendations.
- **Habit:**  Intended for frequent use, particularly by users searching for new movies or managing their watchlists
- **Scope:**  Focused on movie discovery and tracking, with the potential for expansion into TV shows or user-generated content.
## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can search for movies by title.
* User can view detailed information about a movie, including trailer links, reviews, and cast.
* User can save movies to a favorites list for later viewing
* User can access trending or popular movies on the home screen

**Optional Nice-to-have Stories**

* User can sort movies by genre, release year, or rating.
* User can view related movie recommendations.
* User can share a movie's details with others via social media or messaging.
* User can receive personalized recommendations based on favorites.

### 2. Screen Archetypes

- [ ] [**Login Screen**]
* User can log in or sign up to personalize their experience.
- [ ] [**Home Screen**]
* Displays trending, popular, and new releases.
*  [ ] [**Movie Details Screen**]
* Shows detailed information about the movie, including trailer and cast.
 [ ] [** Favorites Screen**]
* Displays the user's saved favorite movies.
### 3. Navigation
* Home
* Search
*  Favorites
**Tab Navigation** (Tab to Screen)
- [ ] [First Tab--> Home]
- [ ] [First Tab --> Search]
- [ ] [First Tab--> Favorites]

**Flow Navigation** (Screen to Screen)

- [ ] [**Login Screen**]
  * Leads to [**Home Screen**]
- [ ] [**Search Screen**]
  * Leads to [**Favorites**]
  * * Leads to [**Movie Details**]


## Wireframes

[Add picture of your hand sketched wireframes in this section]

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 


### Models

[Model Name, e.g., User]
| Property | Type   | Description                                  |
|----------|--------|----------------------------------------------|
| id       |  INT   | Unique identifier for the movie   |
| title    | String | Title of the movie     |
| overview | String | Summary and or description |
| posterPath| String|  URL to poster|
|ReleaseDate| String| Release date of movie|
|genre     | String| Genre of the movie|
|rating|    | Float| Average Rating| 



### Networking

- [List of network requests by screen]
- [GET] /movie/popular - Retrieve popular movies
- [GET] /movie/top_rated - Retrieve top-rated movies
- [GET] /search/movie - Search for movies by title or keyword
- [Add list of network requests by screen ]
- Search Screen
[GET] /search/movie - Search for movies by title or keyword
Movie Details Screen
[GET] /movie/{movie_id} - Retrieve detailed information about a specific movie
[GET] /movie/{movie_id}/videos - Retrieve trailer and video information
[GET] /movie/{movie_id}/similar - Retrieve similar movies
Favorites Screen
[GET] /user/{user_id}/favorites - Retrieve user's favorite movies
[POST] /user/{user_id}/favorites - Add a movie to the user's favorites
[DELETE] /user/{user_id}/favorites - Remove a movie from the user's favorites
- 
- [Create basic snippets for each Parse network request]
- User Authentication
let user = PFUser()
user.username = "username"
user.password = "password"
user.email = "email@example.com"

user.signUpInBackground { (success, error) in
    if success {
        print("User signed up successfully")
    } else if let error = error {
        print("Error signing up: \(error.localizedDescription)")
    }
}

Login
PFUser.logInWithUsername(inBackground: "username", password: "password") { (user, error) in
    if let user = user {
        print("User logged in successfully: \(user.username!)")
    } else if let error = error {
        print("Error logging in: \(error.localizedDescription)")
    }
}

Logout
PFUser.logOutInBackground { (error) in
    if let error = error {
        print("Error logging out: \(error.localizedDescription)")
    } else {
        print("User logged out successfully")
    }
}

Movie Data
let favorite = PFObject(className: "Favorite")
favorite["user"] = PFUser.current()
favorite["movieId"] = movie.id
favorite["title"] = movie.title
favorite["posterPath"] = movie.posterPath

favorite.saveInBackground { (success, error) in
    if success {
        print("Movie saved to favorites")
    } else if let error = error {
        print("Error saving to favorites: \(error.localizedDescription)")
    }
}

Retreive Movies
let query = PFQuery(className: "Favorite")
query.whereKey("user", equalTo: PFUser.current()!)

query.findObjectsInBackground { (objects, error) in
    if let favorites = objects {
        for favorite in favorites {
            print("Movie Title: \(favorite["title"] as! String)")
        }
    } else if let error = error {
        print("Error retrieving favorites: \(error.localizedDescription)")
    }
}

Movie Discovery
let movie = PFObject(className: "Movie")
movie["movieId"] = movie.id
movie["title"] = movie.title
movie["overview"] = movie.overview
movie["posterPath"] = movie.posterPath
movie["rating"] = movie.rating

movie.saveInBackground { (success, error) in
    if success {
        print("Movie saved successfully")
    } else if let error = error {
        print("Error saving movie: \(error.localizedDescription)")
    }
}

Retrieve DATA
let query = PFQuery(className: "Movie")
query.whereKey("title", contains: "searchTerm") // Replace "searchTerm" with user input

query.findObjectsInBackground { (objects, error) in
    if let movies = objects {
        for movie in movies {
            print("Movie Title: \(movie["title"] as! String)")
        }
    } else if let error = error {
        print("Error retrieving movies: \(error.localizedDescription)")
    }
}

- [OPTIONAL: List endpoints if using existing API such as Yelp]

- https://www.themoviedb.org/u/ndoorgasingh2020
- Im using the movie DB API it provides a much better movie database adn it stays up to date with current movies that are and arent doing well.
