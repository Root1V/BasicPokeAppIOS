//
//  Model.swift
//  BasicAppIOS
//
//  Created by Emeric on 5/10/24.
//

import Foundation

struct PokemonDTO: Codable {
    let id:Int
    let name:String
    let image96: String
    let image475: String
    let icon: String
    let types: [String]
    let abilities: [String]
    let stats: StatsDTO
    let height: Double
    let weight: Double
    let strengths: [String]
    let weaknesses: [String]
    let evolutions: [String]
    
    enum CodingKeys: String, CodingKey{
        case id
        case name
        case image96 = "image_96"
        case image475 = "image_475"
        case icon
        case types
        case abilities
        case stats
        case height
        case weight
        case strengths
        case weaknesses
        case evolutions
    }
}



struct StatsDTO: Codable{
    let hp:Int
    let attack: Int
    let defense: Int
    let specialAttack: Int
    let specialDefense: Int
    let speed: Int
    
    enum CodingKeys: String, CodingKey{
        case hp
        case attack
        case defense
        case specialAttack = "special-attack"
        case specialDefense = "special-defense"
        case speed
    }
}

extension PokemonDTO {
    var toCard: PokemonCard {
        PokemonCard(from: self)
    }
}

struct PokemonCard: Identifiable, Hashable{
    let id:Int
    let name:String
    let image96: String
    let image475: String
    let icon: String
    let types: [String]
    let abilities: [String]
    let stats: StatsCard
    let height: Double
    let weight: Double
    let strengths: [String]
    let weaknesses: [String]
    let evolutions: [String]
    
    init(from pokemon: PokemonDTO) {
        self.id = pokemon.id
        self.name = pokemon.name
        self.image96 = pokemon.image96 // Usar la imagen de mayor resolución
        self.image475 = pokemon.image475 // Usar la imagen de mayor resolución
        self.icon = pokemon.icon
        self.types = pokemon.types
        self.abilities = pokemon.abilities
        self.stats = StatsCard(from: pokemon.stats)
        self.height = pokemon.height
        self.weight = pokemon.weight
        self.strengths = pokemon.strengths
        self.weaknesses = pokemon.weaknesses
        self.evolutions = pokemon.evolutions
    }
    
    func calcPower() -> Double {
        let baseStats = Double(stats.hp + stats.attack + stats.defense + stats.specialAttack + stats.specialDefense + stats.speed)
        
        let numStre = Double(strengths.count)
        let numWeak = Double(weaknesses.count)
        
        let power = baseStats * (1 + 0.1 * numStre - 0.1 * numWeak)
        
        return power
    }
}

extension PokemonCard {
    static let test = PokemonCard(from: PokemonDTO(id: 369, name: "Charizar", image96: "http://image1.png", image475: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/6.png", icon: "http://image3.png", types: ["Fuego", "Aire"], abilities: ["Volar", "Fuerza"], stats: StatsDTO(hp: 100, attack: 46, defense: 67, specialAttack: 34, specialDefense: 65, speed: 300), height: 12.3, weight: 40.5, strengths: ["Fuerza", "Tamaño"], weaknesses: ["Agua", "Aire"], evolutions: ["Charmander", "Charmeleon", "Charizar"]))
}

struct StatsCard: Codable, Hashable{
    let hp:Int
    let attack: Int
    let defense: Int
    let specialAttack: Int
    let specialDefense: Int
    let speed: Int
    
    init(from stat: StatsDTO){
        self.hp = stat.hp
        self.attack = stat.attack
        self.defense = stat.defense
        self.specialAttack = stat.specialAttack
        self.specialDefense = stat.specialDefense
        self.speed = stat.speed
    }
}
