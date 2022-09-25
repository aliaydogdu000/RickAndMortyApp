//
//  RickMortyViewModel.swift
//  RickandMortyApp
//
//  Created by Ali Aydoğdu on 24.09.2022.
//

import Foundation

protocol IRickMortyViewModel{
    func fetchItems()
    func changeLoading()
    
    var rickMortyCharacters: [Result] {
        get set
    }
    var RickMortyServcice: IRickMortyService {
        get
    }
    
    var rickandMortyOutPut: RickMortyOutPut? {
        get
    }
    func setDelegate(output:RickMortyOutPut)
}

final class RickMortyViewModel:IRickMortyViewModel{
    var rickandMortyOutPut: RickMortyOutPut?
    
    
    func setDelegate(output: RickMortyOutPut) {
        rickandMortyOutPut = output
    }
    
    
    
    var rickMortyCharacters: [Result]=[]
    private var isLoading = false
    let RickMortyServcice: IRickMortyService
    
    init(){
        RickMortyServcice = RickMortyService()
    }
    func fetchItems() {
        changeLoading()
        RickMortyServcice.fetchAllData { [weak self](response) in
            self?.changeLoading()
            self?.rickMortyCharacters = response ?? []
            self?.rickandMortyOutPut?.saveDatas(values: self?.rickMortyCharacters ?? [])
        }
    }
    
    func changeLoading() {
        isLoading = !isLoading
        rickandMortyOutPut?.changeLoading(isLoad: isLoading)
    }
    
    
}
