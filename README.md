# Clima – iOS Weather App ☁️

Clima is a weather application built in Swift that allows users to retrieve real-time weather data by searching for a city or using their current location.

This project was originally developed as part of Angela Yu’s iOS Development course and was used to strengthen my understanding of networking, JSON parsing, and iOS app architecture. I further refined the structure and improved parts of the implementation to better understand data flow and separation of concerns.

## Features

- Real-time weather data via the OpenWeather REST API
- City-based search
- Location-based weather using CoreLocation
- JSON decoding with Codable
- Asynchronous networking using URLSession
- Clear separation between networking and UI logic

## Technologies

- Swift
- UIKit
- URLSession
- CoreLocation
- Codable
- MVC architecture

## Setup

1. Obtain an API key from https://openweathermap.org/
2. Replace `"YOUR_API_KEY"` in `WeatherManager.swift`
3. Build and run the app

## Key Learning Points

- Consuming RESTful APIs in iOS
- Handling asynchronous network requests
- Parsing and modeling JSON data
- Structuring iOS applications for clarity and maintainability
