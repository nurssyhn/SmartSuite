//
//  ContentView.swift
//  Hilton
//
//  Created by Nur Sultan Şeyhanlıoğlu on 30.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var isHotelCodeViewActive = false
    @State private var isChecked: Bool = false
    @State private var showErrorAlert = false

    
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
                    
                    //Terms and Conditions
                    
                    Button(action: {
                                    isChecked.toggle()
                                }) {
                                    HStack {
                                        if isChecked {
                                            Image(systemName: "checkmark.square.fill")
                                                .foregroundColor(.green)
                                        } else {
                                            Image(systemName: "square")
                                                .foregroundColor(.gray)
                                        }
                                        Text("I agree with terms of services.")
                                    }
                                }
                    
                  
                    Group {
                        Button(action: {
                            // Check-in button action
                            if isChecked {
                                isHotelCodeViewActive = true
                            } else {
                                // Hata mesajı göster
                                showErrorAlert = true
                            }
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
                        .frame(width: 80.0, height: 100.0)
                        .disabled(!isChecked) // isChecked değerine göre butonun etkinlik durumunu ayarla
                        
                        Button(action: {
                            // Login button action
                            if isChecked {
                                isHotelCodeViewActive = true
                            } else {
                                // Hata mesajı göster
                                showErrorAlert = true
                            }
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
                        .disabled(!isChecked) // isChecked değerine göre butonun etkinlik durumunu ayarla
                        
                        Spacer()
                    }
                    .alert(isPresented: $showErrorAlert) {
                        Alert(
                            title: Text("Hata"),
                            message: Text("Please agree to the terms"),
                            dismissButton: .default(Text("Tamam"))
                        )
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
                                Text("ABOUT  |")
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
                .sheet(isPresented: $isHotelCodeViewActive) {
                    HotelCodeView()
                }
                
                
            }
        }
    }

    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
