//
//  Untitled 3.swift
//  EasyGrocies
//
//  Created by Lorenzo Tarabelli on 17/12/24.
//

import SwiftUI

struct GastronomyNDeliView : View {
    @ObservedObject var categoryVM: CategoryViewModel // Riferimento al ViewModel
    
    var body: some View {
        if let gastronomyCategory = categoryVM.categories.first(where: { $0.name == "Gastronomy and Deli" }) {
            NavigationView {
                VStack {
                    Image("GastronomyNDeli") // Sostituisci con il nome dell'immagine per questa categoria
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        .shadow(color: Color.blueBase.opacity(0.5), radius: 15) // Colore verde per la categoria frutta e verdura
                        .padding()
                    
                    List(gastronomyCategory.subcategories, id: \.self) { subcategory in
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
//                    List(fruitsCategory.subcategories, id: \.self) { subcategory in
//                        Text(subcategory)
//                            .font(.body)
//                    }
//                    .listStyle(.insetGrouped) // Stile della lista (opzionale)
                }
                .navigationTitle(gastronomyCategory.name) // Titolo dinamico
                .navigationBarTitleDisplayMode(.large) // Forza Large Title
//                .toolbar {
//                    // Modifica il colore del titolo
//                    ToolbarItem(placement: .principal) {
//                        Text(fruitsCategory.name)
//                            .font(.largeTitle)
//                            .foregroundColor(.blueBase) // Cambia il colore del titolo
//                    }
//                }
            }
        } else {
            Text("Category not found")
                .font(.headline)
                .foregroundColor(.red)
        }
    }
}

#Preview {
    GastronomyNDeliView(categoryVM: CategoryViewModel())
}
