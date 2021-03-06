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
        
        var image: String {
            switch self {
            case .sr: return "srplay"
            case .svt: return "svtplay"
            case .ur: return "urplay"
            }
        }
    }
    
    var id: Int
    var title: String
    var description: String
    var longDescription: String
    var image: URL
    var url: URL?
    var provider: Provider
    init(id: Int, title: String, description: String, longDescription: String, image: URL, url: URL?, provider: Provider) {
        self.id = id
        self.title = title
        self.description = description
        self.longDescription = longDescription
        self.image = image
        self.url = url
        self.provider = provider
    }
}

extension Program: Comparable {
    static func < (lhs: Program, rhs: Program) -> Bool {
        lhs.title < lhs.title
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
        self.longDescription = product.description ?? ""
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
        self.longDescription = program.description
        self.image = program.image
        self.url = program.url
        self.provider = .sr
    }
    init?(srEpisode episode: Episode) {
        guard
            let image = URL(string: episode.imageurl),
            let url = URL(string: episode.url)
        else { return nil }
        
        self.id = episode.id
        self.title = String(episode.title.prefix(40))
        self.description = String(episode.episodeDescription.prefix(80))
        self.longDescription = episode.episodeDescription
        self.image = image
        self.url = url
        self.provider = .sr
    }
}

extension Program {
    init?(svtProgram program: ItemElement) {
        guard let idFirst = program.item.id.split(separator: "-").first else { return nil}
        guard let id = Int(idFirst) else { return nil }
        
        self.id = id
        self.title = program.heading
        self.description = program.subHeading
        self.longDescription = program.item.longDescription
        self.image = URL(string: "https://www.svtstatic.se/image/original/400/\(program.images.wide.id)/\(program.images.wide.changed)")!
        self.url = URL(string: "https://www.svtplay.se\(program.item.urls.svtplay)")
        self.provider = .svt
    }
}

extension Program {
    static let mock = Program(
        id: 204027,
        title: "Samisk historia med Ailo",
        description: "Om hur h??ndelser i historien p??verkar unga samer i dag.",
        longDescription: "Om hur h??ndelser i historien p??verkar unga samer i dag. Om hur h??ndelser i historien p??verkar unga samer i dag.",
        image: URL(string: "https://assets.ur.se/id/204027/images/1_ml.jpg")!,
        url: URL(string: "https://urplay.se/program/\(204027)")!,
        provider: .ur
    )
}

