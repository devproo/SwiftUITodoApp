//
//  ToDoListItemViewViewModel.swift
//  SwiftUITodoApp
//
//  Created by ipeerless on 27/08/2023.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoListItemViewViewModel: ObservableObject {
    
    init(){}
    func toggleIsDone(item: ToDoListItem)   {
        var itemCopy  = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore().collection("users").document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
    
}
