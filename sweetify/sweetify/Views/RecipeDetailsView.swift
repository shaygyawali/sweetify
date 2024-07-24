import Foundation
import SwiftUI

struct RecipeDetailView: View {
    @EnvironmentObject var viewModel: RecipeDetailViewModel
    @Environment(\.dismiss) private var dismiss
    enum Detail: String, CaseIterable, Identifiable {
        case ingredients, instructions
        var id: Self { self }
    }
    @State private var selectedDetail: Detail = .ingredients
    let id: String
    var instructionsList: [String] = []
    
    var body: some View {
        ZStack(alignment: .bottom){
            VStack(alignment: .leading){
                if let urlString = viewModel.detail?.thumbnail,
                   let url = URL(string: urlString) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/1.8)
                            .edgesIgnoringSafeArea(.top)
                    } placeholder: {
                        ProgressView()
                    }
                }
                Spacer()
            }
            VStack(alignment: .center) {
                RecipeHeader(viewModel: _viewModel)
                HStack {
                    ForEach(Detail.allCases) { detail in
                        Button(action: {
                            selectedDetail = detail
                        }) {
                            Text(detail.rawValue.capitalized)
                                .font(.headline)
                                .foregroundColor(selectedDetail == detail ? Color.white : Color("SelectInactiveFont"))
                                .padding()
                                .background(selectedDetail == detail ?  Color.pink : Color("SelectInactive"))
                                .cornerRadius(10)
                        }.frame(width:UIScreen.main.bounds.width * 0.40)
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.85, alignment: .leading)
                
                switch selectedDetail {
                case .ingredients:
                    if let ingredients = viewModel.detail?.ingredients {
                        if let measures = viewModel.detail?.measures{
                            RecipeIngredientsView(ingredients: ingredients, measures: measures)
                        }
                    } else {
                        Text("🫙 No Ingredients Found")
                    }
                case .instructions:
                    if let instructions = viewModel.detail?.instructions {
                        let instructionsList = viewModel.listifyInstructions(instructions: instructions)
                        RecipeInstructionsView(instructions: instructionsList)
                    }
                }
                
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.65)
            .edgesIgnoringSafeArea(.bottom)
            .background(Color(.white))
            .clipShape(RoundedRectangle(cornerRadius: 50.0))
            
        }
        .onAppear {
            viewModel.findRecipe(id: id)
            viewModel.fetchRecipeDetails()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                BackButton {
                    dismiss()
                }
            }
        }
    }
}

struct RecipeHeader: View {
    @EnvironmentObject var viewModel: RecipeDetailViewModel
    var body: some View {
        Text("\(viewModel.detail?.name ?? "Recipe Details")")
            .font(.largeTitle).bold()
            .frame(width: UIScreen.main.bounds.width * 0.85, alignment: .leading)
            .padding(.top, 40)
        
        if let tags = viewModel.detail?.tags {
            let tagList = viewModel.listifyTags(tags: tags)
            ForEach(tagList.indices) { index in
                Text("\(tagList[index]) ")
                .frame(width: UIScreen.main.bounds.width * 0.85, alignment: .leading)
                .foregroundColor(Color(.lightGray))
                .padding(.bottom, 5)
            }
        }
        
        HStack (alignment: .bottom){
            VStack(alignment: .center) {
                Image(systemName: "globe.americas.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                if let area = viewModel.detail?.area{
                    Text("\(area)")
                }
            }
            Spacer()
            VStack(alignment: .center) {
                Image(systemName: "birthday.cake.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                Text("Dessert")
            }
            Spacer()
            VStack{
                if let instructions = viewModel.detail?.instructions {
                    let instructionsList = viewModel.listifyInstructions(instructions: instructions)
                    let imgString = "\(instructionsList.count).square"
                    Image(systemName: imgString)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                    Text("Steps")
                }
            }

        }.padding(.top, 10).padding(.bottom, 15)
         .frame(width: UIScreen.main.bounds.width * 0.80, alignment: .leading)


    }
}
                           
