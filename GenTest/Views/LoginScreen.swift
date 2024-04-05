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
    @FocusState private var isEmailFocused: Bool
    @FocusState private var isPassFocused: Bool
    
    let logo = URL(string: "https://i.imgur.com/t8VrqzM.png")

    let mainBG = #colorLiteral(red: 0.9914150834, green: 0.9771276116, blue: 0.9294666648, alpha: 1)
    let bColor = #colorLiteral(red: 0.9246651786, green: 0.8929483754, blue: 0.8376240318, alpha: 1)
    var body: some View {
        
        ZStack{
            Color(mainBG).ignoresSafeArea(.all)
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
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.white)
                        
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(isEmailFocused ? Color.orange : Color.black, lineWidth: 0.5)
                            )
                    )
                    .focused($isEmailFocused)
                    .padding(.horizontal,25)
                    .padding(.bottom,20)
                SecureField("Password", text: $password)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.white)
                        
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(isPassFocused ? Color.orange : Color.black, lineWidth: 0.5)
                            )
                    )
                    .focused($isPassFocused)
                    .padding(.horizontal,25)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Spacer()
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
            
            .frame(maxWidth: 400, maxHeight: 700)
            .navigationBarBackButtonHidden(true)
            .frame(maxWidth: 400)
            .background(Color(bColor))
            .cornerRadius(10)
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
