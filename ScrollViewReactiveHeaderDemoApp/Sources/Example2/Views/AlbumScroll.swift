//
//  AlbumScroll.swift
//  SpotifyClone
//
//  Created by Trent Guillory on 10/31/20.
//

import SwiftUI

struct AlbumScroll: View {
    @State var section: HomeViewSection
    
    // add this later too (add spacing elements)
    @State var hPadding: CGFloat
    
    var body: some View {
        VStack(alignment: .leading) {
            HomeSectionHeader(header: section.title, hPadding: hPadding)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 18) {
                    Color.clear
                        .frame(width: hPadding - 18)
                    ForEach(section.albums, id: \.self) { album in
                        AlbumThumbnail(album: album)
                    }
                }
            }.frame(height: 150) // add after showing scroll
        }
    }
}

struct AlbumScroll_Previews: PreviewProvider {
    static var previews: some View {
        AlbumScroll(section: NetworkManager.shared.fetchHomeScreen().first!, hPadding: 24)
    }
}
