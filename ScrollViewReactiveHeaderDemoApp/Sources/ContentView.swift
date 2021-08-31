import ScrollViewReactiveHeader
import SwiftUI

// MARK: - ContentView

struct ContentView: View {

    var body: some View {

        ZStack(alignment: .topLeading) {

            ScrollViewReactiveHeader(header: {

                HeaderView()
            }, headerOverlay: {

                HeaderOverlay()
            }, body: {

                ScrollViewContent()
            })

            HStack {

                Spacer()

                Image(systemName: "magnifyingglass")
                    .imageScale(.medium)

                Text("Where are you going?")
                    .font(.callout)
                    .fontWeight(.medium)

                Spacer()
            }
            .opacity(0.8)
            .padding(6)
            .background(Color.white)
            .cornerRadius(20)
            .padding()
        }
    }
}

// MARK: - HeaderView

struct HeaderView: View {

    var body: some View {

        Image("night-sky")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 450)
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
