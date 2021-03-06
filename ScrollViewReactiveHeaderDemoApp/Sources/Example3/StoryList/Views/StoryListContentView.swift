import SwiftUI

// MARK: - StoryListContentView

struct StoryListContentView: View {
    
    let viewModel: StoryListViewModel
    
    var body: some View {

        VStack {

            ForEach(viewModel.stories) { story in

                StoryListCell(viewModel: story)
            }
            
            ForEach(viewModel.stories) { story in

                StoryListCell(viewModel: story)
            }
        }.padding()
    }
}

// MARK: - StoryListContentView_Previews

struct StoryListContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        StoryListContentView(viewModel: StoryListViewModel.example)
    }
}
