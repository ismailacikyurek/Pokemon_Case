//
//  DetailViewController.swift
//  pokemonCase
//
//  Created by İSMAİL AÇIKYÜREK on 27.03.2023.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {

    let detailView = DetailView()
    let detailViewModel : DetailViewModelProtocol = DetailViewModel()
    
    var detailUrl : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = detailView
        detailViewModel.delegate = self
        setNavBar()
        setTableViewDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let url = self.detailUrl {
            detailViewModel.fetchPokemonDetail(url)
        }
        
    }
    func setNavBar() {
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

extension DetailViewController : DetailViewModelOutputProtocol {
    func didDetailSuccess(pokemonDetail: PokemonDetailModel?) {
        detailView.abilityTableView.reloadData()
        detailView.pokomonNameLabel.text = pokemonDetail?.name.uppercased()
        detailView.pokomonPhotoImageView.kf.setImage(with: URL(string:(pokemonDetail?.sprites.other.home.front_default)!))
        detailView.animatePhotoImageView()
    }
    
    func didError(_ error: String) {
        alertMessageShow(title: .error, message: error)
    }
}


// MARK: - UITableView Methods
extension DetailViewController : UITableViewDelegate,UITableViewDataSource {
    func setTableViewDelegates() {
        detailView.abilityTableView.delegate = self
        detailView.abilityTableView.dataSource = self
        detailView.abilityTableView.rowHeight = 40
        detailView.abilityTableView.separatorStyle = .singleLine
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailViewModel.pokemonDetailModel?.abilities.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = detailViewModel.pokemonDetailModel?.abilities[indexPath.row].ability.name
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if detailViewModel.pokemonDetailModel?.abilities.count == 0 {
            return "Abilities Not Found"
        } else {
           return "Ability"
        }
    }
}

