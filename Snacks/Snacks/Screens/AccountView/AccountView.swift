//
//  AccountView.swift
//  Snacks
//
//  Created by Yavuz Güner on 24.12.2022.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    
    @FocusState private var focusedTextfield : FormTextField?
    
    enum FormTextField{
        case firstName,lastName,email
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Personal Info")){
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusedTextfield, equals: .firstName)
                        .onSubmit {
                            focusedTextfield = .lastName //bir sonraki satıra atlarız.
                        }
                        .submitLabel(.next)
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusedTextfield, equals: .lastName)
                        .onSubmit {
                            focusedTextfield = .email
                        }
                        .submitLabel(.next)
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusedTextfield, equals: .email)
                        .onSubmit {
                            focusedTextfield = nil
                        }
                        .submitLabel(.continue)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                    DatePicker("Birthday", selection: $viewModel.user.birthdate, displayedComponents: .date)
                    Button{
                        viewModel.saveChanges()
                        print("Kayıt işlemi gerçekleşti.")
                    }label: {
                        Text("Save Changes")
                    } 
                }
                Section(header: Text("Requests")){
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
            }
                .navigationTitle("👨🏼‍🎨 Account")
                .toolbar{
                    ToolbarItemGroup(placement: .keyboard) {
                        Button("Dismiss") { focusedTextfield = nil }
                    }
                }
        }
        .onAppear{
            viewModel.retrieveUser()//uygulama açılınca verilerin gelmesini sağlarız.
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
