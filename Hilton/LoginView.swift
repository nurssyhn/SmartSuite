import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var loginResult: String = ""
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
                    Group {
                    Text("SMARTSUITE")
                        .font(.largeTitle)
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                        .frame(width: 500, height: 57.0)
                        .background(Color(red: 0.042, green: 0.077, blue: 0.356))
                        .cornerRadius(10)
                        .padding(.top, 35.0)
                    
                  
                        Text("Join The SmartSuite Community.")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(Color(red: 0.042, green: 0.077, blue: 0.356))
                            .padding(.vertical, 50.0)
                        
                        Text("Login")
                            .font(.title)
                            .fontWeight(.medium)
                            .foregroundColor(Color(red: 0.042, green: 0.077, blue: 0.356))
                            .padding(.vertical, -20.0)
                    }
                    
                    Spacer()
                   
                    Group {
                        TextField("E-mail", text: $email)
                            .padding()
                            .underline()
                            .padding(.leading, 100.0)
                            .underline()
                            .frame(width: 300.0, height: 50.0)
                            .cornerRadius(10)
                            .padding(.horizontal)
                        
                        SecureField("Password", text: $password)
                            .padding(.leading, 110.0)
                            .underline()
                            .frame(width: 300.0, height: 50.0)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    
                    Spacer()
                    
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
                    }.padding(.top , -40)
                    
                    Group {
                        
                        Button(action: {
                            // Login button action
                            performLogin()
                        }) {
                            Text("Log in")
                                .font(.headline)
                                .foregroundColor(Color.white)
                                .frame(width: 330, height: 50)
                                .background(Color(red: 0.89, green: 0.246, blue: 0.038))
                                .cornerRadius(10)
                        }
                        .padding(.top, 30)
                        
                        Text(loginResult)
                            .padding(.top, 20)
                        
                        
                        Button(action: {
                            // Check-in button action
                            if isChecked {
                                isLoginViewActive = true
                            } else {
                                // Hata mesajı göster
                                print("Invalid Hotel Code or Agreement")
                            }
                        }) {
                            Text("Login with Google")
                                .font(.headline)
                                .foregroundColor(Color.white)
                                .frame(width: 300.0, height: 20.0)
                                .padding()
                                .background(Color(red: 0.872, green: 0.814, blue: 0.78))
                                .cornerRadius(10)
                        }
                        .padding(.top, -30.0)
                        .disabled(!isChecked)
                        
                        Button(action: {
                            // Check-in button action
                            if isChecked {
                                isLoginViewActive = true
                            } else {
                                // Hata mesajı göster
                                print("Invalid Hotel Code or Agreement")
                            }
                        }) {
                            Text("Login with Facebook")
                                .font(.headline)
                                .foregroundColor(Color.white)
                                .frame(width: 300.0, height: 20.0)
                                .padding()
                                .background(Color(red: 0.238, green: 0.351, blue: 0.598))
                                .cornerRadius(10)
                        }
                        .padding(.top, 5.0)
                        .disabled(!isChecked)
                    }
                    
                    Spacer()
                    
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
        .sheet(isPresented: $isLoginViewActive, content: {
            Text("Logged In!")
        })
    }
    
    func performLogin() {
        let url = URL(string: "http://113.30.190.74:81/api/customers/customerLogin")!
        
        // Prepare request body
        let requestBody: [String: Any] = [
            "pword": "abc",
            "telephone": "",
            "email": "mail@gmail.com"
        ]
        
        // Prepare request headers
        let headers: [String: String] = [
            "token": "default",
            "Content-Type": "application/json",
            "X-ApiKey": "25939a66c56290a9c25a4f0da94c875a9b888e2b54e1910085ccf0b49292f416"
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: requestBody)
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let responseString = String(data: data, encoding: .utf8) {
                DispatchQueue.main.async {
                    loginResult = responseString
                }
            }
        }
        .resume()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
