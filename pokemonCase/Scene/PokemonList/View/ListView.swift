//
//  ListView.swift
//  pokemonCase
//
//  Created by İSMAİL AÇIKYÜREK on 27.03.2023.
//

import UIKit
import SnapKit

class ListView: UIView{
    
    // MARK: UIComponent
    lazy var pokemonlistTableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addView()
        addTarget()
        setupUI()
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
extension ListView : GeneralProtocol {
    func addView() {
        addSubviews(pokemonlistTableView)
    }
    
    func addTarget() {
        
    }
    
    func setupUI() {
        self.backgroundColor = .white
     
    }
    
    func layoutUI() {
        pokemonlistTableViewConstraints()
    }
    
    
}
extension ListView {

    func pokemonlistTableViewConstraints() {
        self.pokemonlistTableView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(90)
            make.leading.equalTo(self.snp.leading).offset(5)
            make.trailing.equalTo(self.snp.trailing).offset(5)
            make.bottom.equalTo(self.snp.bottom).offset(-10)
            
        }
    }
}
