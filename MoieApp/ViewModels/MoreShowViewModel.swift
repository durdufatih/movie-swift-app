//
//  MoreShowViewModel.swift
//  MoieApp
//
//  Created by Mehmet Fatih Durdu on 13.01.2023.
//

import Foundation

final class MoreShowViewModel {
    
    public var resultOfData:[FilmData]=[]
    
    
    public func fetchDetailOfData(moModelType:String){
        let pageActual = (self.resultOfData.count / 20) + 1
        getRestData(page: pageActual, moEndPoint: moModelType == "morePopular" ? MOEndpoint.popular: MOEndpoint.now_playing)
        
    }
    private func getRestData(page:Int,moEndPoint:MOEndpoint){
        let morequest = MORequest(endpoint: moEndPoint,queryParameters: [URLQueryItem(name: "page", value: String(describing: page) )])
        MOService.shared.execute(morequest, expecting: GeneralMovieResponse.self)
        { [weak self] result in
            switch result{
                case .success(let responseModel):
                    let results = responseModel
                    self?.resultOfData.append(contentsOf: results.results)
                case .failure(let error):
                    print(String(describing: error))
                
            }
        }
    }
}
