import SwiftUI

// MARK: - PremiumBannerView

struct PremiumBannerView: View {

    @State var isRotating = false

    var body: some View {
        
        ZStack {
            
            Image("Vibes")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(1.25)
                .rotationEffect(.init(degrees: isRotating ? 0 : 360))
                .animation(animation)
                .onAppear {

                    isRotating = true
                }
                .mask(

                    Text("Spotify \nPremium")
                        .font(.system(size: 52))
                        .fontWeight(.black)
                        .frame(maxWidth: .infinity, alignment: .leading))
                .padding()
            
            VStack {
                
                Button(action: {}, label: {
                    
                    HStack {
                        
                        HStack {
                            
                            Text("Start the Party")
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                            
                            Image(systemName: "arrow.right")
                                .foregroundColor(.black)

                        }
                        .padding([.leading, .trailing], 8)
                        .padding(8)
                        .background(Color.white)
                        .cornerRadius(30)
                        
                        
                        Spacer()
                    }
                })
                .buttonStyle(PlainButtonStyle())

                Text("All the best music. Free for 30 days.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white)
                    
            }
            .padding()
            .padding(.top, 250)
        }
    }

    var animation: Animation {

        Animation.linear(duration: 20)
            .repeatForever(autoreverses: false)
    }
}

// MARK: - PremiumBannerView_Previews

struct PremiumBannerView_Previews: PreviewProvider {
    static var previews: some View {
        PremiumBannerView()
            .preferredColorScheme(.dark)
    }
}
