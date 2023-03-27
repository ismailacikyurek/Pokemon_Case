//
//  DetailViewModel.swift
//  pokemonCase
//
//  Created by İSMAİL AÇIKYÜREK on 27.03.2023.
//


import Kingfisher
import UIKit

//MARK: Protocols
protocol DetailViewModelProtocol: AnyObject {
    func didError(_ error: String)
    func didDetailSuccess(pokemonDetail : PokemonDetailModel?)
}

class DetailViewModel {
    
    weak var delegate : DetailViewModelProtocol?
    private let service : WebService = WebService()
 
    var pokemonDetail : PokemonDetailModel?
    
    func fetchPokemonDetail(_ url : String) {
        service.fetchPokemonDetai(url: url) { response in
            self.pokemonDetail = response
            self.delegate?.didDetailSuccess(pokemonDetail: self.pokemonDetail)
        } onFail: { error in
            self.delegate?.didError(error!.localizedDescription)
        }


    }

}

