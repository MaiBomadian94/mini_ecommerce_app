# 🛍️ Mini E-Commerce App

A Flutter-based mini e-commerce application currently under development.  
This project is being built as part of a technical task to demonstrate clean architecture, responsive UI, and Flutter development best practices.

## Setup Instructions

1️⃣ Create new project folder:  mkdir flutter_task

2️⃣ Navigate to the project folder: cd flutter_task

3️⃣ Clone the repository: git clone https://github.com/MaiBomadian94/mini_ecommerce_app.git

4️⃣ Install dependencies: flutter pub get

5️⃣ Run the app: flutter run


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

### 🏠 Home View
✅ **Implemented so far:**
*  custom elevated button
*  Location Bar
*  Banner Slider
*  Brand List View
*  Product Card


## ✅ Recent Updates
- Added **Product Model**
- Added **API Constants** file
- Implemented **API Service**
- Added **Failure Handling** file


## 🏠 Home View with screenshots
- Created **Custom Shimmer Widget**
- Added **Cached Network Image**
  <img width="1080" height="2400" alt="Image" src="https://github.com/user-attachments/assets/8fdb16f5-3d06-4a8a-b080-93e3921e66e3" />
  <img width="1080" height="2400" alt="Image" src="https://github.com/user-attachments/assets/c31e9220-c15a-4b11-921b-e3cc8c9b5ac9" />

## State Management => Bloc
- Used Flutter Bloc to separate business logic from UI.
- Easy to handle loading, success, and failure states.

## Api Endpoint
- GET https://fakestoreapi.com/products
- GET https://fakestoreapi.com/products/categories



###  🛒 Cart View

*  created cart app bar
*  added custom_item_cart
*  added custom_master_card
*  added counter_widget
*  created cart view bloc
*  cart view done ✅

###  🛒 Cart View with screenshots
<img width="1080" height="2400" alt="Image" src="https://github.com/user-attachments/assets/545cc7bb-5477-4340-a0d8-fe47dbc8acaf" />

### 🏆 Bonus Feature – Product Details Page

🔍 Feature Description

* When the user taps on a product in the Home Page, they are navigated to a dedicated Product Details Screen that displays:
* Product image
* Title and description
* Price and rating

<img width="1080" height="2400" alt="Image" src="https://github.com/user-attachments/assets/bc05b744-5dad-41fc-b811-7e9f745a95be" />




