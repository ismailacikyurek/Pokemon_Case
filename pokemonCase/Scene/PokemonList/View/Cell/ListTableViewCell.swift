//
//  ListTableViewCell.swift
//  pokemonCase
//
//  Created by İSMAİL AÇIKYÜREK on 27.03.2023.
//

import UIKit
import Kingfisher
import SnapKit

class ListTableViewCell: UITableViewCell {
    
    static let identifier = "ListTableViewCell"
    
    // MARK: UIComponent
    lazy var iconImageView = UIImageView()
    lazy var pokemonNameLabel = UILabel()
    lazy var rightOkImageView = UIImageView()
    let shapeLayer = CAShapeLayer()
    
    var listViewController  : ListViewController?

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func updateUI(url : String) {
        WebService().fetchPokemonDetai(url: url) { detail in
            self.iconImageView.kf.setImage(with: URL(string:(detail?.sprites.front_default)! ))
        } onFail: { err in
            print("error")
        }
    }
    
    func configure(data : Result) {
        addView()
        addTarget()
        setupUI()
        layoutUI()
        self.photoframeAnimate()
        self.pokemonNameLabel.text = data.name?.uppercased()
        self.updateUI(url: data.url!)
    }
    func photoframeAnimate() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 2
        animation.duration = 3
        shapeLayer.add(animation,forKey: "animation")
    }

}

extension ListTableViewCell : GeneralProtocol {
    func addView() {
        addSubviews(iconImageView,pokemonNameLabel,rightOkImageView)
        self.layer.addSublayer(shapeLayer)
    }
    
    func addTarget() {}
    
    func setupUI() {
        self.iconImageView.createUIImageView(contentMode: .scaleToFill, maskedToBounds: true, cornerRadius: 50, borderColor: UIColor.black.cgColor, borderWidth : 0.6)
        self.pokemonNameLabel.createLabel(text: "",textColor: .black, textAlignment: .left)
        rightOkImageView.createUIImageView(image: UIImage(systemName: "chevron.right"),tintColor: .gray)

        let circularPath = UIBezierPath(arcCenter: CGPoint(x: 54, y: 71), radius: 50, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 4
        shapeLayer.strokeEnd = 0
        shapeLayer.fillColor = UIColor.clear.cgColor
    }
    
    func layoutUI() {
        iconImageViewConstraints()
        pokemonNameLabelConstraints()
        rightOkImageViewConstraints()
    }
    
}
extension ListTableViewCell {
    func iconImageViewConstraints() {
        self.iconImageView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(20)
            make.leading.equalTo(self.snp.leading).offset(5)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
    }
    
    func pokemonNameLabelConstraints() {
        self.pokemonNameLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.top).offset(10)
            make.leading.equalTo(iconImageView.snp.trailing).offset(5)
            make.trailing.equalTo(self.snp.trailing).offset(-5)
            make.height.equalTo(80)
            
        }
    }
    func rightOkImageViewConstraints() {
        self.rightOkImageView.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY).offset(0)
            make.trailing.equalTo(self.snp.trailing).offset(-10)
            make.height.width.equalTo(20)
            
        }
    }
}

