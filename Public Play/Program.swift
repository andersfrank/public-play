//
//  Article.swift
//  Public Play
//
//  Created by Anders Frank on 2022-03-24.
//

import Foundation
import SwiftUI

struct Program: Identifiable {
    enum Provider {
        case sr
        case svt
        case ur
    }
    
    var id: Int
    var title: String
    var description: String
    var image: URL
    var url: URL?
    var provider: Provider
    init(id: Int, title: String, description: String, image: URL, url: URL?, provider: Provider) {
        self.id = id
        self.title = title
        self.description = description
        self.image = image
        self.url = url
        self.provider = provider
    }
}

extension Program {
    init?(urProduct product: Product) {
        guard
            let id = product.id,
            let image = product.derived_urlForImageSize(._480x270)
        else { return nil }
        self.id = id
        self.title = product.title ?? ""
        self.description = product.usp ?? ""
        self.image = image
        self.url = URL(string: "https://urplay.se/program/\(id)")
        self.provider = .ur
    }
}

extension Program {
    init(srProgram program: SRProgram) {
        self.id = Int(program.id)!
        self.title = program.title
        self.description = program.description
        self.image = program.image
        self.url = program.url
        self.provider = .sr
    }
}

extension Program {
    init?(svtProgram program: ItemElement) {
        guard let idFirst = program.item.id.split(separator: "-").first else { return nil}
        guard let id = Int(idFirst) else { return nil }
        
        self.id = id
        self.title = program.heading
        self.description = program.subHeading
        self.image = URL(string: "https://www.svtstatic.se/image/original/400/\(program.images.wide.id)/\(program.images.wide.changed)")!
        self.url = URL(string: "https://www.svtplay.se\(program.item.urls.svtplay)")
        self.provider = .svt
    }
}


