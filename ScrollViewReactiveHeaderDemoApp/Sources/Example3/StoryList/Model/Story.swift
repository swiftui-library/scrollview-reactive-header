import Foundation

struct Story: Identifiable {

    let id: Int
    
    let title: String
    let description: String

    let reads: Int
    let favorites: Int
    
    static let peculiar: Story = .init(id: 0, title: "The Peculiar Guillotine", description: "Alex Parkes had always loved urban Sleepford with its dark, delicious ditches. It was a place where he felt barmy.", reads: 13, favorites: 4)
    static let teapot: Story = .init(id: 1, title: "The Damp Teapot", description: "James Rockatansky looked at the damp teapot in his hands and felt unstable.", reads: 8, favorites: 2)
    static let elixir: Story = .init(id: 2, title: "The Elixir", description: "Tristan gulped. He glanced at his own reflection. He was a giving, greedy, squash drinker with spiky fingers and skinny fingers", reads: 16, favorites: 5)
    static let piano: Story = .init(id: 3, title: "The Warped Piano", description: "Alex Raymond was thinking about Michelle Blast again. Michelle was a brave volcano with short arms and fiery gaze.", reads: 21, favorites: 4)
    static let windingPath: Story = .init(id: 4, title: "The Winding Path", description: "Alex Smart walked over to the window and reflected on his rural surroundings. He had always loved his hometown.", reads: 8, favorites: 1)
    static let darkWeather: Story = .init(id: 5, title: "Darker Nights", description: "The hail pounded like bopping donkeys, making Suki puzzled. Suki grabbed a bendy gun that had been strewn nearby.", reads: 24, favorites: 11)
}
