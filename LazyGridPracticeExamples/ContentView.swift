//
//  ContentView.swift
//  LazyGridPracticeExamples
//
//  Created by Viennarz Curtiz on 3/16/22.
//

import SwiftUI

struct ContentView: View {
    let columns1 = [GridItem].init(repeating: GridItem(), count: 4)
    
    let columns2 = [GridItem].init(repeating: GridItem(.flexible(minimum: 20, maximum: 100)), count: 4)
    
    let columns3 = [
        GridItem(.adaptive(minimum: 100, maximum: 150)),
        GridItem(.adaptive(minimum: 100, maximum: 150)),
        GridItem(.adaptive(minimum: 100, maximum: 150))
    ]
    
    let texts = [
        "Burger",
        "Pizza",
        "Fries",
        "Soda",
        "Bacon Cheeseburger",
        "Pork Chops",
        "Coke"
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
      
                LazyVGrid(columns: columns1) {
                    ForEach(texts, id: \.self) { item in
                        Text(item)
                            .padding(8)
                            .background(ContainerRelativeShape().fill(Color.red))
                    }
                }
                
                Divider()
                
                LazyVGrid(columns: columns2, alignment: HorizontalAlignment.center) {
                    ForEach(texts, id: \.self) { item in
                        Text(item)
                            .padding(8)
                            .background(ContainerRelativeShape().fill(Color.red))
                    }
                }
                .statusBar(hidden: /*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
                
                Divider()
                
                LazyVGrid(columns: columns3, alignment: HorizontalAlignment.center) {
                    ForEach(texts, id: \.self) { item in
                        Text(item)
                            .padding(8)
                            .fixedSize(horizontal: true, vertical: false)
                            .background(ContainerRelativeShape().fill(Color.red))
                    }
                }
                
                Divider()
                
                LazyHGrid(rows: columns1, alignment: VerticalAlignment.top, spacing: 32) {
                    ForEach(texts, id: \.self) { item in
                        Text(item)
                            .padding(8)
                            .fixedSize(horizontal: true, vertical: false)
                            .background(ContainerRelativeShape().fill(Color.red))
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
        ContentView()
            .previewDevice("iPhone SE (2nd generation)")
    }
}
