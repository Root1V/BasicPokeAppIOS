//
//  Repository.swift
//  BasicAppIOS
//
//  Created by Emeric on 6/10/24.
//

import Foundation

protocol DataRepository {
    var url: URL { get }
}

extension DataRepository {
    func getData() throws -> [PokemonCard] {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        
        return try decoder.decode([PokemonDTO].self, from: data).map(\.toCard)
        
    }
}

struct Repository: DataRepository {
    
    var url: URL {
        Bundle.main.url(forResource: "pokemon", withExtension: "json")!
    }
}

struct RepositoryTest: DataRepository {
    var url: URL {
        Bundle.main.url(forResource: "pokemon_test", withExtension: "json")!
    }
}
