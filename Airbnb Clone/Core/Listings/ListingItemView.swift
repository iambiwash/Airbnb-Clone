//
//  ListingsView.swift
//  Airbnb Clone
//
//  Created by Biwash Chapai on 12/6/23.
//

import SwiftUI

struct ListingItemView: View {
    
    var images = [
        "listing-1",
        "listing-2",
        "listing-3",
        "listing-4"
    ]
    
    var body: some View {
        VStack(spacing: 8) {            //Virtually stacked images and their text info
            //images
            ListingImageCarouselView()
                .frame(height:320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            //listing details
            HStack(alignment: .top) {   //alignment here makes the details and rating start top of the stack.
                
                //details
                VStack(alignment: .leading) {
                    Text("Miami, Florida")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    Text("12 miles Away")
                        .foregroundStyle(.gray)
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    HStack(spacing: 4){         //Did this so that just the price can be highligted
                        Text("$567")
                            .fontWeight(.semibold)
                        Text("per night")
                    }
                    .foregroundStyle(.black)
                    
                }
                
                Spacer()                //Moves Details to the left and gives us space
                
                //ratings
                HStack(spacing: 2){
                    Image(systemName: "star.fill")
                    Text("4.86")
                }
                .foregroundStyle(.black)
            }
            .font(.footnote)
           
        }
        //.padding() This is a child view. You don't have to use this if you used in parent-ExploreView

        //This is test Text. Delete later.
    }
}

#Preview {
    ListingItemView()
}
