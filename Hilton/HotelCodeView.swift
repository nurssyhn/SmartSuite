//
//  HotelCodeView.swift
//  Hilton
//
//  Created by Nur Sultan Şeyhanlıoğlu on 1.07.2023.
//

import SwiftUI

struct HotelCodeView: View {
    @State private var HotelCode: String = ""
    @State private var isShowingLoginView = false
    @State private var isChecked: Bool = false
    @State private var isLoginViewActive = false

    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                
                Image("group_252")
                    .resizable()
                    .padding([.leading, .bottom, .trailing], 10.0)
                    
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                
                VStack {
                    
                    Text("SMARTSUITE")
                        .font(.largeTitle)
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                        .frame(width: 500, height: 57.0)
                        .background(Color(red: 0.042, green: 0.077, blue: 0.356))
                        .cornerRadius(10)
                        .padding(.top, 35.0)
                    
                    Group {
                        Text("Join The SmartSuite Community.")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(Color(red: 0.042, green: 0.077, blue: 0.356))
                            .padding(.vertical, 50.0)
                        
                        Text("ENTER")
                            .font(.title)
                            .fontWeight(.medium)
                            .foregroundColor(Color(red: 0.042, green: 0.077, blue: 0.356))
                            .padding(.vertical, 30.0)
                        
                        Text("Hello Mrs. Cakmak")
                            .font(.title2)
                            .fontWeight(.regular)
                            .foregroundColor(Color(red: 0.305, green: 0.692, blue: 0.635))
                            .lineLimit(20)
                            .padding(.top, -20.0)
                    }
                    
                    
                        Spacer()
                    
                    TextField("Hotel Code", text: $HotelCode)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 40.0)
                        .underline()

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
                            if HotelCode == "Abc124" && isChecked {
                                isLoginViewActive = true
                            } else {
                                // Hata mesajı göster
                                print("Invalid Hotel Code or Agreement")
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
                        .disabled(!(HotelCode == "Abc124" && isChecked))
                        .sheet(isPresented: $isLoginViewActive) {
                            LoginView()
                        }
                    }

                    
                    Spacer()
                    
                    Group {
                        HStack {
                            Image("face_logo")
                                .frame(width: 50.0, height: 50.0)
                            Image("gmail_logo")
                                .frame(width: 50.0, height: 50.0)
                            Image("instagram_logo")
                                .frame(width: 50.0, height: 50.0)
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
                }
            }
        }
    }
}

struct HotelCodeView_Previews: PreviewProvider {
    static var previews: some View {
        HotelCodeView()
    }
}

