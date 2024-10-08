//
//  ContentView.swift
//  BasicAppIOS
//
//  Created by Emeric on 5/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel  = PokemonCardVM()
    
    var body: some View {
        PokemonListView(pokemons: viewModel.pokemons)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //ContentView()
        ContentView(viewModel: PokemonCardVM(repository: RepositoryTest()))
    }
}
