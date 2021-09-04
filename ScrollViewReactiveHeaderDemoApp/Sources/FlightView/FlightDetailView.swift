import SwiftUI
import UIKit

// MARK: - FlightDetailView

struct FlightDetailView: View {
    
    var body: some View {

        VStack {
                
Text("Boarding Passes")
                .font(.system(size: 24, weight: .regular, design: .serif))
            HStack {}
                .frame(height: 200)

            Text("Upgrades")

            Text("Perks")
        }
    }
}

// MARK: - FlightDetailView_Previews

struct FlightDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FlightDetailView()
    }
}
