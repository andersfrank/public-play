//
//  SVTModels.swift
//  Public Play
//
//  Created by Marcus Linder on 2022-03-24.
//

import Foundation

struct SVTPopular: Codable {
    var data: SVTStartForSvtPlay
}

struct SVTStartForSvtPlay: Codable {
    var selections: [SVTSelections]
}

struct SVTSelections: Codable {
    var id: String
    var name: String
    var items: [SVTProgramWrapper]
}

struct SVTProgramWrapper: Codable {
    var heading: String
    var subHeading: String
    var images: SVTImages
    var item: SVTProgram
}

struct SVTImages: Codable {
    var wide: SVTImageWide
}

struct SVTImageWide: Codable {
    var changed: Int
    var id: String
    var keyart: Bool
    var description: String
}

struct SVTProgram: Codable {
    var id: String
    var longDescription: String
    var urls: SVTUrl
}

struct SVTUrl: Codable {
    var svtplay: String
}
//    "heading": "Husdrömmar",
//    "subHeading": "Radhusdröm till varje pris i Gamla Enskede",
//    "images": {
//        "wide": {
//            "changed": 1639933794,
//            "id": "33634190",
//            "keyart": true,
//            "description": "Anne Lundberg och Gert Wingårdh i Husdrömmar.",
//            "__typename": "Image"
//        },
//        "__typename": "Images"
//    },
//    "badge": null,
//    "item": {
//        "id": "1398022-008",
//        "svtId": "eWV6n9Z",
//        "videoSvtId": "jxLgm2L",
//        "longDescription": "Efter otaliga lägenhetsrenoveringar i Stockholm har Gabriel och Elin nu hittat sina husdrömmars mål - ett av de åtråvärda små radhusen i Gamla Enskede. Planen är att förädla det historiska radhusets originalutseende, men med en bostadsvolym likt ett mjölkpaket vill Gabriel och Elin också gräva sig neråt i källaren för att maxa ytan - fast då höjer Gert ett varningens finger! Med Gert Wingårdh och Anne Lundberg. Del 8 av 10.",
//        "urls": {
//            "svtplay": "/video/34625883/husdrommar/husdrommar-sasong-9-radhusdrom-till-varje-pris-i-gamla-enskede",
//            "__typename": "Urls"
//        },
//        "oppetArkiv": false,
//        "restrictions": {
//            "onlyAvailableInSweden": false,
//            "__typename": "Restrictions"
//        },
//        "live": null,
//        "validTo": "2022-10-01T23:59:59+02:00",
//        "__typename": "Episode",
//        "variants": [
//            {
//                "accessibility": "Default",
//                "urls": {
//                    "svtplay": "/video/34625883/husdrommar/husdrommar-sasong-9-radhusdrom-till-varje-pris-i-gamla-enskede",
//                    "__typename": "Urls"
//                },
//                "__typename": "Variant"
//            }
//        ]
//    },
//    "__typename": "Teaser"
//},
//}

//struct SVTPopular: Codable {
//    var title: String
//    var collection: [SRProgram2]
//}
//
//struct SVTProgram2: Codable {
//    var id: String
//    var title: String
//    var description: String
//    var image: URL
//    var url: URL
//}

extension SVTPopular {
    static func loadJSON() -> SVTPopular? {
        guard
            let path = Bundle.main.path(forResource: "graphql-svtplay-popular-2022-03-24", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        else { return nil }
        return try? JSONDecoder.standard.decode(SVTPopular.self, from: data)
    }
}
