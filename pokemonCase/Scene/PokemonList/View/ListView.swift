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
    lazy var title = UILabel()
    lazy var pokemonlistTableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addView()
        addTarget()
        SetupUI()
        LayoutUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
extension ListView : GeneralProtocol {
    func addView() {
        addSubviews(title,pokemonlistTableView)
    }
    
    func addTarget() {
        
    }
    
    func SetupUI() {
        self.backgroundColor = .white
        title.createLabel(text: "Pokemon List", textColor: .black, font: UIFont.systemFont(ofSize: 20), textAlignment: .left)
    }
    
    func LayoutUI() {
        titleConstraints()
        pokemonlistTableViewConstraints()
    }
    
    
}
extension ListView {
    func titleConstraints() {
        self.title.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(50)
            make.leading.equalTo(self.snp.leading).offset(36)
            make.trailing.equalTo(self.snp.trailing).offset(-36)
            make.height.equalTo(30)
        }
    }
    
    func pokemonlistTableViewConstraints() {
        self.pokemonlistTableView.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(10)
            make.leading.equalTo(self.snp.leading).offset(5)
            make.trailing.equalTo(self.snp.trailing).offset(5)
            make.bottom.equalTo(self.snp.bottom).offset(-10)
            
        }
    }
}
