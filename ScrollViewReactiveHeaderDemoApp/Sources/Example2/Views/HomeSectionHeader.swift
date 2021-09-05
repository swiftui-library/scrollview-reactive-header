import SwiftUI

// MARK: - HomeSectionHeader

struct HomeSectionHeader: View {
    @State var header: String
    @State var hPadding: CGFloat

    var body: some View {
        Text(header)
            .font(.title)
            .foregroundColor(.white)
            .fontWeight(.bold)
            .padding(EdgeInsets(top: 0, leading: hPadding, bottom: 0, trailing: 0))
    }
}

// MARK: - HomeSectionHeader_Previews

struct HomeSectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        HomeSectionHeader(header: "Recently Played", hPadding: 24)
    }
}
