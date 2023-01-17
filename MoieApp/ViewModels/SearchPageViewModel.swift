//
//  SearchPageViewModel.swift
//  MoieApp
//
//  Created by Mehmet Fatih Durdu on 16.01.2023.
//

import Foundation

final class SearchPageViewModel {
    public var resultOfData:[FilmData]=[]
    public var loadingData = true
    
    public func fetchDetailOfData(title : String,completion:@escaping (Bool)->Void){
        let morequest = MORequest(endpoint: MOEndpoint.search,queryParameters: [URLQueryItem(name: "query", value: title )])
        MOService.shared.execute(morequest, expecting: GeneralMovieResponse.self)
        { [weak self] result in
            switch result{
                case .success(let responseModel):
                    let results = responseModel
                    self!.resultOfData = results.results
                    self!.loadingData = false
                    completion(self!.loadingData)
                case .failure(let error):
                    print(String(describing: error))
                
            }
        }
    }
    
    public func clearData(){
        self.resultOfData = []
    }
}
