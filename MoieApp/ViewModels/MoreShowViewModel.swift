//
//  MoreShowViewModel.swift
//  MoieApp
//
//  Created by Mehmet Fatih Durdu on 13.01.2023.
//

import Foundation

final class MoreShowViewModel {
    
    public var resultOfData:[FilmData]=[]
    public var loadingData = true
    
    
    public func fetchDetailOfData(moModelType:String,completion:@escaping (Bool)->Void){
        let pageActual = (self.resultOfData.count / 20) + 1
        getRestData(page: pageActual, moEndPoint: moModelType == "morePopular" ? MOEndpoint.popular: MOEndpoint.now_playing,completion: completion)
        
    }
    private func getRestData(page:Int,moEndPoint:MOEndpoint,completion:@escaping (Bool)->Void){
        let morequest = MORequest(endpoint: moEndPoint,queryParameters: [URLQueryItem(name: "page", value: String(describing: page) )])
        MOService.shared.execute(morequest, expecting: GeneralMovieResponse.self)
        { [weak self] result in
            switch result{
                case .success(let responseModel):
                    let results = responseModel
                    self!.resultOfData.append(contentsOf: results.results)
                    self!.loadingData=false
                    completion(self!.loadingData)
                case .failure(let error):
                    print(String(describing: error))
                
            }
        }
    }
}
