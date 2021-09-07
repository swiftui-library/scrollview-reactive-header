import SwiftUI

// MARK: - HomeHeaderView

struct HomeHeaderView: View {
    
    @State var hPadding: CGFloat
    @State var vPadding: CGFloat
    @Binding var scrollOffset: CGFloat

    var opacity: Double {
        
        return Double(1 + scrollOffset * 0.01)
    }

    var body: some View {
        VStack(alignment: .trailing) {
            HStack(alignment: .top) {
                Spacer()

                Image(systemName: "gearshape")
                    .foregroundColor(.white)
            }
            .padding(EdgeInsets(top: vPadding, leading: 0, bottom: 0, trailing: hPadding))
            Spacer()
        }
        .frame(height: 500)
        .background(
            RadialGradient(
                gradient: Gradient(colors: [Color.white, Color.clear]),
                center: UnitPoint(x: 0, y: -0.9),
                startRadius: 200,
                endRadius: 900))
        .opacity(opacity)
    }
}

// MARK: - HomeHeaderView_Previews

struct HomeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeaderView(hPadding: 24, vPadding: 0, scrollOffset: Binding.constant(.zero))
            .preferredColorScheme(.dark)
    }
}
