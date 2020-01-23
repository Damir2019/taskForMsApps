//
//  MovieDetailsController.swift
//  taskForMsApps
//
//  Created by damir hodez on 22/01/2020.
//  Copyright © 2020 damir hodez. All rights reserved.
//

import UIKit

class MovieDetailsController: UIViewController {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieReleaseYear: UILabel!
    @IBOutlet weak var movieGenre: UILabel!
    
    var datum: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // simple initializing for the details page
        let movie = datum!
        
        let imageURL = URL(string: movie.image!)
        
        movieImage.sd_setImage(with: imageURL)
        
        movieTitle.text = movie.title
        movieRating.text = String(movie.rating)
        movieReleaseYear.text = String(movie.releaseYear)
        movieGenre.text = movie.allGenres()
        
        movieImage.layer.borderWidth = 2
        movieImage.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }

}
