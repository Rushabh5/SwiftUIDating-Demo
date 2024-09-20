//
//  EditProfileView.swift
//  AmountDemo
//
//  Created by Rushabh Shah on 13/09/24.
//

import SwiftUI

struct EditProfileView: View {
    let user: User
    @Environment(\.dismiss) var dissmiss
    
    @State private var bio = ""
    @State private var occupation = "iOS Developer"
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Section {
                    ProfileImageGridView(user: user)
                        .padding()
                    
                    VStack(spacing: 24) {
                        VStack(alignment: .leading) {
                            Text("About Me")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .padding(.leading)
                            
                            TextField("Add your bio", text: $bio, axis: .vertical)
                                .padding()
                                .frame(height: 75, alignment: .top)
                                .background(Color(.secondarySystemBackground))
                                .font(.subheadline)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("OCCUPATION")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .padding(.leading)
                            
                            
                            HStack {
                                Image(systemName: "book")
                                Text("Occupation")
                                
                                Spacer()
                                
                                Text(occupation)
                                    .font(.footnote)
                            }
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .font(.subheadline)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("GENDER")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .padding(.leading)
                            
                            
                            HStack {
                                Text("Man")
                                    .font(.footnote)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .imageScale(.small)
                            }
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .font(.subheadline)
                        }
                        
                        
                        VStack(alignment: .leading) {
                            Text("SEXUAL ORIENTATION")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .padding(.leading)
                            
                            
                            HStack {
                                Text("Straight")
                                    .font(.footnote)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .imageScale(.small)
                            }
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .font(.subheadline)
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dissmiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        dissmiss()
                        //Save API
                    }
                    .fontWeight(.semibold)
                }
            }
        }
        .tint(.primary)
    }
}

#Preview {
    EditProfileView(user: MockData.users[0])
}
