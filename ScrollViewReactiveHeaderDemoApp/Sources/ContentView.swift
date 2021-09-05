import ScrollViewReactiveHeader
import SwiftUI

// MARK: - ContentView

struct ContentView: View {

    var body: some View {
        
        TabView {

            StoryListView()
                .tabItem {
                    VStack {
                    Image(systemName: "book")
                        .foregroundColor(.gray)
                    Text("Reader")
                        .foregroundColor(.gray)
                    }
                }
        }
        .preferredColorScheme(.light)
    }
}

// MARK: - HeaderOverlay

struct HeaderOverlay: View {

    var body: some View {

        VStack {

            Spacer()

            Text("Not sure where to go?")
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(.white)

            Text("Perfect")
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(.white)

            Spacer()
        }
        .frame(height: 450)
    }
}

// MARK: - ScrollViewContent

struct ScrollViewContent: View {

    var body: some View {

        VStack(alignment: .leading, spacing: 16) {

            Text("content")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text("content")
                .frame(maxWidth: .infinity, alignment: .leading)

            Text("content")
                .frame(maxWidth: .infinity, alignment: .leading)

            Spacer()
        }
        .frame(height: 600)
    }
}

// MARK: - ContentView_Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
