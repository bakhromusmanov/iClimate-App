//
//  WeatherManager.swift
//  iClimate
//
//  Created by Bakhrom Usmanov on 26/07/24.
//

import Foundation

struct WeatherManager{
    
    var weatherUrl: String = "https://api.openweathermap.org/data/2.5/weather?q=Tashkent&appid=5384cebdd68c3489a198752502d3f5e7&units=metric"
    
    func fetchWeather(cityName: String){
        let urlString = weatherUrl + "&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        //Create URL
        if let url = URL(string: urlString){
            //Create URL session
            let session = URLSession(configuration: .default)
            //Give session a task
            let task = session.dataTask(with: url, completionHandler: handler)
            //Start task
            task.resume()
        }
    }
    
    func handler(data: Data?, response: URLResponse?, error: Error?){
        if error != nil{
            return
        }
        
        if let safeData = data{
            if let stringData = String(data: safeData, encoding: .utf8){
                print(stringData)
            }
        }
    }   
}
