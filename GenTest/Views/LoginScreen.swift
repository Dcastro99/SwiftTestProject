//
//  LoginScreen.swift
//  GenTest
//
//  Created by Danny Castro on 3/5/24.
//

import SwiftUI

struct LoginScreen: View {
    @State private var email = ""
    @State private var password = ""
    @State private var responseMessage: LoginUserModel?
    @State private var showAlert: Bool = false
    @State var alertTitle: String = ""
    @State var alertMessage: String = ""
    @AppStorage("token") var userToken: String?
    @AppStorage("Signed_in") var currentUserSignedIn: Bool = false
    @AppStorage("first_login") var firstLogin: Bool = false
    @EnvironmentObject var storeUser: UserObs
    @EnvironmentObject var storedTickets: BranchTickets
    
    let logo = URL(string: "https://i.imgur.com/t8VrqzM.png")
    var color = #colorLiteral(red: 0.5824416273, green: 0.5284253972, blue: 0.4144981807, alpha: 0.3209592301)
    let bgColor = #colorLiteral(red: 0.8131273912, green: 0.7377171282, blue: 0.578667129, alpha: 0.3209592301)
    var body: some View {
        
        ZStack{
            Color(bgColor).ignoresSafeArea(.all)
            VStack {
                Spacer()
                Rectangle()
                    .fill(Color.clear)
                    .frame(width: 180, height: 180)
                    .overlay(
                        AsyncImage(url: logo) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerRadius: 20.0))
                        } placeholder: {
                            ProgressView()
                        }
                    )
                    .shadow(color: .gray, radius: 10, x: 0, y: 10)
                
                Spacer()
                TextField("Email", text: $email)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                SecureField("Password", text: $password)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Spacer()
                Button(action: {
                    Task {
                        do {
                            let responseMessage = try await LoginAPI(email: email, password: password)
                          
                            storeUser.setUser(data:
                                                ["user_id": responseMessage.user.user_id,
                                                 "name": responseMessage.user.name,
                                                 "empNum": responseMessage.user.empNum,
                                                 "new_emp": responseMessage.user.new_emp,
                                                 "email": responseMessage.user.email,
                                                 "image": responseMessage.user.image,
                                                 "role": responseMessage.user.role,
                                                 "branch_ids": responseMessage.user.branch_ids,
                                                 "branchId": responseMessage.user.branch_ids[0]
                                                ])
                            //
                            userToken = responseMessage.token
                            currentUserSignedIn = true
                            firstLogin = true
                            $email.wrappedValue = ""
                            $password.wrappedValue = ""
                            
                            _ = try await GetBranchTickets(token: userToken, id: storeUser.user?.branchId ?? 99, storedTickets: storedTickets)
                            
                            
                        }
                        catch Login3Error.customError(let message){
                          
                            alertTitle = "Error"
                            alertMessage = message
                            showAlert.toggle()
                            
                        }
                        catch Login3Error.invalidToken {
                            print("invalidToken")
                        }
                        catch Login3Error.invalidData{
                            print("invalidData")
                        }catch Login3Error.invalidURL{
                            print("invalidURL")
                        }catch Login3Error.invalidJSON {
                            print("invalidJSON")
                        }catch Login3Error.invalidResponse {
                            print("invalidResponse")
                        }
                        
                    }
                    
                    //                        print("Signed in stats:: Clicked!!")
                }, label: {
                    Text("Sign in")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .frame(width: min(300, 350), height: 70)
                        .background(Color.black)
                        .cornerRadius(10)
                })
                .padding(.bottom, 40)
              
                
            }
            
            .frame(maxWidth: 400, maxHeight: 600)
            .navigationBarBackButtonHidden(true)
            .frame(maxWidth: 400)
            .background(Color(color))
            .cornerRadius(20)
            .padding()
            
        }
        .alert(isPresented: $showAlert) {
            getAlert()
        }
        
    }
    
    func getAlert() -> Alert{
        return Alert(
            title: Text(alertTitle),
            message: Text(alertMessage),
            dismissButton: .default(Text("OK"))
        )
    }
    
}

#Preview {
    LoginScreen()
}
