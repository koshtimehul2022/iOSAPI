//
//  jokeAPI.swift
//  ApiTest
//
//  Created by Kaushik Barad on 26/09/24.
//

import Foundation
import Alamofire

func callAPI(completionHandler: @escaping(Result<[JokeModel], Error>) -> Void){
    let urlstr = callType()
    AF.request(urlstr).responseDecodable(of: [JokeModel].self) {response in
    
        switch response.result {
        case .success(let data):
            completionHandler(.success(data))
            
        case .failure(let error):
            completionHandler(.failure(error))
        }
    }
    
    
    func callType() -> String{
        let jtype = "programming"
        let url = "https://official-joke-api.appspot.com/jokes/"+(jtype)+"/ten"
        return url
    }
}
