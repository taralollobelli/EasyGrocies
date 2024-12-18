//
//  DairyNCheeseView 2.swift
//  EasyGrocies
//
//  Created by Lorenzo Tarabelli on 17/12/24.
//


//import SwiftUI
//
//struct DairyNCheeseView: View {
//    @ObservedObject var categoryVM: CategoryViewModel // Riferimento al ViewModel
//    
//    var body: some View {
//        if let dairyCategory = categoryVM.categories.first(where: { $0.name == "Dairy and Cheese" }) {
//            NavigationView {
//                VStack {
//                    Image("DairyNCheese")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 300, height: 300)
//        //                .clipShape(Circle())
//                        .padding(.horizontal)
//                        .frame(maxWidth: .infinity)
//                        .shadow(color: Color.blueBase.opacity(0.5), radius: 15)
//                        .padding()
//                    
//                    List(dairyCategory.subcategories, id: \.self) { subcategory in
//                        Text(subcategory)
//                            .font(.body)
//                    }
//                    .listStyle(.insetGrouped) // Stile della lista (opzionale)
//                }
//                .navigationTitle(dairyCategory.name) // Titolo dinamico
//                .navigationBarTitleDisplayMode(.large) // Forza Large Title
//            }
//        } else {
//            Text("Category not found")
//                .font(.headline)
//                .foregroundColor(.red)
//        }
//    }
//}
//
//#Preview {
//    DairyNCheeseView(categoryVM: CategoryViewModel())
//}


import SwiftUI

struct DairyNCheeseView: View {
    @ObservedObject var categoryVM: CategoryViewModel // Reference to the ViewModel
    
    var body: some View {
        if let dairyCategory = categoryVM.categories.first(where: { $0.name == "Dairy and Cheese" }) {
            NavigationView {
                VStack {
                    Image("DairyNCheese")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        .shadow(color: Color.blueBase.opacity(0.5), radius: 15)
                        .padding()
                    
                    List(dairyCategory.subcategories, id: \.self) { subcategory in
                        NavigationLink(
                            destination: SubcategoryView(subcategory: subcategory, categoryVM: categoryVM)
                        ) {
                            HStack {
                                Image(systemName: "cart.fill") // Optional subcategory icon
                                    .foregroundColor(.blueBase)
                                    .font(.system(size: 20))
                                Text(subcategory)
                                    .font(.body)
                                    .padding(.leading, 8)
                            }
                            .padding(.vertical, 4)
                        }
                    }
                    .listStyle(.insetGrouped)
                }
                .navigationTitle(dairyCategory.name)
                .navigationBarTitleDisplayMode(.large)
            }
        } else {
            Text("Category not found")
                .font(.headline)
                .foregroundColor(.red)
        }
    }
}

#Preview {
    DairyNCheeseView(categoryVM: CategoryViewModel())
}
