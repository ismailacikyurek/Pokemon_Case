//
//  DetailViewModel.swift
//  pokemonCase
//
//  Created by İSMAİL AÇIKYÜREK on 27.03.2023.
//


import UIKit

//MARK: Protocols
protocol DetailViewModelProtocol: AnyObject {
    func didError(_ error: String)
    func didDetailSuccess(pokemonDetail : PokemonDetailModel?)
}

class DetailViewModel {
    
    weak var delegate : DetailViewModelProtocol?
    private let service : WebService = WebService()
    
    var pokemonDetailModel : PokemonDetailModel?
    
    func fetchPokemonDetail(_ url : String) {
        service.fetchPokemonDetai(url: url) { response in
            self.pokemonDetailModel = response
            self.delegate?.didDetailSuccess(pokemonDetail: self.pokemonDetailModel)
        } onFail: { error in
            self.delegate?.didError(error!.localizedDescription)
        }
    }
}
