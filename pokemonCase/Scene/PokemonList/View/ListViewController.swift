//
//  ViewController.swift
//  pokemonCase
//
//  Created by İSMAİL AÇIKYÜREK on 27.03.2023.
//

import UIKit

class ListViewController: UIViewController {
    
    let listView = ListView()
    let listViewModel :ListViewModelProtocol  = ListViewModel()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view = listView
        setNavBar()
        listViewModel.delegate = self
        setTableViewDelegates()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listViewModel.fetchAllPokemonList()
    }
    func setNavBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
        title = "Pokemon List"
    }

}

extension ListViewController : ListViewModelOutputProtocol {

    func didError(_ error: String) {
       alertMessageShow(title: .error, message: error)
    }
    
    func didAllListSuccess() {
        listView.pokemonlistTableView.reloadData()
    }
    
}

// MARK: - UITableView Methods
extension ListViewController : UITableViewDelegate,UITableViewDataSource {
    func setTableViewDelegates() {
        listView.pokemonlistTableView.delegate = self
        listView.pokemonlistTableView.dataSource = self
        listView.pokemonlistTableView.rowHeight = 130
        listView.pokemonlistTableView.separatorStyle = .singleLine
        listView.pokemonlistTableView.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.identifier)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.pokemonList?.results?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listView.pokemonlistTableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier, for: indexPath) as! ListTableViewCell
        cell.listViewController = self
        cell.configure(data: (listViewModel.pokemonList?.results?[indexPath.row])!)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.detailUrl = listViewModel.pokemonList?.results?[indexPath.row].url
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
