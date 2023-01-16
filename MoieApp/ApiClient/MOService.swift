//
//  RMService.swift
//  RickyAndMorty
//
//  Created by Mehmet Fatih Durdu on 29.12.2022.
//

import Foundation
final class MOService{
    
    static let shared = MOService()
    private init(){
        
    }
    enum MOServiceError : Error{
        case failedToCreateRequest
        case failedToGetData
    }
    public func execute<T:Codable>(
        _ request : MORequest ,
        expecting type:T.Type,
        completion:@escaping (Result<T,Error>)->Void
    ){
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(MOServiceError.failedToCreateRequest))
            return
        }

        let task = URLSession.shared.dataTask(with: urlRequest){data,_,error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? MOServiceError.failedToGetData))
                return
            }
            do{
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            }
            catch{
                completion(.failure(error))
            }
        }
        task.resume() 
    }
    private func request(from rmRequest : MORequest) -> URLRequest? {
        guard let url = rmRequest.url else { return nil}
        var request = URLRequest(url:url)
        request.httpMethod = rmRequest.httpMethod
        
        return request
    }
}
