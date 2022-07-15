//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  naosabe
//
//  Created by livia on 12/07/22.
//

import UIKit
extension FeaturedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == popularCollectionView {
            return popularMovies.count
        } else if collectionView == nowPlayingCollectionView {
            return nowPlayingMovies.count
        } else if collectionView == upcomingCollectionView {
            return upcomingMovies.count
        } else {
            return 0
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == popularCollectionView {
            return makePopularCell(indexPath)
            
        } else if collectionView == nowPlayingCollectionView {
            return makeNowPlayingCell(indexPath)
        } else if collectionView == upcomingCollectionView {
            return makeUpcomingCell(indexPath)
        }
        
        return UICollectionViewCell()
        
    }
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> PopularCollectionViewCell {
        if let cell =
            popularCollectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellIdentifier, for: indexPath) as? PopularCollectionViewCell {
            
            cell.setup(title: popularMovies[indexPath.item].title,
                       image: UIImage())
//            e se eu n tiver imagem? posso por uma de loading tbm!
            
//            cell.titleLabel.text = popularMovies[indexPath.item].title
//            cell.image.image = UIImage(named: popularMovies[indexPath.item].backdrop)
            let movie = popularMovies[indexPath.item]
            
            Task {
                let imageData = await Movie.downloadImageData(withPath: movie.backdropPath)
                let imagem = UIImage(data: imageData) ?? UIImage()
                
                cell.setup(title: movie.title, image: imagem)
            }
            return cell
        }
        return PopularCollectionViewCell()
    }
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> NowPlayingCollectionViewCell {
        if let cell =
            nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.cellIdentifier, for: indexPath) as? NowPlayingCollectionViewCell {
            let titulo: String = nowPlayingMovies[indexPath.item].title
            let ano: String = "\(nowPlayingMovies[indexPath.item].releaseDate.prefix(4))"
            
            cell.setup(title: titulo,
                       year: ano,
                       image: UIImage(named: nowPlayingMovies[indexPath.item].posterPath) ?? UIImage())
            
//            cell.titleLabel.text = titulo
//            //            criar variavel simples com 2 clique = seleciona, da o duplo clique, aperta refactor e extrair p variavel
//            cell.dateLabel.text = "\(nowPlayingMovies[indexPath.item].releaseDate.prefix(4))"
//            //            String = "\blabbla"
//            cell.imageView.image = UIImage(named: nowPlayingMovies[indexPath.item].poster)
            
            return cell
        }
        return NowPlayingCollectionViewCell()
    }
    
    fileprivate func makeUpcomingCell(_ indexPath: IndexPath) -> UpcomingCollectionViewCell {
        if let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.cellIdentifier, for: indexPath) as? UpcomingCollectionViewCell {
            let titulo: String = upcomingMovies[indexPath.item].title
            
            cell.setup(image: UIImage(named: upcomingMovies[indexPath.item].posterPath) ?? UIImage(),
                       title: titulo,
                       data: upcomingMovies[indexPath.item].releaseDate)
//
//            cell.image.image = UIImage(named: upcomingMovies[indexPath.item].poster)
//            cell.titleLabel.text = titulo
//            cell.dateLabel.text = upcomingMovies[indexPath.item].releaseDate
            
            return cell
        }
        return UpcomingCollectionViewCell()
        //        pra fazer essa cell eu comecei linkando ela com a upcomingMovies, que tem as infos image, title label e date label, nessa ordem.
        //        começa identificando a célula da collectionview com
    }
    
    
}
