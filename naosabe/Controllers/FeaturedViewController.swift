//
//  FeaturedViewController.swift
//  naosabe
//
//  Created by livia on 05/07/22.
//

import UIKit

class FeaturedViewController: UIViewController {
    
    var popularMovies: [Movie] = [] // = Movie.popularMovies()
    var nowPlayingMovies: [Movie] = [] // = Movie.nowPlayingMovies()
    var upcomingMovies: [Movie] = [] // = Movie.upcomingMovies()
    
    @IBOutlet var popularCollectionView: UICollectionView!
    @IBOutlet var nowPlayingCollectionView: UICollectionView!
    @IBOutlet var upcomingCollectionView: UICollectionView!
    @IBOutlet var loading: UIActivityIndicatorView!
    @IBOutlet var mainScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        popularCollectionView.dataSource = self
        nowPlayingCollectionView.dataSource = self
        upcomingCollectionView.dataSource = self
        
        popularCollectionView.delegate = self
        nowPlayingCollectionView.delegate = self
        upcomingCollectionView.delegate = self
        
        loading.startAnimating()
        
        mainScrollView.isHidden = true
        
        Task {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [self] in
                self.loading.stopAnimating()
                self.loading.hidesWhenStopped = true
                mainScrollView.isHidden = false
            }
            self.popularMovies = await Movie.popularMoviesAPI()
            self.popularCollectionView.reloadData()
            self.nowPlayingMovies = await Movie.nowplayingMoviesAPI()
            self.nowPlayingCollectionView.reloadData()
            self.upcomingMovies = await Movie.upcomingMoviesAPI()
            self.upcomingCollectionView.reloadData()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        passar o filme adiante
        if let destination = segue.destination as? DetailsViewController {
            let movie = sender as? Movie
            destination.movie = movie
        }
    }
    
    
}

