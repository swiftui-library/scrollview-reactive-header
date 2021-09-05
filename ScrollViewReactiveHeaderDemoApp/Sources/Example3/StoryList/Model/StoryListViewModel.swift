import Foundation

struct StoryListViewModel {

    let stories: [Story]

    let header: String = "Our Newest Stories"
    
    static let example: StoryListViewModel = .init(stories: [.darkWeather, .elixir, .peculiar, .piano, .teapot, .windingPath])
}
