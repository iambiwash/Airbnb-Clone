//
//  ExploreView.swift
//  Airbnb Clone
//
//  Created by Biwash Chapai on 12/6/23.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack{            //Helps to navigate from main page to other
            ScrollView{             //Helps scroll the content up and dowm
                SearchAndFilter()
                LazyVStack(spacing: 32) {         //Helps render listing as they appear, few per page not everything.
                    ForEach(0 ... 10 , id: \.self) { listing in
                        NavigationLink(value: listing) {            //This makes the whole item clickable and go to next page/tab.
                            ListingItemView()
                                    .frame(height: 400)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
                .padding()      //this can be used either in parent View or child View. We're using it in parent view
            }
            .navigationDestination(for: Int.self) { listing in          //This provides destination page where to direct navigation link.
                ListingDetailView()
                    .navigationBarBackButtonHidden()
                }
        }
    }
}

#Preview {
    ExploreView()
}
