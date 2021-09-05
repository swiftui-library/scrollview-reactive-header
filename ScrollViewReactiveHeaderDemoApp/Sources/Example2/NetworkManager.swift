import Foundation
import SwiftUI

class NetworkManager {

    // MARK: Internal

    static let shared = NetworkManager()

    func fetchHomeScreen() -> [HomeViewSection] {
        // Recently played albums.
        let tribe = Album(
            cover: "a-tribe-called-quest",
            title: "Midnight Marauders",
            artist: "A Tribe Called Quest",
            songs: exampleSongs)
        let abbeyRoad = Album(
            cover: "abbey-road",
            title: "Abbey Road",
            artist: "The Beatles",
            songs: exampleSongs)
        let banana = Album(
            cover: "banana",
            title: "Feel Slowly",
            artist: "Andy Warhol",
            songs: exampleSongs)
        let blueTrain = Album(
            cover: "blue-train",
            title: "Blue Train",
            artist: "John Coltrane",
            songs: exampleSongs)

        let recentlyPlayed = HomeViewSection(
            order: 1,
            title: "Recently Played",
            albums: [tribe, abbeyRoad, banana, blueTrain],
            type: .albumScroll)

        // Heavy rotation albums
        let boutique = Album(
            cover: "boutique",
            title: "Paul's Boutique",
            artist: "Beastie Boys",
            songs: exampleSongs)
        let flyWithMe = Album(
            cover: "frank-sinatra",
            title: "Come Fly With Me",
            artist: "Frank Sinatra",
            songs: exampleSongs)
        let funkadelic = Album(
            cover: "funkadelic",
            title: "Maggot Brain",
            artist: "Funkadelic",
            songs: exampleSongs)
        let go2 = Album(cover: "go-2", title: "XTC Go 2", artist: "XTC", songs: exampleSongs)

        let heavyRotation = HomeViewSection(
            order: 2,
            title: "Heavy Rotation",
            albums: [boutique, flyWithMe, funkadelic, go2],
            type: .albumScroll)

        // Recommended albums
        let heavenOrVegas = Album(
            cover: "heaven-or-vegas",
            title: "Heaven or Vegas",
            artist: "Cocteau Twins",
            songs: exampleSongs)
        let heroes = Album(
            cover: "heroes",
            title: "Heroes",
            artist: "David Bowie",
            songs: exampleSongs)
        let jesusOfCool = Album(
            cover: "jesus-of-cool",
            title: "Jesus of Cool",
            artist: "Nick Lowe",
            songs: exampleSongs)
        let odessa = Album(
            cover: "odessa",
            title: "Odessa",
            artist: "Bee Gees",
            songs: exampleSongs)
        let peppers = Album(
            cover: "peppers",
            title: "Lonely Hearts",
            artist: "The Beatles",
            songs: exampleSongs)

        let recommended = HomeViewSection(
            order: 3,
            title: "Recommended",
            albums: [heavenOrVegas, heroes, jesusOfCool, odessa, peppers],
            type: .albumScroll)

        // Summer rewind albums
        let rush = Album(
            cover: "moving-pictures",
            title: "Moving Pictures",
            artist: "Rush",
            songs: exampleSongs)
        let tongues = Album(
            cover: "speaking-in-tongues",
            title: "Speaking in Tongues",
            artist: "Talking Heads",
            songs: exampleSongs)
        let pleasures = Album(
            cover: "unknown-pleasures",
            title: "Unknown Pleasures",
            artist: "Joywave",
            songs: exampleSongs)
        let yeezus = Album(
            cover: "yeezus",
            title: "Yeezus",
            artist: "Kanye West",
            songs: exampleSongs)

        let summerRewind = HomeViewSection(
            order: 4,
            title: "Summer Rewind",
            albums: [rush, tongues, pleasures, yeezus],
            type: .albumScroll)

        // Quick shuffles
        let quickShuffles = HomeViewSection(
            order: 0,
            title: "Good afternoon",
            albums: [rush, tongues, pleasures, yeezus, peppers, odessa],
            type: .quickShuffle)

        return [quickShuffles, recentlyPlayed, heavyRotation, recommended, summerRewind]
    }

    // MARK: Private

    private let exampleSongs = [
        Song(title: "Track One", artist: "None", duration: TimeInterval(180)),
        Song(title: "Track Two", artist: "None", duration: TimeInterval(180)),
        Song(title: "Track Three", artist: "None", duration: TimeInterval(180)),
        Song(title: "Track Four", artist: "None", duration: TimeInterval(180)),
        Song(title: "Track Five", artist: "None", duration: TimeInterval(180)),
        Song(title: "Track Six", artist: "None", duration: TimeInterval(180)),
        Song(title: "Track Seven", artist: "None", duration: TimeInterval(180)),
        Song(title: "Track Eight", artist: "None", duration: TimeInterval(180)),
        Song(title: "Track Nine", artist: "None", duration: TimeInterval(180)),
        Song(title: "Track Ten", artist: "None", duration: TimeInterval(180)),
    ]
}
