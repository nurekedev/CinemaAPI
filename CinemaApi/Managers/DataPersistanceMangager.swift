//
//  DataPersistanceMangager.swift
//  CinemaApi
//
//  Created by Nurzhan Saktaganov on 02.08.2023.
//

import Foundation
import UIKit
import CoreData

class DataPersistanceMangager {
    
    
//    private var titles: [TitleItem] = [TitleItem]()
    
    enum DatabaseError: Error {
        case failedToSaveData
        case failedToReadData
        case failedToDeleteData
    }
    
    static let shared = DataPersistanceMangager()
    
    func downloadTitleWith(model: Title, completion: @escaping (Result<Void, Error>) -> Void){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let item = TitleItem(context: context)
        
        item.original_title = model.original_title
        item.original_language = model.original_language
        item.overview = model.overview
        item.id = Int64(model.id)
        item.poster_path = model.poster_path
        item.vote_average = model.vote_average ?? 0.0
        item.media_type = model.media_type
        item.vote_count = Int64(model.vote_count)
        
        do{
            try context.save()
            completion(.success(()))
        }
        catch{
            print(error.localizedDescription)
            completion(.failure(DatabaseError.failedToSaveData))
        }
    }
    
    func fetcingDataFromDataBase(completion: @escaping (Result<[TitleItem], Error>)->Void){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request: NSFetchRequest<TitleItem>
        request = TitleItem.fetchRequest()
        
        do{
            let titles = try context.fetch(request)
            completion(.success(titles))
        }catch{
            print(DatabaseError.failedToReadData)
        }
        
    }
    
    func deleteDataFromDataBase(model: TitleItem, completion: @escaping (Result<Void, Error>)->Void){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        context.delete(model)
        
        do{
            try context.save()
            completion(.success(()))
        }catch{
            print(DatabaseError.failedToDeleteData)
        }
    }
}
