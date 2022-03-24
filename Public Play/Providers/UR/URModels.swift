//
//  URModels.swift
//  Public Play
//
//  Created by Anders Frank on 2022-03-24.
//

import Foundation

public struct Product: Hashable, Codable, CustomDebugStringConvertible {
    public struct AccessiblePlatforms: Codable, Hashable {
        public struct URPlay: Codable, Hashable {
            public var startTime: Date?
            public var endTime: Date?
            
            public init(startTime: Date? = nil, endTime: Date? = nil) {
                self.startTime = startTime
                self.endTime = endTime
            }
        }
        
        public var urplay: URPlay?
        
        public init(urplay: Product.AccessiblePlatforms.URPlay? = nil) {
            self.urplay = urplay
        }
    }
    
    public struct File: Codable, Hashable {
        public var location: String?
        public var fileType: String?
        public var type: FileKind?
        public var url: URL? {
            guard let location = location else { return nil }
            
            guard let encoded = location.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
                return nil
            }
            guard let url = URL(string: encoded) else { return nil }
            return url
        }
        
        public init(location: String? = nil, fileType: String? = nil, type: Product.FileKind? = nil) {
            self.location = location
            self.fileType = fileType
            self.type = type
        }
    }
    
    public enum FileKind: String, Codable, Hashable {
        case teacherguide
        case worksheet
        case script
        case unknown
    }
    
    public enum Format: String, Codable, Hashable {
        case video
        case audio
        case radio
        case unknown
    }
    
    public struct ParticipantInfo: Codable, Hashable {
        public var firstname: String?
        public var lastname: String?
        public var role: String?
        public var profession: String?
        
        public init(firstname: String? = nil, lastname: String? = nil, role: String? = nil, profession: String? = nil) {
            self.firstname = firstname
            self.lastname = lastname
            self.role = role
            self.profession = profession
        }
    }
    
    public enum Platform: String, Codable, Hashable {
        case uraccess
        case urplay
        case unknown
    }
    
    public enum ProductType: String, Codable, Hashable {
        case superSeries = "super_series"
        case series
        case programradio
        case program
        case unknown
    }
    
    public struct Relations: Codable, Hashable {
        public var complementary: [Product]?
        
        public init(complementary: [Product]? = nil) {
            self.complementary = complementary
        }
    }
    
    public struct StreamingInfo: Codable, Hashable {
        public struct LocationEnvelope: Codable, Hashable {
            public var location: String
            public var scope: String?
            public var language: String?
            
            public init(location: String, scope: String? = nil, language: String? = nil) {
                self.location = location
                self.scope = scope
                self.language = language
            }
        }
        
        public var label: String?
        public var `default`: Bool?
        public var sd: LocationEnvelope?
        public var hd: LocationEnvelope?
        public var tt: LocationEnvelope?
        public var mp4: LocationEnvelope?
        public var mp3: LocationEnvelope?
        public var m4a: LocationEnvelope?
        
        public init(
            label: String? = nil,
            default: Bool? = nil,
            sd: Product.StreamingInfo.LocationEnvelope? = nil,
            hd: Product.StreamingInfo.LocationEnvelope? = nil,
            tt: Product.StreamingInfo.LocationEnvelope? = nil,
            mp4: Product.StreamingInfo.LocationEnvelope? = nil,
            mp3: Product.StreamingInfo.LocationEnvelope? = nil,
            m4a: Product.StreamingInfo.LocationEnvelope? = nil
        ) {
            self.label = label
            self.default = `default`
            self.sd = sd
            self.hd = hd
            self.tt = tt
            self.mp4 = mp4
            self.mp3 = mp3
            self.m4a = m4a
        }
    }
    
    public enum Version: String, Codable, Hashable {
        case original = "ORIGINAL"
        case signLanguage = "SIGN_LANGUAGE"
        case audioDescription = "AUDIO_DESCRIPTION"
    }
    
    public struct VersionEnvelope: Codable, Hashable {
        public var id: Int
        public var version: Version
        
        public init(id: Int, version: Product.Version) {
            self.id = id
            self.version = version
        }
    }
    
    public enum _Type: String, Codable, Hashable {
        case linkProduct = "LinkProduct"
        case unknown
    }
    
    public var accessiblePlatforms: AccessiblePlatforms?
    public var actionLabel: String?
    public var allVersions: [VersionEnvelope]?
    public var audioDescription: Bool?
    public var availabilityEndingUrplayDate: Date?
    public var categories: [String]?
    public var description: String?
    public var duration: Int?
    public var educationalDescription: String?
    public var episodeNumber: Int?
    public var files: [File]?
    public var format: Format?
    public var hasInstructionalMaterialPlanned: Bool?
    public var id: Int?
    public var internationalTitle: String?
    public var image: [String: URL]?
    public var isAudioDescribed: Bool?
    public var isCurrentAffairsProgram: Bool?
    public var isSignLanguageInterpreted: Bool?
    public var isSingle: Bool?
    public var keywords: [String]?
    public var label: String?
    public var languages: [String]?
    public var languagesTranslations: [String]?
    public var mainGenre: String?
    public var mainTitle: String?
    public var modified: Date?
    public var numberOfEpisodes: Int?
    public var participants: [ParticipantInfo]?
    public var platforms: [Platform]?
    public var productionYear: Int?
    public var productType: ProductType?
    public var relations: Relations?
    public var seriesId: Int?
    public var seriesTitle: String?
    public var streamableProgramIds: [Int]?
    public var streamingInfo: [String: StreamingInfo]?
    public var subjectTree: [[String]]?
    public var superSeriesId: Int?
    public var title: String?
    public var type: _Type?
    public var typicalAgeRange: [String]?
    public var typicalAgeRangeTranslations: [String]?
    public var url: String?
    public var usp: String?
    public var version: Version?
    
    // MARK: - Local properties that does not come as part of the backend responses. Avoid adding them if possible.
    
    public var local_isPlayNextEpisode: Bool?
    
    public init(
        accessiblePlatforms: AccessiblePlatforms? = nil,
        actionLabel: String? = nil,
        allVersions: [VersionEnvelope]? = nil,
        audioDescription: Bool? = nil,
        availabilityEndingUrplayDate: Date? = nil,
        categories: [String]? = nil,
        description: String? = nil,
        duration: Int? = nil,
        educationalDescription: String? = nil,
        episodeNumber: Int? = nil,
        files: [File]? = nil,
        format: Format? = nil,
        hasInstructionalMaterialPlanned: Bool? = nil,
        id: Int? = nil,
        internationalTitle: String? = nil,
        image: [String: URL]? = nil,
        isAudioDescribed: Bool? = nil,
        isCurrentAffairsProgram: Bool? = nil,
        isSignLanguageInterpreted: Bool? = nil,
        isSingle: Bool? = nil,
        keywords: [String]? = nil,
        label: String? = nil,
        languages: [String]? = nil,
        languagesTranslations: [String]? = nil,
        mainGenre: String? = nil,
        mainTitle: String? = nil,
        modified: Date? = nil,
        numberOfEpisodes: Int? = nil,
        participants: [ParticipantInfo]? = nil,
        platforms: [Platform]? = nil,
        productionYear: Int? = nil,
        productType: ProductType? = nil,
        relations: Relations? = nil,
        seriesId: Int? = nil,
        seriesTitle: String? = nil,
        streamableProgramIds: [Int]? = nil,
        streamingInfo: [String: StreamingInfo]? = nil,
        subjectTree: [[String]]? = nil,
        superSeriesId: Int? = nil,
        title: String? = nil,
        type: _Type? = nil,
        typicalAgeRange: [String]? = nil,
        typicalAgeRangeTranslations: [String]? = nil,
        url: String? = nil,
        usp: String? = nil,
        version: Version? = nil
    ) {
        self.accessiblePlatforms = accessiblePlatforms
        self.actionLabel = actionLabel
        self.allVersions = allVersions
        self.audioDescription = audioDescription
        self.availabilityEndingUrplayDate = availabilityEndingUrplayDate
        self.categories = categories
        self.description = description
        self.duration = duration
        self.educationalDescription = educationalDescription
        self.episodeNumber = episodeNumber
        self.files = files
        self.format = format
        self.hasInstructionalMaterialPlanned = hasInstructionalMaterialPlanned
        self.id = id
        self.internationalTitle = internationalTitle
        self.image = image
        self.isAudioDescribed = isAudioDescribed
        self.isCurrentAffairsProgram = isCurrentAffairsProgram
        self.isSignLanguageInterpreted = isSignLanguageInterpreted
        self.isSingle = isSingle
        self.keywords = keywords
        self.label = label
        self.languages = languages
        self.languagesTranslations = languagesTranslations
        self.mainGenre = mainGenre
        self.mainTitle = mainTitle
        self.modified = modified
        self.numberOfEpisodes = numberOfEpisodes
        self.participants = participants
        self.platforms = platforms
        self.productionYear = productionYear
        self.productType = productType
        self.relations = relations
        self.seriesId = seriesId
        self.seriesTitle = seriesTitle
        self.streamableProgramIds = streamableProgramIds
        self.streamingInfo = streamingInfo
        self.subjectTree = subjectTree
        self.superSeriesId = superSeriesId
        self.title = title
        self.type = type
        self.typicalAgeRange = typicalAgeRange
        self.typicalAgeRangeTranslations = typicalAgeRangeTranslations
        self.url = url
        self.usp = usp
        self.version = version
    }
    
    public var debugDescription: String {
        "id: \(id?.description ?? "") title: \(title?.description ?? "")"
    }
}

public extension Product.Format {
    init(from decoder: Decoder) throws {
        guard let value = try? decoder.singleValueContainer().decode(String.self) else {
            self = .unknown
            return
        }
        self = Product.Format(rawValue: value) ?? .unknown
    }
}

public extension Product.Platform {
    init(from decoder: Decoder) throws {
        guard let value = try? decoder.singleValueContainer().decode(String.self) else {
            self = .unknown
            return
        }
        self = Product.Platform(rawValue: value) ?? .unknown
    }
}

public extension Product.ProductType {
    init(from decoder: Decoder) throws {
        guard let value = try? decoder.singleValueContainer().decode(String.self) else {
            self = .unknown
            return
        }
        self = Product.ProductType(rawValue: value) ?? .unknown
    }
}

public extension Product.FileKind {
    init(from decoder: Decoder) throws {
        guard let value = try? decoder.singleValueContainer().decode(String.self) else {
            self = .unknown
            return
        }
        self = Product.FileKind(rawValue: value) ?? .unknown
    }
}

public extension Product._Type {
    init(from decoder: Decoder) throws {
        guard let value = try? decoder.singleValueContainer().decode(String.self) else {
            self = .unknown
            return
        }
        self = Product._Type(rawValue: value) ?? .unknown
    }
}

public extension Product {
    enum ImageSize: String {
        case _1280x720 = "1280x720"
        case _960x540 = "960x540"
        case _640x360 = "640x360"
        case _480x270 = "480x270"
        case _320x180 = "320x180"
        case _240x135 = "240x135"
        case _160x90 = "160x90"
        case _128x72 = "128x72"
        case _64x36 = "64x36"
        case _360x360 = "360x360"
        case _75x75 = "75x75"
    }

    var derived_accessibleUntil: Date? {
        availabilityEndingUrplayDate ?? accessiblePlatforms?.urplay?.endTime
    }

    var derived_hasAudioStrem: Bool {
        derived_rawStreamingInfo?.mp4 != nil || derived_rawStreamingInfo?.mp3 != nil
    }

    var derived_hasChildAgeRange: Bool {
        let ageRanges = typicalAgeRange ?? []
        return ageRanges.contains("primary4-6")
            || ageRanges.contains("primary0-3")
            || ageRanges.contains("preschool")
            || ageRanges.contains("specialschool")
            || ageRanges.contains("specialschoolprimary")
    }

    var derived_isAudio: Bool {
        format == .audio || format == .radio
    }

    var derived_isAudioDescribed: Bool {
        isAudioDescribed ?? false || audioDescription ?? false
    }

    func derived_isAvailable(currentDate: Date) -> Bool {
        guard
            let startTime = accessiblePlatforms?.urplay?.startTime,
            let endTime = accessiblePlatforms?.urplay?.endTime
        else { return false }
        return currentDate > startTime && currentDate < endTime
    }

    func derived_isUpcoming(currentDate: Date) -> Bool {
        guard let startTime = accessiblePlatforms?.urplay?.startTime else { return false }
        if !derived_isSingle, derived_isSeries {
            return false
        }
        return currentDate < startTime || streamingInfo == nil
    }

    var derived_isSeries: Bool {
        productType == .series || productType == .superSeries
    }

    var derived_isSingle: Bool {
        isSingle ?? false
    }

    var derived_mediaId: String {
        let seriesId = self.seriesId.flatMap { "\($0)" } ?? "000000"
        let id = self.id.flatMap { "\($0)" } ?? "000000"
        let seriesTitle = self.seriesTitle ?? ""
        let title = self.title ?? ""
        
        if derived_isSeries {
            return "\(id) : 000000 - \(title)"
        } else if derived_isSingle {
            return "000000 : \(id) - \(title)"
        } else {
            return "\(seriesId) : \(id) - \(seriesTitle) : \(title)"
        }
    }

    var derived_programBaseTrackingParameters: [String: Any] {
        var params: [String: Any] = [:]
        if let id = id {
            params["program_id"] = "\(id)"
        }
        if let title = title {
            params["program_name"] = title
        }
        if let seriesId = seriesId {
            params["series_id"] = "\(seriesId)"
        }
        if let seriesTitle = seriesTitle {
            params["series_name"] = seriesTitle
        }
        if let format = format {
            params["media_format"] = format.rawValue
        }
        if let value = derived_typicalAgeRangeTrackingValue {
            params["typical_age_range"] = value
        }
        return params
    }

    var derived_rawStreamingInfo: Product.StreamingInfo? {
        streamingInfo?["raw"]
    }

    var derived_schoolSubjects: [String]? {
        guard let subjectTree = self.subjectTree else { return nil }
        let firstItems = subjectTree.compactMap(\.first)
        return firstItems.filterDuplicates
    }
    
    /// Discards subtitle languages without valid streams. Such as episodes of "Pedagogikens giganter".
    var derived_subtitleLanguagesTranslations: [String] {
        guard let streamingInfo = streamingInfo?.derived_discardingInfosWithoutStreams else { return [] }
        return streamingInfo.compactMap { _, streamingInfo in
            guard let label = streamingInfo.label, !label.isEmpty else { return nil }
            return label
        }
    }
    
    var derived_typicalAgeRangeTrackingValue: String? {
        guard
            let typicalAgeRange = typicalAgeRange,
            typicalAgeRange.count > 0
        else { return nil }
        return "[\(typicalAgeRange.joined(separator: ", "))]"
    }

    func derived_urlForImageSize(_ imageSize: ImageSize) -> URL? {
        image?[imageSize.rawValue]
    }

    /// Returns url in URL format, with urplay.se inserted if the url does does not have a host.
    var derived_urlWithurplayseDomainInsertedIfMissingHost: URL? {
        guard var path = url else { return nil }
        if !path.hasHost {
            if path.prefix(1) != "/" {
                path = "/" + path
            }
            path = "https://urplay.se" + path
        }
        return URL(string: path)
    }
}

public extension Product.FileKind {
    var derived_title: String {
        switch self {
        case .teacherguide:
            return "Lärarhandledning"
        case .worksheet:
            return "Uppgiftsblad"
        case .script:
            return "Manus"
        case .unknown:
            return "Arbetsmaterial"
        }
    }
}

private extension String {
    var hasHost: Bool {
        guard let url = URL(string: self) else { return false }
        return url.host != nil
    }
}

public extension Array where Element == Product {
    /// Returns an array of  products which are sorted according to the order of the `ids` array.
    func sortedWithOrderOfIds(_ ids: [Int]) -> [Product] {
        sorted { s1, s2 in
            guard
                let id1 = s1.id,
                let id2 = s2.id
            else { return true }

            switch (ids.firstIndex(of: id1), ids.firstIndex(of: id2)) {
            case (nil, nil):
                return true
            case (.some, nil):
                return true
            case (nil, .some):
                return false
            case let (id1_index?, id2_index?):
                return id1_index <= id2_index
            }
        }
    }
    
    var derived_filterDuplicates: [Product] {
        var ids: [Int] = []
        return self.filter { product in
            guard let id = product.id, !ids.contains(id) else { return false }
            ids.append(id)
            return true
        }
    }
}

public extension Array where Element == String {
    var filterDuplicates: [String] {
        NSOrderedSet(array: self).map { $0 as! String }
    }
}

public extension Dictionary where Key == String, Value == Product.StreamingInfo {
    var derived_discardingInfosWithoutStreams: [String: Product.StreamingInfo] {
        self.filter { key, streamingInfo in
            streamingInfo.sd != nil
            || streamingInfo.hd != nil
            || streamingInfo.m4a != nil
            || streamingInfo.mp3 != nil
            || streamingInfo.mp4 != nil
        }
    }
    
    func derived_streamInfo(withLabel label: String) -> Product.StreamingInfo? {
        for (_, info) in self {
            if info.label == label {
                return info
            }
        }
        return nil
    }
    
    var derived_streamingInfoLabels: [String] {
        return self.compactMap { _, info in
            info.label
        }
    }
}

public struct SearchResponse: Codable {
    public var results: [Product]
    
    public init(results: [Product]) {
        self.results = results
    }
}

extension JSONDecoder {
    static let standard: JSONDecoder = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .formatted(formatter)
        return decoder
    }()
}

extension SearchResponse {
    static func loadJSON() -> SearchResponse? {
        guard
            let path = Bundle.main.path(forResource: "most_viewed", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        else { return nil }
        return try? JSONDecoder.standard.decode(SearchResponse.self, from: data)
    }
}
