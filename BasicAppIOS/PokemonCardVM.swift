//
//  PokemonCardVM.swift
//  BasicAppIOS
//
//  Created by Emeric on 6/10/24.
//

import SwiftUI

final class PokemonCardVM: ObservableObject{
    let repository: DataRepository
    @Published var pokemons : [PokemonCard] = []
    
    init(repository: DataRepository = Repository()) {
        self.repository = repository
        do {
            pokemons = try repository.getData()
        } catch {
            pokemons = []
        }
    }
}
