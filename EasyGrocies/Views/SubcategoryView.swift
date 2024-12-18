//
//  SubcategoryView.swift
//  EasyGrocies
//
//  Created by Lorenzo Tarabelli on 17/12/24.
//

import SwiftUI

struct SubcategoryView: View {
    var subcategory: String
    @ObservedObject var categoryVM: CategoryViewModel
    @State private var isPresented: Bool = false
    @State private var selectedProduct: Product? // Track the currently selected product
    
    var body: some View {
        let products = categoryVM.getProducts(for: subcategory) // Get products for the subcategory
        
        List(products, id: \.id) { product in
            Button {
                selectedProduct = product // Set the selected product
                isPresented = true // Present the sheet
            } label: {
                VStack(alignment: .leading, spacing: 8) {
                    Text(product.name) // Product name
                        .font(.headline)
                    
                    Text(product.description) // Product description
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text(String(format: "%.2f€", product.price)) // Product price
                        .font(.body)
                        .foregroundColor(.green)
                }
                .padding(.vertical, 8) // Add some vertical padding for better spacing
            }
        }
        .navigationTitle(subcategory) // Set the navigation title to the subcategory name
        .sheet(isPresented: $isPresented) {
            if let product = selectedProduct {
                DetailedView(product: product) // Pass the selected product to DetailedView
            }
        }
    }
}
//
//import SwiftUI
//
//struct SubcategoryView: View {
//    var subcategory: String
//    @ObservedObject var categoryVM: CategoryViewModel
//    @State var isPresented: Bool = false
//    
//    var body: some View {
//        let products = categoryVM.getProducts(for: subcategory) // Get products for the subcategory
//        
//        List(products, id: \.id) { product in // Use `id` since Product conforms to Identifiable
//           
//            Button {
//               isPresented = true
//            } label: {
//                VStack(alignment: .leading, spacing: 8) {
//                    Text(product.name) // Product name
//                        .font(.headline)
//                    
//                    Text(product.description) // Product description
//                        .font(.subheadline)
//                        .foregroundColor(.secondary)
//                    
//                    Text(String(format: "$%.2f", product.price)) // Product price
//                        .font(.body)
//                        .foregroundColor(.green)
//                }
//            
//                .padding(.vertical, 8) // Add some vertical padding for better spacing
//            }
//           
//            .sheet(isPresented: $isPresented) {
//                DetailedView(product: product)
//                
//
//
//            }
//        }
//        .navigationTitle(subcategory) // Set the navigation title to the subcategory name
//    }
//}
//


//class CategoryViewModel: ObservableObject {
//    @Published var categories: [Category] = [] // Your categories
//    
//    // Example method to get products for a specific subcategory
//    func getProducts(for subcategory: String) -> [String] {
//        // Example: Find the subcategory and return the products related to it
//        if let category = categories.first(where: { $0.subcategories.contains(subcategory) }) {
//            // Assuming 'products' is a dictionary with subcategory names as keys
//            return category.products[subcategory] ?? [] // Example: category.products could be a dictionary
//        }
//        return []
//    }
//}
