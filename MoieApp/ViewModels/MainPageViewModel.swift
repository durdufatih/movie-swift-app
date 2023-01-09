//
//  MainPageViewModel.swift
//  MoieApp
//
//  Created by Mehmet Fatih Durdu on 9.01.2023.
//

import Foundation


final class MainPageViewModel {
    
    public var nowPlaying:NowApiPlayingResponse?
    
    public func fetchCharacter(){
        MOService.shared.execute(.nowplayingListRequest, expecting: NowApiPlayingResponse.self)
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
}
