//
//  RickMortyService.swift
//  RickandMortyApp
//
//  Created by Ali Aydoğdu on 24.09.2022.
//

import Alamofire

enum RickMortyServiceEndPoint:String{
    case BASE_URL = "https://rickandmortyapi.com/api"
       case PATH = "/character"

       static func characterPath() -> String {
           return "\(BASE_URL.rawValue)\(PATH.rawValue)"
       }
}

protocol IRickMortyService{
    func fetchAllData(response: @escaping ([Result]?) -> Void)
}
struct RickMortyService:IRickMortyService{
    func fetchAllData(response:@escaping([Result]?) -> Void) {
        AF.request(RickMortyServiceEndPoint.characterPath()).responseDecodable(of: PostModel.self) {(model) in
            guard let data = model.value else{
                response(nil)
                return
            }
            response(data.results)
        }
    }
    
    
}
