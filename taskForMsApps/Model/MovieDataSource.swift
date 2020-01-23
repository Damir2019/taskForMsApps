//
//  MovieDataSource.swift
//  taskForMsApps
//
//  Created by damir hodez on 22/01/2020.
//  Copyright © 2020 damir hodez. All rights reserved.
//

import Foundation
import CoreData

// a class that contains all the movies and managing it.
// also a singleton because we need the same tada source all over the app and dont need more than one data source.
class MovieDataSource {
    
    // a delegate the gets the viewController instance
    // to nitify the controller after JSON object from net work was saved
    // that he can continue
    // in this case will start the goToLost() func
    var delegate: MovieDelegate?
    
    // static virable to access the property without creating an instance
    static let shared = MovieDataSource()
    
    // reference to the dao
    let dao = DAO.shared
    
    // our actual data, the movie list
    var movieList: [Movie] = []
    
    // the JSON object url address, where we want to get our data from
    let url = "https://api.androidhive.info/json/movies.json"
    
    // privte init so nobody can create an instance of it
    private init() {}
    
    // fetching data from core data, and if its empty
    // it executes the a function the gets data from network
    func coreDataCheck() -> Bool {
        movieList = dao.fetchMovies()
        
        if movieList.isEmpty {
            print("Get movies from API")
            moviesFromURL()
            return false
        } else {
            print("there is data")
            return true
        }
        
    }
    
    // getting movies from network
    func moviesFromURL() {
        // create a URL
        guard let url = URL(string: self.url) else { return }
        
        // create a Session
        let session = URLSession(configuration: .default)
        
        // give the session a task and start it
        session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            if let safeData = data {
                self.parseJSON(movieData: safeData)
            }
        }.resume()
    }
    
    // JSON parsin function, get all data from network, parsing and saving the data
    // to core data and than returns array of the model
    func parseJSON(movieData: Data) {
        let decoder = JSONDecoder()
        do {
            let _ = try decoder.decode([Movie].self, from: movieData)
            
            DispatchQueue.main.async {
                self.movieList = self.dao.fetchMovies()
                self.delegate!.moviesSaved()
            }
        } catch {
            print("There was a problem getting movies")
            print(error)
        }
    }
    
    // adding a movie to the data
    func addMovie(from stringValue: String) {
        // adding fundtion for the captured data
        dao.addMovie(stringValue: stringValue)
        // fetching the data after the new movie added
        // already ordered by releaseYear
        movieList = dao.fetchMovies()
    }
}

// a delegate protocol to update the datasource after all data fetched from notwork
protocol MovieDelegate {
    func moviesSaved()
}

