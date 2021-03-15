//
//  Profile.swift
//  GameCatalogue
//
//  Created by Uwais Alqadri on 19/12/20.
//

import SwiftUI

struct Profile: View {
    
    @StateObject var presenter = ProfilePresenter()
    
    var body: some View {
        VStack(alignment: .center) {
            Image("profile")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 184, height: 184, alignment: .center)
                .clipShape(Circle())
                .shadow(radius: 10)
            
            VStack(alignment: .center) {
                if presenter.name == "" || presenter.email == "" {
                    Text("Uwais Alqadri")
                        .bold()
                        .font(.title)
                    
                    Text("uwaisalqadri654321@gmail.com")
                        .font(.footnote)
                } else {
                    Text(presenter.name)
                        .bold()
                        .font(.title)
                    
                    Text(presenter.email)
                        .font(.footnote)
                }
                
                Button(action: {
                    presenter.isEdit.toggle()
                }, label: {
                    Text("Edit")
                        .font(.footnote)
                        .foregroundColor(.blue)
                        .padding(.horizontal)
                        .padding(.vertical)
                }).sheet(isPresented: $presenter.isEdit, content: {
                    EditProfile(presenter: presenter)
                })
            }.onAppear {
                guard let getName = UserDefaults.standard.value(forKey: "Name") as? String else { return }
                self.presenter.name = getName
                guard let getEmail = UserDefaults.standard.value(forKey: "Email") as? String else { return }
                self.presenter.email = getEmail
            }
        }
    }
}

struct EditProfile: View {
    
    @ObservedObject var presenter: ProfilePresenter
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter your name", text: $presenter.name)
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
                    TextField("Enter your email", text: $presenter.email)
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
                    UserDefaults.standard.set(self.presenter.name, forKey: "Name")
                    UserDefaults.standard.set(self.presenter.email, forKey: "Email")
                    presenter.isEdit.toggle()
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
                    presenter.isEdit.toggle()
                }
            )
        }
    }
}

