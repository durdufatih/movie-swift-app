//
//  MainPageViewModel.swift
//  MoieApp
//
//  Created by Mehmet Fatih Durdu on 9.01.2023.
//

import Foundation


final class MainPageViewModel {
    
    public var nowPlaying:GeneralMovieResponse?
    public var popularMovies:GeneralMovieResponse?
    
    public func fetchCharacter(){
        MOService.shared.execute(.nowplayingListRequest, expecting: GeneralMovieResponse.self)
        { [weak self] result in
            switch result{
                case .success(let responseModel):
                    let results = responseModel
                    self?.nowPlaying = results
                case .failure(let error):
                    print(String(describing: error))
                
            }
        }
        
        
    }
    
    public func getPopular(){
        MOService.shared.execute(.popularMoviesRequest, expecting: GeneralMovieResponse.self)
        { [weak self] result in
            switch result{
                case .success(let responseModel):
                    let results = responseModel
                    self?.popularMovies = results
                case .failure(let error):
                    print(String(describing: error))
            }
        }
    }
}
