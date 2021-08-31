import ScrollViewReactiveHeader
import SwiftUI

// MARK: - ContentView

struct ContentView: View {
    
    var body: some View {

        ScrollViewReactiveHeader(header: {
            
            HeaderView()
        }, headerOverlay: {
            
            HeaderOverlay()
        }, body: {
            
            ScrollViewContent()
        })
    }
}

// MARK: - HeaderView

struct HeaderView: View {

    var body: some View {

        Image("night-sky")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 350)
    }
}

// MARK: - HeaderOverlay

struct HeaderOverlay: View {

    var body: some View {

        Text("Not sure where to go? \n Perfect.")
            .foregroundColor(.white)
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
