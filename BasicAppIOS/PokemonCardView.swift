//
//  PokemonListView.swift
//  BasicAppIOS
//
//  Created by Emeric on 6/10/24.
//

import SwiftUI

struct PokemonCardView: View {
    
    let pokemon: PokemonCard
    @State private var isExpanded: Bool = false
        
    var body: some View {
            VStack {
                // Tarjeta compacta con información básica
                HStack(alignment: .top, spacing: 15) {
                    // Imagen del Pokémon
                    AsyncImage(url: URL(string: pokemon.image475)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 105)
                            .clipShape(Circle())
                            
                    } placeholder: {
                        ProgressView()
                    }.background(Color.gray.opacity(0.1))
                    
                    // Información básica del Pokémon
                    VStack(alignment: .leading, spacing: 5) {
                        // Nombre del Pokémon
                        
                        HStack {
                            Text(pokemon.name.capitalized)
                                .font(.headline)
                                .fontWeight(.bold)
                            Text("#\(pokemon.id)")
                                .font(.subheadline)
                        }
                        
                        
                        // Tipos del Pokémon
                        HStack {
                            ForEach(pokemon.types, id: \.self) { type in
                                Text(type.capitalized)
                                    .font(.caption)
                                    .padding(5)
                                    .background(Color.green.opacity(0.2))
                                    .cornerRadius(10)
                            }
                        }
                        
                        // Poder calculado
                        HStack {
                            Text("Power:")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                            Text("\(pokemon.calcPower(), specifier: "%.2f")")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                        }
                    }.padding()
                }
                    
                
                // Mostrar más información cuando está expandido
                if isExpanded {
                    VStack(alignment: .leading, spacing: 5) {
                        // Habilidades
                        HStack {
                            Text("Abilities:")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                            Text(pokemon.abilities.joined(separator: ", "))
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                        
                        // Altura y Peso
                        HStack {
                            Text("Height:")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                            Text("\(pokemon.height, specifier: "%.2f")m")
                                .font(.footnote)
                                .foregroundColor(.gray)
                            
                            Text("Weight:")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                            Text("\(pokemon.weight, specifier: "%.1f")kg")
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                        
                        // Fortalezas y Debilidades
                        HStack {
                            Text("Strengths:")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                            Text(pokemon.strengths.joined(separator: ", "))
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                        
                        HStack {
                            Text("Weaknesses:")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                            Text(pokemon.weaknesses.joined(separator: ", "))
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                        
                        // Evoluciones
                        if !pokemon.evolutions.isEmpty {
                            HStack {
                                Text("Evolutions:")
                                    .font(.footnote)
                                    .fontWeight(.bold)
                                    .foregroundColor(.blue)
                                Text(pokemon.evolutions.joined(separator: " → "))
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        // Stats del Pokémon
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Stats:")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                            StatView(statName: "HP", value: pokemon.stats.hp)
                            StatView(statName: "Attack", value: pokemon.stats.attack)
                            StatView(statName: "Defense", value: pokemon.stats.defense)
                            StatView(statName: "Sp. Atk", value: pokemon.stats.specialAttack)
                            StatView(statName: "Sp. Def", value: pokemon.stats.specialDefense)
                            StatView(statName: "Speed", value: pokemon.stats.speed)
                        }
                    }
                    .transition(.slide) // Transición visual al expandir/contraer
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .onTapGesture {
                withAnimation {
                    isExpanded.toggle()
                }
            }
        }
}

struct PokemonCardView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCardView(pokemon: .test)
    }
}
