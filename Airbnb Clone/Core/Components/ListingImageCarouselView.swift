//
//  ListingImageCarouselView.swift
//  Airbnb Clone
//
//  Created by Biwash Chapai on 12/7/23.
//

import SwiftUI

struct ListingImageCarouselView: View {
    var images = [
        "listing-1",
        "listing-2",
        "listing-3",
        "listing-4"
    ]
    var body: some View {
        TabView {
            ForEach( images, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
//        .frame(height:320)
//        .clipShape(RoundedRectangle(cornerRadius: 10))
        .tabViewStyle(.page)    }
}

#Preview {
    ListingImageCarouselView()
}
