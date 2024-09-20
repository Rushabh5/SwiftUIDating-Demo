//
//  UserProfileView.swift
//  AmountDemo
//
//  Created by Rushabh Shah on 12/09/24.
//

import SwiftUI

struct UserProfileView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var currentImageIndex = 0
    let user: User
    
    var body: some View {
        VStack {
            HStack {
                Text(user.fullName)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("User Age: \(user.age)")
                    .font(.title2)
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Image("arrow-down")
                        .background() {
                            Circle()
                                .fill(.red)
                                .frame(width: 34, height: 34)
                                .shadow(radius: 6)
                        }
                }
            }
            .padding(.horizontal)
            ScrollView {
                VStack(spacing: 20) {
                    ZStack(alignment: .top) {
                        Image(user.profileImage[currentImageIndex])
                            .resizable()
                            .scaledToFill()
                            .frame(width: SizeConstats.cardWidth, height: SizeConstats.cardHeight)
                            .overlay {
                                ImageScrollingOverlay(currentImageIndex: $currentImageIndex, imageCount: user.profileImage.count)
                            }
                        CardImageIndicatorView(currentImageIndex: currentImageIndex, imageCount: user.profileImage.count)

                    }
                }
                VStack(alignment: .leading, spacing: 12) {
                    Text("About Me")
                        .fontWeight(.semibold)
//                    if let bioData = user.bio {
                        Text(user.bio)
//                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color(.secondarySystemBackground))
                .font(.subheadline)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Essentials")
                        .fontWeight(.semibold)
                    HStack {
                        Image(systemName: "person")
                        
                        Text("Men")
                        
                        Spacer()
                    }
                    .font(.subheadline)
                    
                    HStack {
                        Image(systemName: "arrow.down.forward.and.arrow.up.backward.circle")
                        
                        Text("Stright")
                        
                        Spacer()
                    }
                    .font(.subheadline)
                    
                    HStack {
                        Image(systemName: "book")
                        
                        Text("Actor")
                        
                        Spacer()
                    }
                    .font(.subheadline)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color(.secondarySystemBackground))
                .font(.subheadline)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Looking For")
                        .fontWeight(.semibold)
                    HStack {
                        Text("Handsome")
                        
                        Spacer()
                    }
                    .font(.subheadline)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color(.secondarySystemBackground))
                .font(.subheadline)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                VStack(alignment: .leading, spacing: 12) {
                    Button {
                        print("Match Button")
                    } label: {
                        Text("Match")
                            .foregroundStyle(.black)
                            .font(.headline)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
                .background(Color(.secondarySystemBackground))
                .font(.subheadline)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                VStack(alignment: .leading, spacing: 12) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundStyle(.black)
                            .font(.headline)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
                .background(Color(.secondarySystemBackground))
                .font(.subheadline)
                .clipShape(RoundedRectangle(cornerRadius: 10))

            }
        }
    }
}

#Preview {
    UserProfileView(user: MockData.users[0])
}
