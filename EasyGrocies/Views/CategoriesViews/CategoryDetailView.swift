//
//  CategoryView.swift
//  EasyGrocies
//
//  Created by Lorenzo Tarabelli on 17/12/24.
//

import SwiftUI

struct CategoryDetailView : View {
    
    private let selectedDisplayMode: NavigationBarItem.TitleDisplayMode = .large
    @EnvironmentObject var categoryVM: CategoryViewModel
    
    var body: some View {
        
        VStack {
            Text("CategoryDetailView")
        }
//        NavigationStack {
//            Text("CategoryView")
//            
//        }.navigationBarTitle(
//            ForEach(categoryVM.categories) { category in
//                Text(category.name)
//            }
    }
}

#Preview {
    CategoryDetailView()
}
