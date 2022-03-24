//
//  SRModels.swift
//  Public Play
//
//  Created by Anders Frank on 2022-03-24.
//

import Foundation

struct SRPopular: Codable {
    var title: String
    var collection: [SRProgram]
}

struct SRProgram: Codable {
    var id: String
    var title: String
    var description: String
    var image: URL
    var url: URL
}

extension SRPopular {
    static func loadJSON() -> SRPopular? {
        guard
            let path = Bundle.main.path(forResource: "sr-popular-2022-03-24", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        else { return nil }
        return try? JSONDecoder.standard.decode(SRPopular.self, from: data)
    }
}
