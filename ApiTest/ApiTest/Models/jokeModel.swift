//
//  jokeModel.swift
//  ApiTest
//
//   Created by admin on 22/10/24.
//

import Foundation

struct JokeModel: Codable{
    let id : Int
    let type : String
    let setup : String
    let punchline : String
}
