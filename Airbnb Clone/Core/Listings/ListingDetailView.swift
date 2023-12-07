//
//  DetailView.swift
//  Airbnb Clone
//
//  Created by Biwash Chapai on 12/7/23.
//

import SwiftUI
import MapKit




struct ListingDetailView: View {
    var images = [
        "listing-1",
        "listing-2",
        "listing-3",
        "listing-4"
    ]

    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView{
            ZStack(alignment: .topLeading) {
                ListingImageCarouselView()      //First item on zstack is base view, everything else will be stacked on top of it, in 3D.
                    .frame(height: 320)
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background{
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(32)
                }
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Miami Villa")
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading) {
                    HStack(spacing: 2){
                        Image(systemName: "star.fill")
                        Text("4.86")
                        
                        Text(" - ")
                        
                        Text("30 Reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.black)
                    
                    Text("Miami, Florida")
                }
                .font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
            //Host Info
            HStack(){
                            VStack(alignment: .leading, spacing: 4){
                                Text("Entire Villa Hosted by Biwash Chapai")
                                    .font(.headline)
                                    .frame(width: 250, alignment: .leading )        //So the text doesn't bleeds to far and cuts off where you want.
                    
                    HStack(spacing: 2){
                        Text("4 guests - ")
                        Text("4 bedrooms - ")
                        Text("4 Beds - ")
                        Text("3 baths")
                    }
                    .font(.caption)
                }
                .frame(width: 300, alignment: .leading)
                Spacer()
                
                Image("mine")
                    .resizable()
                    .scaledToFill()
                    .frame(width:64, height: 64)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }
            .padding()
            
            Divider()
            
            //Listing Features
            VStack(alignment: .leading, spacing: 16){
                ForEach(0 ..< 2){ feature in
                    HStack(spacing: 12) {
                        Image(systemName: "medal")
                        
                        VStack(alignment: .leading){
                            Text("Superhost")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text("Superhost are experienced, highly rated hosts who are committed to providing great stars for guests.")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                    }
                    
                }
            }
            .padding()
            
            Divider()
            //Bedrooms View
            VStack(alignment: .leading, spacing: 16) {
                Text("Where You'll Sleep")
                    .font(.headline)
                ScrollView(.horizontal, showsIndicators: false){        // Indicator set to false so that its hidden and doesn't block the view.
                    HStack(spacing: 16){
                        ForEach(1 ..< 5) { bedroom in
                            VStack{
                                Image(systemName: "bed.double")
                                Text ("Bedroom \(bedroom)")         //Index of the loop
                            }
                            .frame(width: 132, height: 100)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.gray)
                            }
                        }
                        
                    }
                }
                .scrollTargetBehavior(.paging)
            }
            .padding()
            
            Divider()
            //Listing Amenities
            VStack(alignment: .leading, spacing: 16){
                Text("What this place Offers")
                    .font(.headline)
                
                ForEach(0 ..< 5) { feature in
                    HStack{
                        Image(systemName: "wifi")
                            .frame(width: 32)
                        
                        Text("Wifi")
                            .font(.footnote)
                        
                        Spacer()
                    }
                }
            }
            .padding()
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16){
                Text("Where you'll be")
                    .font(.headline)
                
                Map()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
        }
        .ignoresSafeArea()
        .padding(.bottom, 64)
        .overlay(alignment: .bottom){       //Either use z stack or use overlay on whole scrollview to get that reserve panel sticking out while scrolling.
            VStack{
               
                Divider()
                    .padding(.bottom)
                
                
                HStack{
                    VStack(alignment: .leading){
                        Text("$500")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text("Total before taxes")
                            .font(.footnote)
                        
                        Text("Oct 15-20")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Reserve")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.horizontal, 32)
            }
            .background(.white)
        }
    }
}

#Preview {
    ListingDetailView()
}
