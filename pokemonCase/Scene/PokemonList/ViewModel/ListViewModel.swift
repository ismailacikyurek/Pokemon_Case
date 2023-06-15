//
//  ListViewModel.swift
//  pokemonCase
//
//  Created by İSMAİL AÇIKYÜREK on 27.03.2023.
//

import UIKit

//MARK: Protocols
protocol ListViewModelOutputProtocol: AnyObject {
    func didError(_ error: String)
    func didAllListSuccess()
}
protocol ListViewModelProtocol: AnyObject {
    func fetchAllPokemonList()
    func fetchPokemonDetail(_ url : String)
    
    var delegate : ListViewModelOutputProtocol? {get set}
    var pokemonList : PokemonListModel? {get }
    var pokemonDetail : PokemonDetailModel? {get }
}

class ListViewModel : ListViewModelProtocol {
    
    weak var delegate : ListViewModelOutputProtocol?
    private let service : WebService = WebService()
    
    var pokemonList : PokemonListModel?
    var pokemonDetail : PokemonDetailModel?
    
    func fetchAllPokemonList() {
        service.fetchAllPokomenList { response in
            self.pokemonList = response
            self.delegate?.didAllListSuccess()
        } onFail: { error in
            self.delegate?.didError(error!.localizedDescription)
        }
    }
    
    func fetchPokemonDetail(_ url : String) {
        service.fetchPokemonDetai(url: url) { response in
            self.pokemonDetail = response
        } onFail: { error in
            self.delegate?.didError(error!.localizedDescription)
        }
    }

}

