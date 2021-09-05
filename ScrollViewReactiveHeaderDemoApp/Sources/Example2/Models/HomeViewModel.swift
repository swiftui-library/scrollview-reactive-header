import Foundation

// MARK: - HomeViewSection

struct HomeViewSection {
    var order: Int
    var title: String
    var albums: [Album]
    var type: HomeSectionType
}

// MARK: - HomeSectionType

enum HomeSectionType {
    case albumScroll, quickShuffle
}
