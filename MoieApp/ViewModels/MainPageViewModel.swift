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
    public var loadingPlaying = true
    public var loadingPopular = true
    
    public func fetchCharacter(completion:@escaping (Bool)->Void){
        MOService.shared.execute(.nowplayingListRequest, expecting: GeneralMovieResponse.self)
        { [weak self] result in
            switch result{
                case .success(let responseModel):
                    let results = responseModel
                    self?.nowPlaying = results
                    self?.loadingPlaying = false
                    completion(self!.loadingPlaying)
                case .failure(let error):
                    print(String(describing: error))
                
            }
        }
        
        
    }
    
    public func getPopular(completion:@escaping (Bool)->Void){
        MOService.shared.execute(.popularMoviesRequest, expecting: GeneralMovieResponse.self)
        { [weak self] result in
            switch result{
                case .success(let responseModel):
                    let results = responseModel
                    self?.popularMovies = results
                    self?.loadingPopular=false
                    completion(self!.loadingPopular)
                case .failure(let error):
                    print(String(describing: error))
            }
        }
    }
}
