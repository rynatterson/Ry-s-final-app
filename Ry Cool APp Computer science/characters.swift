// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let art = try? JSONDecoder().decode(Art.self, from: jsonData)

import Foundation

struct Art: Codable {
    let objectID: Int
    let primaryImage, primaryImageSmall: String

    let country: String
    let artistDisplayName: String
    
    let department, objectName, title, culture: String
    let period, dynasty, reign, portfolio: String

    let objectEndDate: Int
  
    let objectDate: String
    let creditLine, geographyType, city, state: String

}


//// MARK: - Measurement
//struct Measurement: Codable {
//    let elementName: String
//    let elementDescription: JSONNull?
//    let elementMeasurements: ElementMeasurements
//}
//
//// MARK: - ElementMeasurements
//struct ElementMeasurements: Codable {
//    let height, width: Double
//
//    enum CodingKeys: String, CodingKey {
//        case height = "Height"
//        case width = "Width"
//    }
//}
//
//// MARK: - Tag
//struct Tag: Codable {
//    let term: String
//    let aatURL: String
//    let wikidataURL: String
//
//    enum CodingKeys: String, CodingKey {
//        case term
//        case aatURL = "AAT_URL"
//        case wikidataURL = "Wikidata_URL"
//    }
//}
//
//// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
