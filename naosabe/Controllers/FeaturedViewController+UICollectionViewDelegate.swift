//
//  FeaturedViewController+UICollectionViewDelegate.swift
//  naosabe
//
//  Created by livia on 13/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let movie: Movie
        
        if collectionView == self.popularCollectionView {
            print(popularMovies[indexPath.item])
            movie = popularMovies[indexPath.item]
        } else if collectionView == self.nowPlayingCollectionView {
            print(nowPlayingMovies[indexPath.item])
            movie = nowPlayingMovies[indexPath.item]
        } else {
            movie = upcomingMovies[indexPath.item]
        }
        
        self.performSegue(withIdentifier: "detailsSegue", sender: movie)
    }
}
