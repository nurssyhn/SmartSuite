//
//  ContentView.swift
//  Hilton
//
//  Created by Nur Sultan Şeyhanlıoğlu on 30.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var isCheckInPageActive = false
    @State private var isLoginPageActive = false
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                Image("group_252")
                    .resizable()
                    .padding([.leading, .bottom, .trailing], 10.0)
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                
                
                
                VStack{
                    
                    Text("SMARTSUITE")
                        .font(.largeTitle)
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                        .frame(width: 500, height: 57.0)
                        .background(Color(red: 0.042, green: 0.077, blue: 0.356))
                        .cornerRadius(10)
                        .padding(.top, 35.0)
                    
                    Group{
                    
                    Text("Join The SmartSuite Community.")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(Color(red: 0.042, green: 0.077, blue: 0.356))
                        .padding(.top, 50.0)
                    
                    
                    
                    Text("ENTER")
                        .font(.title)
                        .fontWeight(.medium)
                        .foregroundColor(Color(red: 0.042, green: 0.077, blue: 0.356))
                        .padding(.vertical, 50.0)
                    
                }
                    
                    HStack {
                        Spacer()
                        TextField("aj6k3g85", text: $username)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 40.0)
                            .underline()
                        Spacer()
                    }
                    
                    Group{
                        
                        HStack{
                            
                            Spacer()
                            
                            Toggle(isOn: /*@PLACEHOLDER=Is On@*/.constant(true)) {
                                
                            }
                            .padding(.trailing, 340.0)
                            
                            
                            
                            Text("I agree terms and conditions.")
                                .multilineTextAlignment(.leading)
                                .padding(.leading, -330.0)
                            
                            Spacer()
                            Spacer()
                        }
                    }
                    
                    Group{
                    
                        Button(action: {
                        // Check-in button action
                        isCheckInPageActive = true
                    }) {
                        Text("Check-in")
                            .font(.headline)
                            .foregroundColor(Color.white)
                            .frame(width: 300.0, height: 20.0)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    .padding(.top, 5.0)
                    .frame(width: 80.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0)
                    
                    Button(action: {
                        // Login button action
                        isLoginPageActive = true
                    }) {
                        Text("Login")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 300.0, height: 20.0)
                            .padding()
                            .background(Color(red: 0.872, green: 0.814, blue: 0.78))
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 10.0)
                    Spacer()
                }

                    HStack{
                        
                        Text("Don't have an account?")
                        
                        Button("Sign Up") {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }.foregroundColor(Color.black)
                            .fontWeight(.bold)
                    }
                    
                    Spacer()
                    
                    Group{
                        HStack{
                            
                            Image("face_logo").frame(width: 50.0, height: 50.0)
                            Image("gmail_logo").frame(width: 50.0, height: 50.0)
                            Image("instagram_logo").frame(width: 50.0, height: 50.0)
                            
                            
                        }
                        
                        HStack {
                            Button(action: {}) {
                                Text("ABOUT |")
                            }
                            Button(action: {}) {
                                Text("CONTACT")
                            }
                            .fontWeight(.light)
                        }
                        Spacer()
                    }

                   
 Spacer()
                   
                }
                
                .navigationBarHidden(true)
                .sheet(isPresented: $isLoginPageActive) {
                    LoginPage()
                }
                .navigationBarHidden(true)
                .sheet(isPresented: $isCheckInPageActive) {
                    CheckInPage()
                }
                
                
            }
        }
    }
    
    struct CheckInPage: View {
        var body: some View {
            VStack {
                Text("Check-in Page")
                    .font(.title)
                    .padding()
            }
        }
  }
    
    struct LoginPage: View {
        var body: some View {
            VStack {
                Text("Login Page")
                    .font(.title)
                    .padding()
            }
        }
  }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
