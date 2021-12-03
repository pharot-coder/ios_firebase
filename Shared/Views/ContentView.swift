//
//  ContentView.swift
//  Shared
//
//  Created by Leng Sopharot on 1/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = ViewModel()
    @State var name:String = ""
    @State var note:String = ""
    var body: some View {
        VStack{
            List (model.list) {item in
                HStack{
                    Text(item.name)
                    Spacer()
                    Button(action: {
                        model.deleteData(todoToDelete: item)
                    }, label: {
                        Image(systemName: "trash")
                    })
                }
            }
            TextField("name",text:$name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(height:50)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 0, y: 10)
            
            TextField("note",text:$note)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(height:50)
                .shadow( radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 0, y: 10)
            
            Button(action: {
                model.addData(name: name, note: note)
                
                //Set Name Field and Note Field empty when add success
                name = ""
                note = ""
            }, label: {
                Text("Save")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width:300, height: 60)
                    .background(Color.green)
                    .cornerRadius(10)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 0, y: 10)
            })
        }.padding()
        .background(Color.orange)
        .ignoresSafeArea()
    }
    init(){
        model.getData()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
