//
//  SVTModels2.swift
//  Public Play
//
//  Created by Anders Frank on 2022-03-25.
//

import Foundation

extension Welcome {
    static func loadJSON() throws -> Welcome {
        let path = Bundle.main.path(forResource: "graphql-svtplay-popular-2022-03-24", ofType: "json")!
        let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        return try JSONDecoder().decode(Welcome.self, from: data)
    }
}

// MARK: - Welcome
struct Welcome: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let startForSvtPlay: StartForSvtPlay
}

// MARK: - StartForSvtPlay
struct StartForSvtPlay: Codable {
    let selections: [Selection]
    let typename: String

    enum CodingKeys: String, CodingKey {
        case selections
        case typename = "__typename"
    }
}

// MARK: - Selection
struct Selection: Codable {
    let id, name: String
    let analyticsIdentifiers: AnalyticsIdentifiers
    let items: [ItemElement]
    let typename: String

    enum CodingKeys: String, CodingKey {
        case id, name, analyticsIdentifiers, items
        case typename = "__typename"
    }
}

// MARK: - AnalyticsIdentifiers
struct AnalyticsIdentifiers: Codable {
    let listID, listType, typename: String

    enum CodingKeys: String, CodingKey {
        case listID = "listId"
        case listType
        case typename = "__typename"
    }
}

// MARK: - ItemElement
struct ItemElement: Codable {
    let heading, subHeading: String
    let images: Images
    let badge: Badge?
    let item: ItemItem
    let typename: PurpleTypename
    let baUsersMlinderDevSVTLabbPublicPlayPublicPlayProvidersSVTGraphqlSvtplayPopular20220324Jsondge: JSONNull?

    enum CodingKeys: String, CodingKey {
        case heading, subHeading, images, badge, item
        case typename = "__typename"
        case baUsersMlinderDevSVTLabbPublicPlayPublicPlayProvidersSVTGraphqlSvtplayPopular20220324Jsondge = "ba/Users/mlinder/Dev/SVT/labb/public-play/Public Play/Providers/SVT/graphql-svtplay-popular-2022-03-24.jsondge"
    }
}

// MARK: - Badge
struct Badge: Codable {
    let altText, text, type, typename: String

    enum CodingKeys: String, CodingKey {
        case altText, text, type
        case typename = "__typename"
    }
}

// MARK: - Images
struct Images: Codable {
    let wide: Wide
    let typename: ImagesTypename

    enum CodingKeys: String, CodingKey {
        case wide
        case typename = "__typename"
    }
}

enum ImagesTypename: String, Codable {
    case images = "Images"
}

// MARK: - Wide
struct Wide: Codable {
    let changed: Int
    let id: String
    let keyart: Bool
    let wideDescription: String
    let typename: WideTypename

    enum CodingKeys: String, CodingKey {
        case changed, id, keyart
        case wideDescription = "description"
        case typename = "__typename"
    }
}

enum WideTypename: String, Codable {
    case image = "Image"
}

// MARK: - ItemItem
struct ItemItem: Codable {
    let id, svtID, videoSvtID, longDescription: String
    let urls: Urls
    let oppetArkiv: Bool
    let restrictions: Restrictions
    let live: Live?
    let validTo: String
    let typename: FluffyTypename
    let variants: [Variant]

    enum CodingKeys: String, CodingKey {
        case id
        case svtID = "svtId"
        case videoSvtID = "videoSvtId"
        case longDescription, urls, oppetArkiv, restrictions, live, validTo
        case typename = "__typename"
        case variants
    }
}

// MARK: - Live
struct Live: Codable {
    let liveNow: Bool
    let start, typename: String

    enum CodingKeys: String, CodingKey {
        case liveNow, start
        case typename = "__typename"
    }
}

// MARK: - Restrictions
struct Restrictions: Codable {
    let onlyAvailableInSweden: Bool
    let typename: RestrictionsTypename

    enum CodingKeys: String, CodingKey {
        case onlyAvailableInSweden
        case typename = "__typename"
    }
}

enum RestrictionsTypename: String, Codable {
    case restrictions = "Restrictions"
}

enum FluffyTypename: String, Codable {
    case episode = "Episode"
    case single = "Single"
}

// MARK: - Urls
struct Urls: Codable {
    let svtplay: String
    let typename: UrlsTypename

    enum CodingKeys: String, CodingKey {
        case svtplay
        case typename = "__typename"
    }
}

enum UrlsTypename: String, Codable {
    case urls = "Urls"
}

// MARK: - Variant
struct Variant: Codable {
    let accessibility: Accessibility
    let urls: Urls
    let typename: VariantTypename

    enum CodingKeys: String, CodingKey {
        case accessibility, urls
        case typename = "__typename"
    }
}

enum Accessibility: String, Codable {
    case accessibilityDefault = "Default"
    case audioDescribed = "AudioDescribed"
    case signInterpreted = "SignInterpreted"
}

enum VariantTypename: String, Codable {
    case variant = "Variant"
}

enum PurpleTypename: String, Codable {
    case teaser = "Teaser"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
