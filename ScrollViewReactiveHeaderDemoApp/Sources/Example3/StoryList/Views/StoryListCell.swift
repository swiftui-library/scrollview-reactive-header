import SwiftUI

// MARK: - StoryListCell

struct StoryListCell: View {

    let viewModel: Story
    let iconWidth: CGFloat = 30
    let labelWidth: CGFloat = 20

    var body: some View {

        HStack {

            VStack {

                Text(viewModel.title)
                    .font(.system(size: 16, weight: .semibold, design: .serif))
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text(viewModel.description)
                    .font(.system(size: 13, weight: .regular, design: .serif))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            VStack(alignment: .trailing) {

                HStack {

                    Image(systemName: "book")
                        .frame(width: iconWidth)
                    Text(String(viewModel.reads))
                        .font(.system(size: 15))
                        .frame(width: labelWidth)
                }
    
                Divider()

                HStack {

                    Image(systemName: "bookmark")
                        .frame(width: iconWidth)
                    Text(String(viewModel.favorites))
                        .font(.system(size: 15))
                        .frame(width: labelWidth)
                }
            }
            .frame(width: 60)
            .opacity(0.5)
        }.padding()
            .overlay(
                RoundedRectangle(cornerRadius: 6, style: .continuous)
                    .stroke(Color.black.opacity(0.1), lineWidth: 2))
    }
}

// MARK: - StoryListCell_Previews

struct StoryListCell_Previews: PreviewProvider {
    static var previews: some View {

        StoryListCell(viewModel: .peculiar)
            .padding()
    }
}
