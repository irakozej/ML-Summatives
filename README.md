# Internet Speed Prediction Project

## **Overview**
This project predicts internet speed based on the number of connected devices using a machine learning model. The application consists of a **publicly available API** and a **Flutter mobile app** that interacts with the API for real-time predictions.

---

## **Public API Endpoint**
The API is publicly accessible and returns predictions based on the provided input values. It is tested and validated using **Swagger UI**.

### **API Endpoint:**
```
https://bd30-34-75-121-70.ngrok-free.app/predict
```

### **How to Use the API**
Send a **POST request** with the necessary input values in JSON format. Example:
```json
{
  "num_devices": 5
}
```

### **Example Response:**
```json
{
  "predicted_speed": 12.5
}
```

---

## **Demo Video**
📽️ Watch the demo video (max 2 minutes) showcasing the working app:

---

## **Running the Mobile App**
To run the Flutter mobile app that consumes the API, follow these steps:

### **Prerequisites**
- Install **Flutter** ([Installation Guide](https://docs.flutter.dev/get-started/install))
- Install **Dart SDK**
- Have a device/emulator set up

### **Installation & Running the App**
1. Clone this repository:
   ```sh
   git clone https://github.com/irakozej/ML-Summatives.git
   cd ML-Summatives
   ```
2. Install dependencies:
   ```sh
   flutter pub get
   ```
3. Run the app on an emulator or a physical device:
   ```sh
   flutter run
   ```

### **Features of the App**
✅ User-friendly UI with professional styling
✅ Takes input for the number of connected devices
✅ Fetches real-time predictions from the API
✅ Displays the predicted internet speed
✅ Proper error handling for invalid inputs

---

## **Troubleshooting**
- Ensure the API is reachable by testing it in **Postman** or **Swagger UI**.
- If API requests fail, check internet connectivity or API endpoint validity.
- If UI elements appear disorganized, restart the app and clear cache:
  ```sh
  flutter clean
  flutter pub get
  ```

---

## **Contributors**
👤 **Jean-Paul IRAKOZE** – *Developer*

---


