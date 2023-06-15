//
//  DetailViewModel.swift
//  pokemonCase
//
//  Created by İSMAİL AÇIKYÜREK on 27.03.2023.
//


import UIKit

//MARK: Protocols
protocol DetailViewModelOutputProtocol: AnyObject {
    func didError(_ error: String)
    func didDetailSuccess(pokemonDetail : PokemonDetailModel?)
}
protocol DetailViewModelProtocol: AnyObject {
    var delegate : DetailViewModelOutputProtocol? {get set}
    var pokemonDetailModel : PokemonDetailModel? {get }
    func fetchPokemonDetail(_ url : String)
}

class DetailViewModel : DetailViewModelProtocol {

    weak var delegate : DetailViewModelOutputProtocol?
    private let service : WebService = WebService()
    var pokemonDetailModel : PokemonDetailModel?
    
    func fetchPokemonDetail(_ url : String) {
        service.fetchPokemonDetai(url: url) { response in
            self.pokemonDetailModel = response
            self.delegate?.didDetailSuccess(pokemonDetail: response)
        } onFail: { error in
            self.delegate?.didError(error!.localizedDescription)
        }
    }
}
