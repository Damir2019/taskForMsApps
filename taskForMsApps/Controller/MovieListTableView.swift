//
//  MovieListTableView.swift
//  taskForMsApps
//
//  Created by damir hodez on 22/01/2020.
//  Copyright © 2020 damir hodez. All rights reserved.
//

import UIKit

class MovieListTableView: UITableViewController, QRScannerDelegate{

    // getting the movies from MovieDataSource
    var movies = MovieDataSource.shared.movieList
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // rigistration of the external nib we created with identifire MovieCell
        // now the table view will use this cell inside it
        tableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "movieTableCell")
        
        // we dont need the back button item
        navigationItem.hidesBackButton = true

        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false

        // add right bar button item
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButton(_:)))
        self.navigationItem.rightBarButtonItem = addButton
    }

    // a function that will be executed when addButton will be tapped
    @objc func addButton(_ sender: UIBarButtonItem) {
        // start the QRScanner page
        performSegue(withIdentifier: "goToQRScanner", sender: nil)
    }
    
    // MARK: - Table view data source

    // like a category of things we have, we can set the header text to specify the category if we need
    // because we have 1 category of movies we need only 1
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    // means how mant movie i have to display
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

    // what is going to be in each cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieTableCell", for: indexPath) as! MovieCell

        // get the spesific movie
        let movie = movies[indexPath.item]
        
        // sending the movie to setMovie() to initial the cell properly
        cell.setMovie(for: movie)

        return cell
    }
    
    // tapping on a cell executes this method
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMovie = movies[indexPath.row]
        
        // we want to go to details page
        performSegue(withIdentifier: "goToDetails", sender: selectedMovie)
        
        // we dont want the selection to stay
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // this method executes after performingSegue and before the targeted ViewController is activats
    // this allows us to prepare the next ViewController to sent some data or do other stuff
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetails" {
            // sending to details the movie object
            guard let dest = segue.destination as? MovieDetailsController else { return }
            guard let selectedMovie = sender as? Movie else { return }
            dest.datum = selectedMovie
        }
        
        if segue.identifier == "goToQRScanner" {
            // sending to scanner a reference to this viewController
            guard let dest = segue.destination as? QRScannerViewController else { return }
            dest.delegate = self
        }
        
    }
    
    // executes after we after we got new movie from QRScanner
    func movieAdded() {
        // after we add a movie we added it to the movieList in MovieDataSource
        // so we need to get the updated list
        movies = MovieDataSource.shared.movieList
        
        // after we got the updated list we can reload the table view data so we see the update
        tableView.reloadData()
    }
    
}
