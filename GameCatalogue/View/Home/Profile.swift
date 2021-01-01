//
//  Profile.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 19/12/20.
//

import SwiftUI

struct Profile: View {
    
    @StateObject var profileVM = ProfileViewModel()
    
    var body: some View {
        VStack(alignment: .center) {
            Image("profile")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 184, height: 184, alignment: .center)
                .clipShape(Circle())
                .shadow(radius: 10)
            
            VStack(alignment: .center) {
                if profileVM.name == "" || profileVM.email == "" {
                    Text("Uwais Alqadri")
                        .bold()
                        .font(.title)
                    
                    Text("uwaisalqadri654321@gmail.com")
                        .font(.footnote)
                } else {
                    Text(profileVM.name)
                        .bold()
                        .font(.title)
                    
                    Text(profileVM.email)
                        .font(.footnote)
                }
                
                Button(action: {
                    profileVM.isEdit.toggle()
                }, label: {
                    Text("Edit")
                        .font(.footnote)
                        .foregroundColor(.blue)
                        .padding(.horizontal)
                        .padding(.vertical)
                }).sheet(isPresented: $profileVM.isEdit, content: {
                    EditProfile(profileVM: profileVM)
                })
            }.onAppear {
                guard let getName = UserDefaults.standard.value(forKey: "Name") else { return }
                self.profileVM.name = getName as! String
                guard let getEmail = UserDefaults.standard.value(forKey: "Email") else { return }
                self.profileVM.email = getEmail as! String
            }
        }
    }
}

struct EditProfile: View {
    
    @ObservedObject var profileVM: ProfileViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter your name", text: $profileVM.name)
                        .disableAutocorrection(true)
                        .frame(height: 5)
                        .padding(.leading, 24)
                    
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                .overlay(
                    HStack {
                        Image(systemName: "person.fill")
                        Spacer()
                        
                    }.padding(.horizontal, 32)
                    .foregroundColor(.gray)
                )
                
                HStack {
                    TextField("Enter your email", text: $profileVM.email)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .frame(height: 5)
                        .padding(.leading, 24)
                    
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                .overlay(
                    HStack {
                        Image(systemName: "envelope.fill")
                        Spacer()
                        
                    }.padding(.horizontal, 32)
                    .foregroundColor(.gray)
                )
                
                Button(action: {
                    UserDefaults.standard.set(self.profileVM.name, forKey: "Name")
                    UserDefaults.standard.set(self.profileVM.email, forKey: "Email")
                    profileVM.isEdit.toggle()
                }, label: {
                    Text("Save")
                })
                .padding()
                
                Spacer()
            }
            
            .navigationTitle("Edit Profile")
            .navigationBarItems(
                leading: HStack {
                    Image(systemName: "chevron.left")
                    Text("Back")
                }
                .foregroundColor(.blue)
                .onTapGesture {
                    profileVM.isEdit.toggle()
                }
            )
        }
        
        
    }
}

class ProfileViewModel: ObservableObject {
    @Published var name = ""
    @Published var email: String = ""
    
    @Published var isEdit = false
}

