//
//  RickyMortyViewModel.swift
//  RickyandMortyApp
//
//  Created by Ali Aydoğdu on 24.09.2022.
//

import Foundation

protocol IRickyMortyViewModel{
    func fetchItems()
    func changeLoading()
    
    var rickyMortyCharacters: [Result] {
        get set
    }
    var rickyMortyServcice: IRickyMortyService {
        get
    }
}
class RickyMortyViewModel:IRickyMortyViewModel{
    
    
    var rickyMortyCharacters: [Result]=[]
    let rickyMortyServcice: IRickyMortyService
    
    init(){
        rickyMortyServcice = RickyMortyService()
    }
    func fetchItems() {
        changeLoading()
        rickyMortyServcice.fetchAllData { (response) in
            changeLoading()
            rickyMortyCharacters = response ?? []
        }
    }
    
    func changeLoading() {
        <#code#>
    }
    
    
    
