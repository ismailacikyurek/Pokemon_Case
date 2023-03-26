//
//  WebService.swift
//  pokemonCase
//
//  Created by İSMAİL AÇIKYÜREK on 27.03.2023.
//


import Alamofire
import UIKit


struct Constants {
    //MARK: API Constants
    static let BaseUrl = "https://pokeapi.co/api/v2/pokemon?limit=30"
}

public class WebService:NSObject{
    let service: PokemonServiceProtokol = PokemonDataService()
    
    public func fetchAllPokomenList(success: @escaping (PokemonListModel?) -> Void,onFail: @escaping (Error?) -> Void){
        service.fethAllPosts(url: Constants.BaseUrl ) { (b: PokemonListModel) in
            success(b)
        } onFail: { error in
            onFail(error)
        }
    }
    
    public func fetchPokemonDetai(url : String,success: @escaping (PokemonDetailModel?) -> Void,onFail: @escaping (Error?) -> Void) {
        service.fethAllPosts(url: url ) { (b: PokemonDetailModel) in
            success(b)
        } onFail: { error in
            onFail(error)
        }
    }
  
}

