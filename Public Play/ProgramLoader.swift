//
//  ProgramLoader.swift
//  Public Play
//
//  Created by Anders Frank on 2022-03-25.
//

import Foundation

struct ProgramLoader {
    static func load(withProviderLimit limit: Int) -> [Program] {
        let programs = loadURPrograms().takeFirst(limit)
        + loadSRPrograms().takeFirst(limit)
        + loadSVTPrograms().takeFirst(limit)
        return programs.shuffled()
    }
    
    private static func loadURPrograms() -> [Program] {
        guard let products = SearchResponse.loadJSON()?.results else  { return [] }
        return products.compactMap { Program(urProduct: $0) }
    }
    private static func loadSRPrograms() -> [Program] {
        guard let srPrograms = SRPopular.loadJSON()?.collection else  { return [] }
        return srPrograms.compactMap({ Program(srProgram: $0) })
        
    }
    private static func loadSVTPrograms() -> [Program] {
        guard
            let welcome = try? Welcome.loadJSON(),
            let items =  welcome.data.startForSvtPlay.selections.first?.items
        else { return [] }
        return items.compactMap { Program(svtProgram: $0) }
    }
}

private extension Array where Element == Program {
    func takeFirst(_ limit: Int) -> [Program] {
        return Array(prefix(limit))
    }
}
