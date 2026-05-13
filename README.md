
# 🚦 Smart Traffic Management System

An advanced AI-powered traffic monitoring and management system using YOLOv8, Flask, and real-time computer vision analytics. This system is designed for "Smart City" infrastructures to optimize traffic flow and detect road incidents.

## ✨ Key Features

- **Real-time Vehicle Detection**: Tracks cars, trucks, buses, and motorcycles with unique ID assignment.
- **Speed Estimation**: Dynamically calculates vehicle speed using pixel-to-meter mapping.
- **Accident & Incident Detection**:
  - **Sudden Stop**: Detects vehicles that stop abruptly from high speeds.
  - **Collision Detection**: Identifies potential vehicle collisions in real-time.
- **Smart Traffic Logic**: Automatically adjusts traffic signal modes based on real-time traffic density.
- **Comprehensive Analytics Dashboard**:
  - Live CCTV streaming with AI overlays.
  - Historical traffic trends (Volume vs. Speed).
  - Detailed incident logs with database persistence.
- **Voice Alerts**: Browser-based voice notifications for critical incidents.
- **Multi-Source Support**: Toggle between local video files and live webcam streams.

## 📁 Project Structure

```text
├── assets/             # Media files (videos, snapshots)
├── data/               # SQLite database (traffic_stats.db)
├── models/             # Pre-trained AI models (yolov8n.pt)
├── static/             # Frontend assets (CSS, JS, Images)
├── templates/          # HTML templates (Flask)
├── utils/              # Shared AI & Logic utilities
├── app.py              # Main Flask Web Application
├── main.py             # Standalone OpenCV Application
├── database.py         # DB Management Layer
└── requirements.txt    # Project dependencies
```

## 🚀 Quick Start

1. **Install Dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

2. **Run the Web Dashboard**:
   ```bash
   python app.py
   ```
   Open `http://localhost:5000` in your browser.

3. **Run Standalone Mode**:
   ```bash
   python main.py
   ```

## 🛠️ Technology Stack

- **AI Model**: Ultralytics YOLOv8
- **Backend**: Python, Flask, Flask-SocketIO
- **Frontend**: HTML5, Vanilla CSS, JavaScript (Chart.js)
- **Database**: SQLite3
- **CV Library**: OpenCV

---
*Developed for AI Traffic Analytics Research.*
