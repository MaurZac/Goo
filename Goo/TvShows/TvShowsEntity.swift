//
//  TvShowsEntity.swift
//  Goo
//
//  Created by Mauricio Zarate Chula on 19/08/22.
//

import Foundation

// MARK: - TvShow
struct TvShow: Codable {
    //var id: Int?
   // var url: String?
    var name: String?
//    var type: TypeEnum?
//    var language: Language?
//    var genres: [Genre]?
//    var status: Status?
//    var runtime: Int?
//    var averageRuntime: Int?
//    var premiered: String?
//    var ended: String?
//    var officialSite: String?
//    var schedule: Schedule?
//    var rating: Rating?
//    var weight: Int?
//    var network, webChannel: Network?
//    var dvdCountry: Country?
//    var externals: Externals?
    var image: Image?
    var isFav: Bool?
//    var summary: String?
//    var updated: Int?
//    var links: Links?
}


//
//// MARK: - Country
//struct Country: Codable {
//    var name: Name?
//    var code: Code?
//    var timezone: Timezone?
//}
//
//enum Code: Codable {
//    case ca
//    case de
//    case fr
//    case gb
//    case jp
//    case us
//}
//
//enum Name: Codable {
//    case canada
//    case france
//    case germany
//    case japan
//    case unitedKingdom
//    case unitedStates
//}
//
//enum Timezone: Codable {
//    case americaHalifax
//    case americaNewYork
//    case asiaTokyo
//    case europeBusingen
//    case europeLondon
//    case europeParis
//}
//
//// MARK: - Externals
//struct Externals: Codable {
//    var tvrage: Int?
//    var thetvdb: Int?
//    var imdb: String?
//}
//
//enum Genre: Codable{
//    case action
//    case adventure
//    case anime
//    case comedy
//    case crime
//    case drama
//    case espionage
//    case family
//    case fantasy
//    case history
//    case horror
//    case legal
//    case medical
//    case music
//    case mystery
//    case romance
//    case scienceFiction
//    case sports
//    case supernatural
//    case thriller
//    case war
//    case western
//}
//
//// MARK: - Image
struct Image: Codable {
    var medium, original: String?
}
//
//enum Language: Codable {
//    case english
//    case japanese
//}
//
//// MARK: - Links
//struct Links: Codable {
//    var linksSelf, previousepisode, nextepisode: Nextepisode?
//}
//
//// MARK: - Nextepisode
//struct Nextepisode: Codable {
//    var href: String?
//}
//
//// MARK: - Network
//struct Network: Codable {
//    var id: Int?
//    var name: String?
//    var country: Country?
//    var officialSite: String?
//}
//
//// MARK: - Rating
//struct Rating: Codable {
//    var average: Double?
//}
//
//// MARK: - Schedule
//struct Schedule: Codable {
//    var time: Time?
//    var days: [Day]?
//}
//
//enum Day: Codable {
//    case friday
//    case monday
//    case saturday
//    case sunday
//    case thursday
//    case tuesday
//    case wednesday
//}
//
//enum Time: Codable {
//    case empty
//    case the0900
//    case the1200
//    case the1300
//    case the2000
//    case the2030
//    case the2100
//    case the2130
//    case the2200
//    case the2230
//    case the2300
//    case the2330
//}
//
//enum Status: Codable {
//    case ended
//    case running
//}
//
//enum TypeEnum: Codable {
//    case animation
//    case documentary
//    case reality
//    case scripted
//    case talkShow
//}
