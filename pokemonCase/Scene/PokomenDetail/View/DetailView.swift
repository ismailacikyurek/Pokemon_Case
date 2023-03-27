//
//  DetailView.swift
//  pokemonCase
//
//  Created by İSMAİL AÇIKYÜREK on 27.03.2023.
//

import UIKit
import SnapKit

class DetailView: UIView{
    
    // MARK: UIComponent
    lazy var mainView = UIView()
    lazy var pokomonPhotoImageView = UIImageView()
    lazy var pokomonNameLabel = UILabel()
    lazy var abilityTableView = UITableView()
    
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
extension DetailView : GeneralProtocol {
    func addView() {
        addSubviews(mainView)
        mainView.addSubviews(pokomonNameLabel,pokomonPhotoImageView,abilityTableView)
    }
    
    func addTarget() {
        
    }
    
    func SetupUI() {
        self.backgroundColor = .systemGray4
        mainView.createView(backgroundColor: .white, cornerRadius: 60, shadowColor: UIColor.gray.cgColor, shadowOffset: CGSize(width: -23, height: 24))
        pokomonPhotoImageView.createUIImageView(contentMode: .scaleToFill,maskedToBounds: true,cornerRadius: 100)
        pokomonPhotoImageView.alpha = 0.0
        pokomonNameLabel.createLabel(text: "PokemonName", textColor: .black, font: UIFont.systemFont(ofSize: 33), textAlignment: .center)
    }
    
    func LayoutUI() {
        mainViewConstraints()
        pokomonPhotoImageViewConstraints()
        pokomonNameLabelConstraints()
        abilityTableViewConstraints()
    }
    
    
}
extension DetailView {
    func animatePhotoImageView() {
        UIView.animate(withDuration: 3.0, delay: 0.5, options: .curveEaseOut, animations: { [self] in
            pokomonPhotoImageView.alpha = 1.0
        })
    }
}
extension DetailView {
    func mainViewConstraints() {
        self.mainView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(120)
            make.bottom.equalTo(self.snp.bottom).offset(-120)
            make.leading.equalTo(self.snp.leading).offset(10)
            make.trailing.equalTo(self.snp.trailing).offset(-10)
        }
    }
    
    func pokomonPhotoImageViewConstraints() {
        self.pokomonPhotoImageView.snp.makeConstraints { make in
            make.top.equalTo(mainView.snp.top).offset(-80)
            make.centerX.equalTo(mainView.snp.centerX).offset(0)
            make.width.height.equalTo(200)
            
        }
    }
  
    func pokomonNameLabelConstraints() {
        self.pokomonNameLabel.snp.makeConstraints { make in
            make.top.equalTo(pokomonPhotoImageView.snp.bottom).offset(10)
            make.centerX.equalTo(mainView.snp.centerX).offset(0)
            make.height.equalTo(40)
            make.width.equalTo(240)
            
        }
    }
    func abilityTableViewConstraints() {
        self.abilityTableView.snp.makeConstraints { make in
            make.top.equalTo(pokomonNameLabel.snp.bottom).offset(0)
            make.centerX.equalTo(mainView.snp.centerX).offset(0)
            make.bottom.equalTo(mainView.snp.bottom).offset(-40)
            make.width.equalTo(mainView).offset(-10)
            
        }
    }
}
