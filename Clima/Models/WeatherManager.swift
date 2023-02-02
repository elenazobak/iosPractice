//
//  WeatherManagerr.swift
//  Clima
//
//  Created by Elena Zobak on 1/30/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation



protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailedWithError(error: Error)
}


struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        //1. create a url
        if let url = URL(string: urlString) {
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            //3. Give the session a task
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    delegate?.didFailedWithError(error: error!)
                    return
                }
                
                if let safeData = data { // if data is not nil, it goes to safeData
                    if let weather = self.parseJson(safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                   
                }
            }
            
            //4. Start the task
            task.resume()
        }
    }
    func parseJson(_ weatherData: Data) -> WeatherModel? { //parses the json file
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            return WeatherModel(conditionId: id, cityName: name, temperature: temp)
            
        } catch {
            delegate?.didFailedWithError(error: error)
            return nil
        }
        
    }
    
   
    
}


