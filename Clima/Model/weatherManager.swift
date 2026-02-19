import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {

    private let baseURL = "https://api.openweathermap.org/data/2.5/weather"
    private let apiKey = "YOUR_API_KEY"

    var delegate: WeatherManagerDelegate?

    func fetchWeather(cityName: String) {
        let urlString = "\(baseURL)?appid=\(apiKey)&units=metric&q=\(cityName)"
        performRequest(with: urlString)
    }

    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(baseURL)?appid=\(apiKey)&units=metric&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }

    private func performRequest(with urlString: String) {
        guard let url = URL(string: urlString) else { return }

        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                self.delegate?.didFailWithError(error: error)
                return
            }

            guard let safeData = data else { return }

            if let weather = self.parseJSON(safeData) {
                self.delegate?.didUpdateWeather(self, weather: weather)
            }
        }
        task.resume()
    }

    private func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name

            return WeatherModel(conditionID: id, cityName: name, temperature: temp)
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}

