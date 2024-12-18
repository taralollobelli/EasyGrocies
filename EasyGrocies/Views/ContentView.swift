//
//  ContentView.swift
//  EasyGrocies
//
//  Created by Lorenzo Tarabelli on 13/12/24.
//

import SwiftUI

struct ContentView: View {
    //    @EnvironmentObject var subcategories: SubcategoryViewModel
    @State var categoryVM = CategoryViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.blueBase
                    .ignoresSafeArea()
                VStack {
                    Image ("berries")
                        .resizable()
                        .frame(width: 118, height: 118)
                    Text("Easy Grocies")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.title)
                    
                    //                    ForEach(subcategories.subcategories) { subcategory in
                    //                        Text(subcategory.name)
                    //                    }
                    
                    NavigationLink(destination: HomeView()) {
                        Text("Get Started!")
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .font(.headline)
                    .foregroundStyle(.blueBase)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                }
                
                
            }
        }.environmentObject(categoryVM)
    }
}

#Preview {
    ContentView()
    //        .environmentObject(SubcategoryViewModel())
}
