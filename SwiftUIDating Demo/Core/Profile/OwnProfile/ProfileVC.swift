//
//  ProfileVC.swift
//  AmountDemo
//
//  Created by Rushabh Shah on 13/09/24.
//

import SwiftUI

struct ProfileVC: View {
    @State private var showEditProfile = false
    let user:  User
    
    var body: some View {
        NavigationStack {
            List {
                ProfileHeaderView(user: user)
                    .onTapGesture {
                        showEditProfile.toggle()
                    }
                
                Section("Account Info") {
                    HStack {
                        Text("Name:")
                        
                        Spacer()
                        
                        Text(user.fullName)
                    }
                    
                    HStack {
                        Text("Bio:")
                        
                        Spacer()
                        
                        Text(user.bio)
                    }
                }
                
                Section("Legal") {
                    HStack {
                        Text("Terms of Service")
                        
                        Spacer()
                        
                        Text(user.fullName)
                    }
                }
                
                Section("") {
                    HStack {
                        Button("Logout") {
                        }
                    }
                }
                .foregroundStyle(.red)
                
                Section("") {
                    HStack {
                        Button("Delete Account") {
                        }
                    }
                    
                }
                .foregroundStyle(.red)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .fullScreenCover(isPresented: $showEditProfile) {
                EditProfileView(user: user)
            }
        }
    }
}

#Preview {
    ProfileVC(user: MockData.users[1])
}
