//
//import SwiftUI
//
//struct DetailedView: View {
//    @State private var quantity: Int = 1
//    var product: Product  // This will hold the selected product
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 16) {
//            
//            // Header with back button
////            HStack {
////                Button(action: {
////                    // Action to go back to the catalog
////                }) {
////                    HStack {
////                        Image(systemName: "chevron.left")
////                            .foregroundColor(.blue)
////                        Text("Catalogue")
////                            .foregroundColor(.blue)
////                    }
////                }
////                Spacer()
////            }
////            .padding([.top, .horizontal])
//            
//            Spacer(minLength: 20)
//            // Title and product details
//            Text("Product detail")
//                .font(.largeTitle)
//                .fontWeight(.bold)
//                .foregroundColor(.blueBase)
//                .padding(.horizontal)
//                
//            
//            // Product image
//            Image(product.image)  // Use the image associated with the product
//                .resizable()
//                .scaledToFit()
//                .frame(width: 300, height: 300)
////                .clipShape(Circle())
//                .padding(.horizontal)
//                .frame(maxWidth: .infinity)
//                .shadow(color: Color.blueBase.opacity(0.5), radius: 15)
//            
//            // Product description and price
//            HStack {
//                VStack(alignment: .leading, spacing: 8) {
//                    Text(product.name)  // Use the product's name
//                        .font(.title2)
//                        .fontWeight(.bold)
//                        .foregroundColor(.blueBase)
//                    
//                    Text(product.description)  // Use the product's description
//                        .font(.system(size: 14))
//                        .foregroundColor(.gray)
//                }
//                Spacer()
//                
//                // Price
//                ZStack {
//                    Circle()
//                        .fill(Color(UIColor.systemGray5))
//                        .frame(width: 110, height: 110)
//                    
//                    VStack {
//                        Text("\(product.priceKg, specifier: "%.2f")€/Kg")  // Display price per kg
//                            .font(.system(size: 12))
//                            .foregroundColor(.gray)
//                        Text("\(product.price, specifier: "%.2f")€")  // Display total price
//                            .font(.title)
//                            .fontWeight(.bold)
//                            .foregroundColor(.blueBase)
//                    }
//                }
//            }
//            .padding(.horizontal)
//            
//            VStack {
//                // Quantity stepper
//                HStack {
//                    HStack(spacing: 4) {
//                        Text("Quantity:")
//                            .font(.subheadline)
//                            .foregroundColor(.blueBase)
//                        
//                        Text("\(quantity)")
//                            .font(.system(size: 18, weight: .bold))
//                            .foregroundColor(.gray)
//                    }
//                    
//                    Stepper("", value: $quantity, in: 1...10)
//                        .labelsHidden()
//                }
//                .padding(.horizontal)
//                
//                // "Add to Cart" button
//                Button(action: {
//                    print("Added \(quantity) \(product.name) to cart")
//                }) {
//                    Text("Add to cart")
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .foregroundColor(.white)
//                        .background(Color.blueBase)
//                        .cornerRadius(20)
//                        .font(.title3)
//                        .fontWeight(.bold)
//                }
//                .padding(.horizontal)
//                .padding(.bottom, 20)
//                
//                Spacer()
//            }
//            }
//        }
//    }
//   
//
//#Preview {
//    let categoryViewModel = CategoryViewModel() // Create an instance of CategoryModel
//    DetailedView(product: categoryViewModel.products[0]) // Pass the first product from the model
//}

import SwiftUI

struct DetailedView: View {
    @State private var quantity: Int = 1
    var product: Product  // This will hold the selected product
    @Environment(\.dismiss) var dismiss // Access the dismiss function
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Spacer(minLength: 20)
            HStack {
                // Title and product details
                Text("Product detail")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.blueBase)
                    .padding(.horizontal)

                Spacer() // This pushes the following view (Button) to the trailing edge

                Button(action: {
                    dismiss() // Close the modal
                }) {
                    Image(systemName: "xmark.circle.fill") // Close icon
                        .font(.title)
                        .padding(.trailing, 16) // Add padding to the trailing edge of the button
                }
                .accessibilityLabel("Close modal")
            }

            // Product image
            Image(product.image)  // Use the image associated with the product
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .shadow(color: Color.blueBase.opacity(0.5), radius: 15)
            
            // Product description and price
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(product.name)  // Use the product's name
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.blueBase)
                    
                    Text(product.description)  // Use the product's description
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                Spacer()
                
                // Price
                ZStack {
                    Circle()
                        .fill(Color(UIColor.systemGray5))
                        .frame(width: 110, height: 110)
                    
                    VStack {
                        Text("\(product.priceKg, specifier: "%.2f")€/Kg")  // Display price per kg
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                        Text("\(product.price, specifier: "%.2f")€")  // Display total price
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.blueBase)
                    }
                }
            }
            .padding(.horizontal)
            
            Spacer(minLength: 20)
            
            VStack {
                // Quantity stepper
                HStack {
                    HStack(spacing: 4) {
                        Text("Quantity:")
                            .font(.subheadline)
                            .foregroundColor(.blueBase)
                        
                        Text("\(quantity)")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.gray)
                    }
                    
                    Stepper("", value: $quantity, in: 1...10)
                        .labelsHidden()
                }
                .padding(.horizontal)
                
                // "Add to Cart" button
                Button(action: {
                    print("Added \(quantity) \(product.name) to cart")
                }) {
                    Text("Add to cart")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blueBase)
                        .cornerRadius(20)
                        .font(.title3)
                        .fontWeight(.bold)
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
                
                Spacer()
            }
        }
        .navigationTitle(product.name) // Set navigation title to the product's name

    }
}

#Preview {
    let categoryViewModel = CategoryViewModel() // Create an instance of CategoryViewModel
    DetailedView(product: categoryViewModel.products[0]) // Pass the first product from the model
}
