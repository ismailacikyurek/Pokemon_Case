//
//  ViewController.swift
//  pokemonCase
//
//  Created by İSMAİL AÇIKYÜREK on 27.03.2023.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    let service = WebService()
    override func viewDidLoad() {
        super.viewDidLoad()

        service.fetchAllPokomenList { err in
            
        } onFail: { er in
            
        }

    }


}

