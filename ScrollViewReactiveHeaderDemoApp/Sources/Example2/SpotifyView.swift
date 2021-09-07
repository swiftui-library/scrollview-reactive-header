import SwiftUI

// MARK: - SpotifyHomeView

struct SpotifyView: View {

    var body: some View {
        
        SpotifyHomeView(sections: NetworkManager.shared.fetchHomeScreen())
    }
}

// MARK: - SpotifyHomeView_Previews

struct SpotifyHomeView_Previews: PreviewProvider {

    static var previews: some View {
        SpotifyView()
    }
}
