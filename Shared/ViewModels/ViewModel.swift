//
//  ViewModel.swift
//  ios_firebase (iOS)
//
//  Created by Leng Sopharot on 2/12/21.
//

import Foundation
import Firebase

class ViewModel: ObservableObject {
    
    @Published var list  = [Todo]()
    
    
    func getData(){
        
        //Getting reference from database
        let db = Firestore.firestore()
        
        //Read a document from spcificed path
        db.collection("todos").getDocuments { snapshot, error in
            //checking error
            if error == nil{
                //No error
                
                if let snapshot = snapshot{
                    
                    //Update this list property in main thread
                    DispatchQueue.main.async {
                        //Getting document from todo collection
                        self.list = snapshot.documents.map { d in
                            return Todo(id: d.documentID, name: d["name"] as? String ?? "", note: d["note"] as? String ?? "")
                        }
                    }
                }
                
            }else{
                //Handle error
            }
        }
    }
    
    func addData(name:String, note:String){
        //Getting reference from databse
        let db = Firestore.firestore()
        
        //Add data to datbase
        db.collection("todos").addDocument(data: ["name":name, "notes":note]) { error in
            if error == nil {
                //No error
                self.getData()
            }
            else
            {
                //Handle the error
                
            }
        }
        
    }
    
    
    func deleteData(todoToDelete: Todo) {
        //Getting refernce from database
        let db = Firestore.firestore()
        
        //Spicified path to delete
        db.collection("todos").document(todoToDelete.id).delete { error in
            if error == nil {
                //No error
                DispatchQueue.main.async {
                    self.list.removeAll { todo in
                        return todo.id == todoToDelete.id
                    }
                }
            }
            else
            {
                //Hander error
            }
        }
        
        
    }
}
