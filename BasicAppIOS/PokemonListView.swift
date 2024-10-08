//
//  PokemonListView.swift
//  BasicAppIOS
//
//  Created by Emeric on 6/10/24.
//

import SwiftUI

struct PokemonListView: View {
    let pokemons: [PokemonCard]
        
        var body: some View {
            ScrollView {
                LazyVStack(spacing: 0) { // Eliminamos el espaciado entre tarjetas
                    ForEach(pokemons) { pokemon in
                        PokemonCardView(pokemon: pokemon)
                        
                        // Añadimos una línea separadora entre las tarjetas
                        Divider()
                            .padding(.leading, 100) // Alineamos la línea para que no toque la imagen
                    }
                }
                .padding(.vertical)
            }
            .background(Color(.systemGroupedBackground))
        }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView(pokemons: [])
    }
}
