//
//  CategoryViewModel.swift
//  EasyGrocies
//
//  Created by Lorenzo Tarabelli on 13/12/24.
//

import SwiftUI

struct Category: Identifiable {
    let id: UUID = UUID()
    let name: String
    var categoryImage: String
    var subcategories: [String] = []
}

@Observable class CategoryViewModel: ObservableObject {
    
    var categories: [Category] = [
        Category(name: "Fruits and Vegetable", categoryImage: "FruitNVegetable", subcategories: ["Fresh fruits", "Fresh vegetables", "Ready-to-eat salads"]),
        Category(name: "Meat and Fish", categoryImage: "MeatNFish", subcategories: ["Beef, pork, and poultry", "Fresh fish and shellfish", "Ready-to-cook preparations"]),
        Category(name: "Gastronomy and Deli", categoryImage: "GastronomyNDeli", subcategories: ["Freshly sliced cold cuts", "Gourmet specialties", "Ready-to-eat dishes", "Regional products"]),
        Category(name: "Dairy and Cheese", categoryImage: "DairyNCheese", subcategories: ["Fresh and aged cheeses", "Milk and cream", "Yogurt and fresh desserts"]),
        
        ]
    
    var products = [
        Product(name: "Chicken Breast", price: 9.99, priceKg: 7.99, image: "ChickenBreast", description: "Fresh chicken breast fillets", category: "Meat and Fish", subcategory: "Beef, pork, and poultry"),
        Product(name: "Salmon Fillet", price: 14.99, priceKg: 12.99, image: "SalmonFillet", description: "Freshly caught wild salmon fillet", category: "Meat and Fish", subcategory: "Fresh fish and shellfish"),
        Product(name: "Pork Chop", price: 8.99, priceKg: 6.99, image: "PorkChop", description: "Tender pork chop for grilling", category: "Meat and Fish", subcategory: "Beef, pork, and poultry"),
        Product(name: "Mixed Lettuce", price: 3.99, priceKg: 2.99, image: "MixedLettuce", description: "Fresh mixed lettuce for salads", category: "Fruits and Vegetable", subcategory: "Fresh vegetables"),
        Product(name: "Tomatoes", price: 2.99, priceKg: 2.49, image: "Tomatoes", description: "Fresh organic tomatoes", category: "Fruits and Vegetable", subcategory: "Fresh vegetables"),
        Product(name: "Apple", price: 1.99, priceKg: 1.79, image: "Apple", description: "Crisp and sweet apples", category: "Fruits and Vegetable", subcategory: "Fresh fruits"),
        Product(name: "Avocado", price: 2.49, priceKg: 2.20, image: "Avocado", description: "Ripe and creamy avocados", category: "Fruits and Vegetable", subcategory: "Fresh fruits"),
        Product(name: "Cheddar Cheese", price: 5.99, priceKg: 4.99, image: "CheddarCheese", description: "Sharp and creamy cheddar cheese", category: "Dairy and Cheese", subcategory: "Fresh and aged cheeses"),
        Product(name: "Milk", price: 1.49, priceKg: 1.29, image: "Milk", description: "Fresh whole milk", category: "Dairy and Cheese", subcategory: "Milk and cream"),
        Product(name: "Yogurt", price: 2.49, priceKg: 1.99, image: "Yogurt", description: "Creamy plain yogurt", category: "Dairy and Cheese", subcategory: "Yogurt and fresh desserts"),
        Product(name: "Prosciutto", price: 9.99, priceKg: 8.49, image: "Prosciutto", description: "Freshly sliced prosciutto ham", category: "Gastronomy and Deli", subcategory: "Freshly sliced cold cuts"),
        Product(name: "Gourmet Salami", price: 12.99, priceKg: 11.99, image: "GourmetSalami", description: "Delicious gourmet salami", category: "Gastronomy and Deli", subcategory: "Gourmet specialties"),
        Product(name: "Regional Cheese", price: 7.99, priceKg: 6.99, image: "RegionalCheese", description: "A selection of regional cheeses", category: "Gastronomy and Deli", subcategory: "Regional products"),
        Product(name: "Ready-to-eat Salad", price: 5.49, priceKg: 4.99, image: "ReadyToEatSalad", description: "Pre-packed ready-to-eat salad", category: "Fruits and Vegetable", subcategory: "Ready-to-eat salads"),
        Product(name: "Ready-to-cook Pasta", price: 3.49, priceKg: 2.99, image: "ReadyToCookPasta", description: "Quick and easy ready-to-cook pasta", category: "Gastronomy and Deli", subcategory: "Ready-to-eat dishes"),
        Product(name: "Bananas", price: 2.99, priceKg: 1.99, image: "Bananas", description: "Fresh ripe bananas", category: "Fruits and Vegetable", subcategory: "Fresh fruits"),
        Product(name: "Cucumber", price: 1.49, priceKg: 1.29, image: "Cucumber", description: "Crisp and fresh cucumbers", category: "Fruits and Vegetable", subcategory: "Fresh vegetables"),
        Product(name: "Carrots", price: 2.49, priceKg: 2.00, image: "Carrots", description: "Fresh carrots for cooking and snacking", category: "Fruits and Vegetable", subcategory: "Fresh vegetables"),
        Product(name: "Lettuce", price: 1.99, priceKg: 1.79, image: "Lettuce", description: "Fresh and crunchy lettuce", category: "Fruits and Vegetable", subcategory: "Fresh vegetables"),
        Product(name: "Grapes", price: 3.99, priceKg: 2.99, image: "Grapes", description: "Fresh, sweet grapes", category: "Fruits and Vegetable", subcategory: "Fresh fruits"),
        Product(name: "Turkey Breast", price: 7.99, priceKg: 6.99, image: "TurkeyBreast", description: "Juicy turkey breast slices", category: "Meat and Fish", subcategory: "Beef, pork, and poultry"),
        Product(name: "Cod Fillets", price: 12.99, priceKg: 9.99, image: "CodFillets", description: "Fresh cod fillets from the ocean", category: "Meat and Fish", subcategory: "Fresh fish and shellfish"),
        Product(name: "Shrimp", price: 15.99, priceKg: 13.99, image: "Shrimp", description: "Fresh shrimp ready to cook", category: "Meat and Fish", subcategory: "Fresh fish and shellfish"),
        Product(name: "Lamb Chops", price: 14.99, priceKg: 12.99, image: "LambChops", description: "Tender lamb chops for grilling", category: "Meat and Fish", subcategory: "Beef, pork, and poultry"),
        Product(name: "Salmon", price: 16.99, priceKg: 14.99, image: "Salmon", description: "Freshly prepared salmon steaks", category: "Meat and Fish", subcategory: "Fresh fish and shellfish"),
        Product(name: "Brie Cheese", price: 5.99, priceKg: 4.49, image: "BrieCheese", description: "Soft and creamy Brie cheese", category: "Dairy and Cheese", subcategory: "Fresh and aged cheeses"),
        Product(name: "Butter", price: 3.49, priceKg: 2.99, image: "Butter", description: "Creamy butter made from fresh milk", category: "Dairy and Cheese", subcategory: "Milk and cream"),
        Product(name: "Ricotta", price: 4.99, priceKg: 3.79, image: "Ricotta", description: "Fresh ricotta cheese", category: "Dairy and Cheese", subcategory: "Fresh and aged cheeses"),
        Product(name: "Cream Cheese", price: 2.99, priceKg: 2.49, image: "CreamCheese", description: "Rich and smooth cream cheese", category: "Dairy and Cheese", subcategory: "Milk and cream"),
        Product(name: "Mozzarella", price: 5.49, priceKg: 4.99, image: "Mozzarella", description: "Fresh mozzarella, perfect for salads", category: "Dairy and Cheese", subcategory: "Fresh and aged cheeses"),
        Product(name: "Prosciutto di Parma", price: 12.99, priceKg: 9.99, image: "ProsciuttoDiParma", description: "Authentic Italian Prosciutto di Parma", category: "Gastronomy and Deli", subcategory: "Freshly sliced cold cuts"),
        Product(name: "Tuna Salad", price: 6.49, priceKg: 5.99, image: "TunaSalad", description: "Ready-to-eat tuna salad with vegetables", category: "Gastronomy and Deli", subcategory: "Ready-to-eat dishes"),
        Product(name: "Salami", price: 8.99, priceKg: 7.49, image: "Salami", description: "Spicy and savory Italian salami", category: "Gastronomy and Deli", subcategory: "Gourmet specialties"),
        Product(name: "Roast Beef", price: 10.99, priceKg: 9.49, image: "RoastBeef", description: "Tender, slow-cooked roast beef", category: "Gastronomy and Deli", subcategory: "Freshly sliced cold cuts"),
        Product(name: "Pâté", price: 6.99, priceKg: 6.49, image: "Pate", description: "Smooth and rich liver pâté", category: "Gastronomy and Deli", subcategory: "Gourmet specialties"),
        Product(name: "Prepacked Caesar Salad", price: 4.49, priceKg: 3.99, image: "PrepackedCaesarSalad", description: "Convenient pre-packed Caesar salad", category: "Fruits and Vegetable", subcategory: "Ready-to-eat salads"),
        Product(name: "Sandwiches", price: 3.99, priceKg: 3.49, image: "Sandwiches", description: "Freshly made sandwiches with various fillings", category: "Gastronomy and Deli", subcategory: "Ready-to-eat dishes"),
        Product(name: "Fruit Parfait", price: 5.49, priceKg: 4.99, image: "FruitParfait", description: "Layered fruit and yogurt parfait", category: "Fruits and Vegetable", subcategory: "Ready-to-eat salads"),
        Product(name: "Sushi Box", price: 8.99, priceKg: 7.99, image: "SushiBox", description: "Fresh sushi box with fish and rice", category: "Gastronomy and Deli", subcategory: "Ready-to-eat dishes")
    ]
    
    // Method to get products for a specific subcategory
    func getProducts(for subcategory: String) -> [Product] {
        return products.filter { $0.subcategory == subcategory }
    }
    
    // Method to get category image by category name
    func getCategoryImage(for category: String) -> String? {
        categories.first(where: { $0.name == category })?.categoryImage
    }
}

//
//@Observable class SubcategoryViewModel: ObservableObject {
//    
//    var subcategories: [Subcategory] = [
//        Subcategory(name: "Fresh fruits"),
//        Subcategory(name: "Fresh vegetables"),
//        Subcategory(name: "Ready-to-eat salads"),
//        Subcategory(name: "Dried and dehydrated fruits"),
//        Subcategory(name: "Vegetarian ready meals"),
//        Subcategory(name: "Beef, pork, and poultry"),
//        Subcategory(name: "Fresh fish and shellfish"),
//        Subcategory(name: "Ready-to-cook preparations"),
//        Subcategory(name: "Freshly sliced cold cuts"),
//        Subcategory(name: "Gourmet specialties"),
//        Subcategory(name: "Ready-to-eat dishes"),
//        Subcategory(name: "Regional products"),
//        Subcategory(name: "Fresh and aged cheeses"),
//        Subcategory(name: "Milk and cream"),
//        Subcategory(name: "Yogurt and fresh desserts")
//    ]
//}
// Dati di esempio
//struct DataProvider {
//    static let categories: [Category] = [
//        Category(
//            id: UUID(),
//            name: "Fruits and Vegetables",
//            subcategories: [
//                Subcategory(id: UUID(), name: "Fresh fruits"),
//                Subcategory(id: UUID(), name: "Fresh vegetables"),
//                Subcategory(id: UUID(), name: "Ready-to-eat salads"),
//                Subcategory(id: UUID(), name: "Dried and dehydrated fruits"),
//                Subcategory(id: UUID(), name: "Vegetarian ready meals")
//            ]
//        ),
//        Category(
//            id: UUID(),
//            name: "Meat and Fish",
//            subcategories: [
//                Subcategory(id: UUID(), name: "Beef, pork, and poultry"),
//                Subcategory(id: UUID(), name: "Fresh fish and shellfish"),
//                Subcategory(id: UUID(), name: "Ready-to-cook preparations")
//            ]
//        ),
//        Category(
//            id: UUID(),
//            name: "Gastronomy and Deli",
//            subcategories: [
//                Subcategory(id: UUID(), name: "Freshly sliced cold cuts"),
//                Subcategory(id: UUID(), name: "Gourmet specialties"),
//                Subcategory(id: UUID(), name: "Ready-to-eat dishes"),
//                Subcategory(id: UUID(), name: "Regional products")
//            ]
//        ),
//        Category(
//            id: UUID(),
//            name: "Dairy and Cheese",
//            subcategories: [
//                Subcategory(id: UUID(), name: "Fresh and aged cheeses"),
//                Subcategory(id: UUID(), name: "Milk and cream"),
//                Subcategory(id: UUID(), name: "Yogurt and fresh desserts")
//            ]
//        )
//    ]
//}
//
