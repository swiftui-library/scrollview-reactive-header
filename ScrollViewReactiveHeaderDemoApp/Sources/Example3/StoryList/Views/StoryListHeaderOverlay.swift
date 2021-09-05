import SwiftUI

// MARK: - StoryListHeaderOverlay

struct StoryListHeaderOverlay: View {

    let header: String

    var body: some View {

        VStack(alignment: .center) {
            
            ZStack {

                Rectangle()
                    .fill(Color.yellow)
                    .offset(x: -24, y: 0)
                    .rotationEffect(.init(degrees: -1))
                    .frame(width: 112, height: 30)
                    .opacity(0.7)

                Text(header)
                    .font(.system(size: 32, weight: .semibold, design: .serif))
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

// MARK: - StoryListHeaderOverlay_Previews

struct StoryListHeaderOverlay_Previews: PreviewProvider {
    static var previews: some View {
        StoryListHeaderOverlay(header: "Our Newest Stories")
    }
}
