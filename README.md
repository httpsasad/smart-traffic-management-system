# 🚦 Smart Traffic Management System

An advanced AI-powered real-time traffic monitoring and management system built with **YOLOv8**, **Flask**, and **OpenCV**. Designed for Smart City infrastructures to optimize traffic flow, estimate vehicle speeds, and detect road incidents automatically.

---

## 📸 Demo

> Run the web dashboard at `http://localhost:5000` to view live AI-powered CCTV analytics.

---

## ✨ Features

- **🚗 Real-time Vehicle Detection** — Tracks cars, trucks, buses, and motorcycles with unique ID assignment using YOLOv8 tracking
- **⚡ Speed Estimation** — Dynamically calculates vehicle speed (km/h) using pixel-to-meter mapping
- **🚨 Accident & Incident Detection**
  - **Sudden Stop** — Detects vehicles that stop abruptly from high speed
  - **Collision Detection** — Identifies potential vehicle collisions in real-time using bounding box overlap analysis
- **🔴 Smart Signal Control** — Automatically adjusts traffic signal modes based on real-time vehicle density
- **📊 Analytics Dashboard** — Live CCTV stream with AI overlays, historical traffic trends (Chart.js), and incident logs
- **🔊 Voice Alerts** — Browser-based voice notifications for critical incidents
- **🎥 Multi-Source Support** — Toggle between local video files and live webcam streams
- **💾 Database Logging** — SQLite-based persistent storage for traffic stats and incident history

---

## 📁 Project Structure

```
Smart-Traffic-Management/
├── assets/                  # Media files (traffic video, snapshots)
├── data/                    # SQLite database (traffic_stats.db)
├── models/                  # Pre-trained AI model (yolov8n.pt)
├── static/                  # Frontend assets (CSS, JS, images)
├── templates/               # Flask HTML templates
│   └── index.html
├── utils/                   # Shared utilities
│   └── traffic_utils.py     # Speed calc, collision check, IncidentManager
├── app.py                   # Flask Web Application (main server)
├── main.py                  # Standalone OpenCV Application
├── database.py              # SQLite DB management layer
├── advanced_traffic_analysis.py  # Basic YOLO counting script
├── requirements.txt         # Python dependencies
├── run.bat                  # Windows quick-start script
└── README.md
```

---

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/smart-traffic-management.git
cd smart-traffic-management
```

### 2. Install Dependencies

```bash
pip install -r requirements.txt
```

### 3. Download YOLOv8 Model

The model (`yolov8n.pt`) will auto-download on first run via Ultralytics, or you can place it manually inside the `models/` folder.

### 4. Add a Traffic Video (Optional)

Place your traffic video as:
```
assets/traffic_video.mp4
```
If not provided, the system will fall back to your webcam (Camera 0).

### 5. Run the Web Dashboard

```bash
python app.py
```

Open your browser and go to: **`http://localhost:5000`**

### 6. Run Standalone Mode (No Browser)

```bash
python main.py
```

Press **`Q`** to quit.

### Windows Users

Double-click `run.bat` to auto-initialize the database and launch the server.

---

## ⚙️ Configuration

| Parameter | Location | Default | Description |
|-----------|----------|---------|-------------|
| `PPM` | `app.py` / `main.py` | `10` | Pixels Per Meter (adjust for your camera setup) |
| `FPS` | `app.py` / `main.py` | `30` | Frames per second of the video source |
| `conf` threshold | `app.py` | `0.2` | YOLO detection confidence threshold |
| Incident cooldown | `IncidentManager` | `10s` | Cooldown between repeated incident alerts |
| DB log interval | `app.py` | `30s` | How often traffic stats are saved to the database |

---

## 🛠️ Technology Stack

| Layer | Technology |
|-------|-----------|
| AI Model | [Ultralytics YOLOv8](https://github.com/ultralytics/ultralytics) |
| Backend | Python 3, Flask, Flask-SocketIO |
| Frontend | HTML5, Vanilla CSS, JavaScript, Chart.js |
| Computer Vision | OpenCV |
| Database | SQLite3 |
| Real-time Comms | WebSockets (Socket.IO) |

---

## 📡 API Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/` | GET | Main dashboard |
| `/video_feed` | GET | Live MJPEG video stream |
| `/set_source/<mode>` | GET | Switch source: `VIDEO` or `LIVE` |
| `/toggle_pause` | GET | Pause/resume the stream |
| `/take_snapshot` | GET | Save a snapshot of the current frame |
| `/api/history` | GET | Recent traffic logs (JSON) |
| `/api/incidents` | GET | Recent incident logs (JSON) |

---

## 🧠 How It Works

1. **Detection** — YOLOv8 runs on each frame and detects vehicles (car, truck, bus, motorcycle)
2. **Tracking** — Unique IDs are assigned and tracked across frames using ByteTrack
3. **Speed Estimation** — Centroid displacement between frames is converted to km/h using PPM and FPS
4. **Incident Detection** — Sudden stops (speed drops from >20 to <2 km/h) and bounding box overlaps (>40%) trigger alerts
5. **Signal Logic** — Traffic density determines signal mode: `SHORT GREEN` / `NORMAL GREEN` / `GREEN EXTENDED`
6. **Logging** — Stats are saved to SQLite every 30 seconds; incidents are logged immediately

---

## 📋 Requirements

```
ultralytics
opencv-python
numpy
flask
flask-socketio
eventlet
```

---

## ⚠️ Known Limitations

- Speed estimation accuracy depends on proper `PPM` calibration for your specific camera and road setup
- Collision detection uses simple bounding box overlap, which may produce false positives in dense traffic
- The system requires a decent GPU for smooth real-time performance at high resolutions

---

## 🤝 Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).

---

*Developed for AI Traffic Analytics Research.*
