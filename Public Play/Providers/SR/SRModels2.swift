//
//  SRModels2.swift
//  Public Play
//
//  Created by Anders Frank on 2022-03-25.
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct SRWelcome: Decodable {
    let id: Int
    let title, welcomeDescription, copyright: String
    let episodes: [Episode]
    let imageurl, imageurltemplate: String
    let statkey, publisher: String
    let pagination: Pagination

    enum CodingKeys: String, CodingKey {
        case id, title
        case welcomeDescription = "description"
        case copyright, episodes, imageurl, imageurltemplate, statkey, publisher, pagination
    }
}

// MARK: - Episode
struct Episode: Decodable {
    let id: Int
    let title, episodeDescription: String
    let url: String
    let program: SR2Program
    let audiopreference: Audiopreference
    let audiopriority: Audiopriority
    let audiopresentation: Audiopresentation
    let publishdateutc: String
    let imageurl, imageurltemplate: String
    let photographer: String?
    let listenpodfile, downloadpodfile: Podfile
    let broadcasttime: Broadcasttime?
    let channelid: Int?
    let broadcast: Broadcast?

    enum CodingKeys: String, CodingKey {
        case id, title
        case episodeDescription = "description"
        case url, program, audiopreference, audiopriority, audiopresentation, publishdateutc, imageurl, imageurltemplate, photographer, listenpodfile, downloadpodfile, broadcasttime, channelid, broadcast
    }
}

enum Audiopreference: String, Decodable {
    case audiopreferenceDefault = "default"
    case broadcast = "broadcast"
    case pod = "pod"
}

enum Audiopresentation: String, Decodable {
    case format = "format"
    case music = "music"
}

enum Audiopriority: String, Codable {
    case aac = "aac"
    case mp3 = "mp3"
}

// MARK: - Broadcast
struct Broadcast: Codable {
    let availablestoputc: String
    let playlist: Playlist
    let broadcastfiles: [Playlist]
}

// MARK: - Playlist
struct Playlist: Codable {
    let duration: Int
    let publishdateutc: String
    let id: Int
    let url: String
    let statkey: String
}

// MARK: - Broadcasttime
struct Broadcasttime: Codable {
    let starttimeutc, endtimeutc: String
}

// MARK: - Podfile
struct Podfile: Decodable {
    let title, podfileDescription: String
    let filesizeinbytes: Int
    let program: SR2Program
    let availablefromutc: String
    let duration: Int
    let publishdateutc: String
    let id: Int
    let url: String
    let statkey: String

    enum CodingKeys: String, CodingKey {
        case title
        case podfileDescription = "description"
        case filesizeinbytes, program, availablefromutc, duration, publishdateutc, id, url, statkey
    }
}

// MARK: - Program
struct SR2Program: Codable {
    let id: Int
    let name: String
}

// MARK: - Pagination
struct Pagination: Codable {
    let page, size, totalhits, totalpages: Int
}

extension SRWelcome {
    static func loadJSON() -> SRWelcome? {
        guard
            let path = Bundle.main.path(forResource: "sr-editorialcollections-7954059-2022-03-24", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        else { return nil }
        return try? JSONDecoder.standard.decode(SRWelcome.self, from: data)
    }
}
