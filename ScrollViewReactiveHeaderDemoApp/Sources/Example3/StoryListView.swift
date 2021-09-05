import ScrollViewReactiveHeader
import SwiftUI

// MARK: - StoryListView

struct StoryListView: View {

    let viewModel: StoryListViewModel = .example

    var body: some View {


            ScrollViewReactiveHeader(header: {

                HeaderView()
            }, headerOverlay: {

                StoryListHeaderOverlay(header: viewModel.header)
            }, body: {

                StoryListContentView(viewModel: viewModel)
            })

//        ScrollView {
//
//            VStack {
//
//                HeaderView()
//                    .background(GeometryReaderOverlay())
//
//                StoryListHeaderOverlay(header: viewModel.header)
//
//                StoryListContentView(viewModel: viewModel)
//
//            }
//        }
//        .onPreferenceChange(ScrollViewHeaderKey.self) { preferenceData in
//
//            print(preferenceData.rect.height)
//        }
    }
}

// MARK: - HeaderView

struct HeaderView: View {

    var body: some View {

        Image("background3")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .opacity(0.35)
            .frame(height: 300)
    }
}


// MARK: - StoryListView_Previews

struct StoryListView_Previews: PreviewProvider {
    static var previews: some View {
        StoryListView()
    }
}
