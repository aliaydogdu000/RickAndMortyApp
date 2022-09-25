//
//  RickandMortyViewController.swift
//  RickandMortyApp
//
//  Created by Ali Aydoğdu on 24.09.2022.
//

import UIKit
import SnapKit


protocol RickMortyOutPut{
    func changeLoading(isLoad:Bool)
    func saveDatas(values:[Result])
}

class RickandMortyViewController: UIViewController {
    private let labelTitle:UILabel = UILabel()
    private let tableView:UITableView = UITableView()
    private let indicator:UIActivityIndicatorView = UIActivityIndicatorView()
    
    private lazy var results:[Result] = []
    lazy var viewMoodel:IRickMortyViewModel = RickMortyViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        viewMoodel.setDelegate(output: self)
        viewMoodel.fetchItems()
    }
    
    func configure(){
        view.addSubview(labelTitle)
        view.addSubview(tableView)
        view.addSubview(indicator)
        
        drawDesign()
        makeTableView()
        makeIndicator()
        makeTitleLabel()
        
    }
    private func drawDesign(){
        
        tableView.dataSource=self
        tableView.delegate=self
        tableView.register(RickAndMortyTableViewcell.self, forCellReuseIdentifier: RickAndMortyTableViewcell.Identifier.custom.rawValue)
        tableView.rowHeight = 200
        DispatchQueue.main.async {
            self.view.backgroundColor = .white
            self.labelTitle.font = .boldSystemFont(ofSize: 25)
            self.labelTitle.text = "Rick And Morty Characters"
            self.indicator.color = .red
        }
        indicator.startAnimating()
        
    }
   

}
extension RickandMortyViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell : RickAndMortyTableViewcell = tableView.dequeueReusableCell(withIdentifier: RickAndMortyTableViewcell.Identifier.custom.rawValue) as? RickAndMortyTableViewcell else {
            return UITableViewCell()
        }
       
        cell.saveModel(model: results[indexPath.row])
        return cell
    }
    
    
}

extension RickandMortyViewController:RickMortyOutPut{
    func changeLoading(isLoad: Bool) {
        isLoad ?indicator.startAnimating():indicator.stopAnimating()
    }
    
    func saveDatas(values: [Result]) {
        results = values
        tableView.reloadData()
    }
    
    
}

extension RickandMortyViewController{
    private func makeTitleLabel(){
        labelTitle.snp.makeConstraints{ (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
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
    private func makeTableView(){
        tableView.snp.makeConstraints{(make)in
            make.top.equalTo(labelTitle.snp.bottom).offset(5)
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
        
    }
}
