import Foundation
import SwiftUI

struct Album: Hashable {

    var cover: String
    var title: String
    var artist: String
    var songs: [Song]

    static func == (lhs: Album, rhs: Album) -> Bool {
        lhs.title == rhs.title && lhs.artist == rhs.artist
    }
}
