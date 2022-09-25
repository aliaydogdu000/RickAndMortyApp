//
//  RickyandMortyViewController.swift
//  RickyandMortyApp
//
//  Created by Ali Aydoğdu on 24.09.2022.
//

import UIKit
import SnapKit

class RickyandMortyViewController: UIViewController {
    private let labelTitle:UILabel = UILabel()
    private let box:UIView = UIView()
    private let indicator:UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()

    }
    
    func configure(){
        view.addSubview(labelTitle)
        view.addSubview(box)
        view.addSubview(indicator)
        drawDesign()
        makeBox()
        makeIndicator()
        makeTitleLabel()
        
    }
    private func drawDesign(){
        
        DispatchQueue.main.async {
            self.box.backgroundColor = .red
            self.view.backgroundColor = .white
            self.labelTitle.text = "ALİ"
            self.indicator.color = .red
        }
        indicator.startAnimating()
        
    }
   

}
extension RickyandMortyViewController{
    private func makeTitleLabel(){
        labelTitle.snp.makeConstraints{ (make) in
            make.top.equalToSuperview().offset(50)
            make.left.equalTo(10)
            make.right.equalToSuperview()
            make.height.greaterThanOrEqualTo(15)
            
        }
    }
    private func makeIndicator(){
        indicator.snp.makeConstraints{(make) in
            make.height.equalTo(labelTitle)
            make.right.equalTo(-10)
            make.top.equalTo(labelTitle)
        }
    }
    private func makeBox(){
        box.snp.makeConstraints{(make)in
            make.top.equalTo(labelTitle.snp.bottom).offset(5)
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
        
    }
}
