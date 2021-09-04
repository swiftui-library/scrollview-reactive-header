import SwiftUI

// MARK: - FlightHeaderView

struct FlightHeaderView: View {

    let viewModel: FlightViewModel
    
    let labelFont: Font = .system(size: 32, weight: .light, design: .rounded)

    var body: some View {

        VStack {
            
            Spacer()

            if let firstFlight = viewModel.flights.first,
               let lastFlight = viewModel.flights.last {
                
                HStack {

                    Text(firstFlight.departingAirport.abbreviatedName)
                        .font(labelFont)

                    Spacer()
                    
                    Image(systemName: "airplane")

                    Spacer()
                    
                    Text(lastFlight.arrivingAirport.abbreviatedName)
                        .font(labelFont)
                }
            }
        }
        .preferredColorScheme(.dark)
    }
    
    struct airportLabelStyle: ViewModifier {
        
        func body(content: Content) -> some View {
            
            return content.font(.system(size: 16, weight: .semibold, design: .rounded))
        }
    }
}

// MARK: - FlightHeaderView_Previews

struct FlightHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        
        FlightHeaderView(viewModel: FlightViewModel.example)
    }
}
