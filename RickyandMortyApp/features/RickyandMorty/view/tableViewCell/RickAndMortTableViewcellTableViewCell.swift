//
//  RickAndMortTableViewcellTableViewCell.swift
//  RickyandMortyApp
//
//  Created by Ali Aydoğdu on 25.09.2022.
//

import UIKit
import AlamofireImage

class RickAndMortyTableViewcell: UITableViewCell {
    
    private let imageViews:UIImageView = UIImageView()
    private let title:UILabel = UILabel()
    private let descriptions:UILabel = UILabel()
    
    private let randomImage:String = "https://picsum.photos/200/300"
    
    enum Identifier:String{
        case custom = "Ali"
    }
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        addSubview(imageViews)
        addSubview(title)
        addSubview(descriptions)
        title.font = .boldSystemFont(ofSize: 20)
        descriptions.font = .italicSystemFont(ofSize: 15)
        
        imageViews.snp.makeConstraints { make in
            make.height.equalTo(140)
            make.top.equalTo(contentView)
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-40)
        }
        title.snp.makeConstraints { make in
            make.top.equalTo(imageViews.snp.bottom).offset(10);
            make.left.right.equalTo(imageViews).offset(10);
            
        }
        descriptions.snp.makeConstraints { make in
            make.top.equalTo(title).offset(5)
            make.left.right.equalTo(title)
            make.bottom.equalTo(contentView)       }
    }
    
    func saveModel(model:Result){
        title.text = model.name
        descriptions.text = model.species
        imageViews.af.setImage(withURL: URL(string: model.image ?? randomImage) ?? URL(string: randomImage)!)
    }
    
}
