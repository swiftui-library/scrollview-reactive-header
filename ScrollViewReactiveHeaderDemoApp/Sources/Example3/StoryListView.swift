import ScrollViewReactiveHeader
import SwiftUI

// MARK: - StoryListView

struct StoryListView: View {

    let viewModel: StoryListViewModel = .example

    var body: some View {


            ScrollViewReactiveHeader(header: {

                HeaderView()
                    .frame(height: 300)
            }, headerOverlay: {

                StoryListHeaderOverlay(header: viewModel.header)
                    .frame(height: 300)
            }, body: {

                StoryListContentView(viewModel: viewModel)
            }, configuration: .init(showStatusBar: true))
    }
}

// MARK: - HeaderView

struct HeaderView: View {

    var body: some View {

        Image("background3")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .opacity(0.35)
    }
}


// MARK: - StoryListView_Previews

struct StoryListView_Previews: PreviewProvider {
    static var previews: some View {
        StoryListView()
    }
}
