//
//  RecipeView.swift
//  Reciplease
//
//  Created by Paul Oggero on 02/08/2022.
//

import SwiftUI

struct RecipeView: View {
    @State var selection: String? = nil
    var recipe: Recipe = Recipe.mock
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("\(Image(systemName: "hand.thumbsup.fill")) \(recipe.likes)")
                    Spacer()
                    Text("\(recipe.time) \(Image(systemName: "timer"))")
                }
                .padding(.top)
                Spacer()
                
                HStack {
                    Text(recipe.name)
                        .font(.system(.title))
                    Spacer()
                }
            }
            .background(
                AsyncImage(url: URL(string: recipe.imageURL))
                    .scaledToFit()
                    .mask(
                        LinearGradient(gradient: Gradient(
                            colors: [
                                .black,
                                .black,
                                .black,
                                .clear]
                        ),
                                       startPoint: .bottom,
                                       endPoint: .top)
                    ))
            .frame(
                width: UIScreen.main.bounds.size.width,
                height: UIScreen.main.bounds.size.width
            )
            
            VStack(alignment: .leading) {
                Section("Ingredients") {
                    ForEach(recipe.ingredientLines, id: \.self) { line in
                        Text(line)
                            .padding(.leading)
                    }
                }
            }
            
            Spacer()
            
            NavigationLink(destination: InstructionView(), tag: "instruction", selection: $selection) {
                EmptyView()
            }
            
            Button(action: {
                self.selection = "instruction"
            }, label: {
                Text("Show instructions")
            })
            .clipShape(Capsule())
            .buttonStyle(.borderedProminent)
            .tint(Color("Primary"))
            .shadow(color: Color("Primary"), radius: 25, x: 3, y: 5)
        }
        .navigationTitle(recipe.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                Button {
                    //
                } label: {
                    Image(systemName: "star")
                }
                
            }
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecipeView()
                .preferredColorScheme(.dark)
        }
    }
}
