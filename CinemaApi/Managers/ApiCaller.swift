//
//  ApiCaller.swift
//  CinemaApi
//
//  Created by Nurzhan Saktaganov on 28.07.2023.
//

import Foundation

struct Constants {
    static let API_KEY = "5e0f663250da68bcfbbfce622455e8ce"
    static let baseUrl = "https://api.themoviedb.org"
}

enum APIError: Error{
    case failedToGetData
}

class ApiCaller {
    static let shared = ApiCaller()
    
    // ?
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void){
        
        guard let url = URL(string: "\(Constants.baseUrl)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            guard let data = data, error == nil else {return}
            
            do {
                let results = try JSONDecoder().decode(TrendingResponse.self, from: data)
                completion(.success(results.results))

            }
            catch{
                completion(.failure(APIError.failedToGetData))
            }
            
        }
            task.resume()
    }
    
    
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void){
        
        guard let url = URL(string: "\(Constants.baseUrl)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, error == nil else {return}
            
            // ?
            do {
                let results = try JSONDecoder().decode(TrendingResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    
    func getUpcomings(completion: @escaping (Result<[Title], Error>) -> Void){
        
        guard let url = URL(string: "\(Constants.baseUrl)/3/movie/upcoming?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            guard let data = data, error == nil else {return}
            
            do {
                let results = try JSONDecoder().decode(TrendingResponse.self, from: data)
                completion(.success(results.results))

            }catch{
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
    }
    
    
    func getPopularity(completion: @escaping (Result<[Title], Error>) -> Void){
        
        guard let url = URL(string: "\(Constants.baseUrl)/3/movie/popular?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            guard let data = data, error == nil else {return}
            
            do {
                let results = try JSONDecoder().decode(TrendingResponse.self, from: data)
                completion(.success(results.results))

            }catch{
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
    }
    
    
    func getTopRated(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseUrl)/3/movie/top_rated?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            guard let data = data, error == nil else {return}
            
            do{
                let results = try JSONDecoder().decode(TrendingResponse.self, from: data)
                completion(.success(results.results))

            }catch{
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
}
