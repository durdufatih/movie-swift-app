//
//  SearchPageViewModel.swift
//  MoieApp
//
//  Created by Mehmet Fatih Durdu on 16.01.2023.
//

import Foundation

final class SearchPageViewModel {
    public var resultOfData:[FilmData]=[]
    
    public func fetchDetailOfData(title : String){
        getRestData(title : title , moEndPoint : MOEndpoint.search)
        
    }
    private func getRestData(title : String, moEndPoint : MOEndpoint){
        let morequest = MORequest(endpoint: moEndPoint,queryParameters: [URLQueryItem(name: "query", value: title )])
        MOService.shared.execute(morequest, expecting: GeneralMovieResponse.self)
        { [weak self] result in
            switch result{
                case .success(let responseModel):
                    let results = responseModel
                    self!.resultOfData = results.results
                case .failure(let error):
                    print(String(describing: error))
                
            }
        }
    }
    
    public func clearData(){
        self.resultOfData = []
    }
}
