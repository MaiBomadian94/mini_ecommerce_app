# 🛍️ Mini E-Commerce App

A Flutter-based mini e-commerce application currently under development.  
This project is being built as part of a technical task to demonstrate clean architecture, responsive UI, and Flutter development best practices.


### 🏠 Home View
✅ **Implemented so far:**
*  custom elevated button
*  Location Bar
*  Banner Slider
*  Brand List View
*  Product Card

## 🧱 Project Structure

lib/
├── core/
│ ├── theming/ → colors, text styles, font weights
│ ├── helpers/ → spacing, extensions
│ ├── presentation/ → widgets , bloc
│ └── routing/ → App routes, route definitions
│
├── features/
│ └── home/
│ ├── data/
│ │ ├── models/ 
│ │ └── repository/ 
│ ├── domain/ 
│ └── presentation/
│ ├── bloc/ → HomeBloc, HomeStates, HomeEvents
│ ├── views/ → HomeView
│ └── widgets/ Home Widgets
│
└── main.dart → App entry point