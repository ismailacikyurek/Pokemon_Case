//
//  AlertMessage.swift
//  pokemonCase
//
//  Created by İSMAİL AÇIKYÜREK on 27.03.2023.
//

import UIKit
    
class AlertMessage {
    static func alertMessageShow(title : successOrError,message : String,vc: UIViewController) {
        let alert = UIAlertController(title: title.rawValue, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(ok)
        vc.present(alert, animated: true)
    }
}

enum successOrError : String {
    case error = "Error"
    case success = "Success"
}
