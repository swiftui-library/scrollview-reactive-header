import SwiftUI
import ScrollViewReactiveHeader

// MARK: - SpotifyHomeView

struct SpotifyHomeView: View {

    struct TopSpacer: View {
        var topSpace: CGFloat

        var body: some View {
            HStack {}
                .frame(width: 50, height: topSpace)
        }
    }

    struct OffsetReader: View {
        var body: some View {
            Color.clear
                .background(
                    GeometryReader { geo in
                        Color.clear.preference(
                            key: ScrollOffsetPreferenceKey.self,
                            value: geo.frame(in: .named("scrollView")).minY)
                    }).frame(height: 0)
        }
    }

    @State var sections: [HomeViewSection]
    @State var hPadding: CGFloat = 24
    @State var vPadding: CGFloat = 46
    @State var scrollViewOffset: CGFloat = .zero

    var body: some View {
        
        ScrollViewReactiveHeader(header: {
            
            HeaderView()
                .frame(height: 400)
        }, headerOverlay: {
            
            PremiumBannerView()
        }, body: {
            
            LazyVStack(spacing: vPadding) {
                
                TopSpacer(topSpace: 0)
                ForEach(sections, id: \.order) { section in
                    cellView(section: section)
                }
            }
        }, configuration: .init(showStatusBar: true, backgroundColor: .black))
        .background(Color.black)
        
//        GeometryReader { geometry in
//            ZStack(alignment: .top) {
//                HomeHeaderView(
//                    hPadding: hPadding,
//                    vPadding: geometry.safeAreaInsets.top + hPadding,
//                    scrollOffset: $scrollViewOffset)
//                ScrollView {
//                    OffsetReader()
//
//                    LazyVStack(spacing: vPadding) {
//                        TopSpacer(topSpace: vPadding)
//                        ForEach(sections, id: \.order) { section in
//                            cellView(section: section)
//                        }
//                    }
//
//                    // Spacer
//                    VStack {}
//                        .frame(height: 35)
//                }
//                .coordinateSpace(name: "scrollView")
//                .onPreferenceChange(ScrollOffsetPreferenceKey.self, perform: { offset in
//                    scrollViewOffset = offset
//                })
//            }
//            .background(Color.black)
//            .edgesIgnoringSafeArea(.top)
//        }
    }

    func cellView(section: HomeViewSection) -> AnyView {
        switch section.type {
        case .albumScroll:
            return AnyView(AlbumScroll(section: section, hPadding: 24))
        case .quickShuffle:
            return AnyView(QuickPlayGrid(section: section, hPadding: 24))
        }
    }
}

fileprivate struct HeaderView: View {

    var body: some View {

        Image("grainy")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .opacity(0.35)
    }
}

// MARK: - ScrollOffsetPreferenceKey

private struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {}
}

// MARK: - HomeView_Previews

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        SpotifyHomeView(sections: NetworkManager.shared.fetchHomeScreen())
            .preferredColorScheme(.dark)
    }
}
