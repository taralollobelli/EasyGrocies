//
//  HomeView.swift
//  EasyGrocies
//
//  Created by Lorenzo Tarabelli on 13/12/24.
//
import SwiftUI

struct HomeView: View {
    private let selectedDisplayMode: NavigationBarItem.TitleDisplayMode = .large
    private let navigationTitle: String = "Hello Lorenzo!"
    @EnvironmentObject var categoryVM: CategoryViewModel
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Rectangle()
                        .cornerRadius(10)
                        .foregroundColor(Color.blueBase)
                        .frame(width: 361, height: 228)
                } header: {
                    Text("Show your fidelity card...")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.blueBase)
                        .textCase(nil)
                }
                
                Section {
                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                            ForEach(categoryVM.categories) { category in
                                NavigationLink {
                                    switch category.name {
                                    case "Dairy and Cheese":
                                        DairyNCheeseView(categoryVM: categoryVM)
                                    case "Fruits and Vegetable":
                                        FruitsNVegetableView(categoryVM: categoryVM)
                                    case "Gastronomy and Deli":
                                        GastronomyNDeliView(categoryVM: categoryVM)
                                    case "Meat and Fish":
                                        MeatNFishView(categoryVM: categoryVM)
                                    default:
                                        CategoryDetailView(categoryVM: _categoryVM)
                                    }
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 14)
                                            .foregroundColor(Color.white)
                                            .frame(width: 110, height: 160)
                                            .shadow(radius: 7)
                                            .opacity(0.5)
                                        
                                        VStack {
                                            Image(category.categoryImage)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 70, height: 70)
                                                .padding(10)
                                            
                                            Text(category.name)
                                                .font(.body)
                                                .foregroundColor(Color.blueBase)
                                                .fontWeight(.bold)
                                                .multilineTextAlignment(.center)
                                                .frame(width: 100)
                                                .lineLimit(2)
                                                .truncationMode(.tail)
                                        }
                                    }
                                    .padding(5)
                                }
                            }
                        }
                    }
                } header: {
                    Text("Categories")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.blueBase)
                        .textCase(nil)
                }
            }
            .listStyle(PlainListStyle())
        }
        .navigationTitle(navigationTitle)
        .navigationBarTitleDisplayMode(selectedDisplayMode)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: CartView()) {
                    HStack {
                        Image(systemName: "cart")
                        Text("Cart")
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(CategoryViewModel())
}





//import SwiftUI
//
//
//
//struct HomeView: View {
//    private let selectedDisplayMode: NavigationBarItem.TitleDisplayMode = .large
//    private let navigationTitle: String = "Hello Lorenzo!"
//    @EnvironmentObject var categoryVM: CategoryViewModel
//    
//    var body: some View {
//        NavigationStack {
//            //ScrollView {
//            List {
//                Section  {
//                    Rectangle()
//                        .cornerRadius(10)
//                        .foregroundColor(Color.blueBase)
//                        .frame(width: 361, height: 228)
//                    
//                } header: {
//                    Text("Show your fidelity card...") // Regular casing
//                        .font(.title2)
//                        .fontWeight(.bold)
//                        .foregroundColor(.blueBase)
//                                            .textCase(nil) // Prevents capitalization
//                }
//                
//                Section  {
//                    ScrollView (.horizontal) {
//                        
//                        HStack (spacing: 10) {
//                            
//                            ForEach(categoryVM.categories) { category in
//                                
//                                NavigationLink {
//                                    switch category.name {
//                                    case "Dairy and Cheese":
//                                        DairyNCheeseView(categoryVM: categoryVM)
//                                    case "Fruits and Vegetable":
//                                        FruitsNVegetableView(categoryVM: categoryVM)
//                                    case "Gastronomy and Deli":
//                                        GastronomyNDeliView(categoryVM: categoryVM)
//                                    case "Meat and Fish":
//                                        MeatNFishView(categoryVM: categoryVM)
//                                    default:
//                                        CategoryDetailView(categoryVM: _categoryVM)
//                                    }
//                                } label: {
//                                    ZStack {
//                                        RoundedRectangle(cornerRadius: 14)
//                                            .foregroundColor(Color.white)
//                                            .frame(width: 110, height: 160)
//                                            .shadow(radius: 1)
//                                            .opacity(0.5)
//                                        
//                                        VStack {
//                                            Image(category.categoryImage)
//                                                .resizable()
//                                                .scaledToFit()
//                                                .frame(width: 70, height: 70)
//                                                .padding(10)
//                                            
//                                            Text(category.name)
//                                                .font(.body)
//                                                .foregroundColor(Color.blueBase)
//                                                .fontWeight(.bold)
//                                                .multilineTextAlignment(.center) // Allinea il testo al centro
//                                                .frame(width: 100) // Limita la larghezza per rispettare il RoundedRectangle
//                                                .lineLimit(2) // Permette massimo 2 righe
//                                                .truncationMode(.tail) // Tronca il testo se troppo lungo
//                                            
//                                        }
//                                        
//                                        //                                        Image(systemName: category.categoryImage)
//                                        //                                            .foregroundColor(Color.blue)
//                                        //                                            .font(.title3)
//                                        //                                            .frame(width: 36, height: 36)
//                                        //                                            .padding()
//                                        //                                        Text(category.name)
//                                    }
//                                }
//                                
//                                
//                                
//                            }
//                        }
//                        
//                    }
//                    
//                } header: {
//                    Text("Categories") // Regular casing
//                        .font(.title2)
//                        .fontWeight(.bold)
//                        .foregroundColor(.blueBase)
//                                            .textCase(nil) // Prevents capitalization
//                }
//                
//                //                // Function to determine the destination view based on the selected category
//                //                    func destinationView(for category: Category) -> some View {
//                //                        switch category.name {
//                //                        case "Dairy and Cheese":
//                //                            return AnyView(DairyNCheeseView(categoryVM: categoryVM))
//                //                        case "Fruits and Vegetables":
//                //                            return AnyView(FruitsNVegetableView(categoryVM: categoryVM))
//                //                        case "Gastronomy and Deli":
//                //                            return AnyView(GastronomyNDeliView(categoryVM: categoryVM))
//                //                        case "Meat and Fish":
//                //                            return AnyView(MeatNFishView(categoryVM: categoryVM))
//                //                        default:
//                //                            return AnyView(CategoryDetailView(categoryVM: categoryVM)) // Default view
//                //                        }
//                
//                Section  {
//                    Rectangle()
//                        .cornerRadius(10)
//                        .foregroundColor(Color.blueBase)
//                        .frame(width: 361, height: 228)
//                    
//                } header: {
//                    Text("Show your fidelity card...") // Regular casing
//                        .font(.title2)
//                        .fontWeight(.bold)
//                        .foregroundColor(.primary)
//                        .textCase(nil) // Prevents capitalization
//                }
//            }
//            .listStyle(PlainListStyle())
////            .listStyle(InsetGroupedListStyle()) // Optional styling
//            
//            NavigationLink(destination: EmptyView()) {
//                
//                
//            }
//        }
//        .navigationTitle(navigationTitle)
//        .navigationBarTitleDisplayMode(selectedDisplayMode)
//        .environmentObject(categoryVM)
//    }
//}
////}
//
//
//#Preview {
//    HomeView()
//        .environmentObject(CategoryViewModel())
//}
