
@echo off
echo Starting Smart Traffic Management System...
echo Initializing Database...
python -c "from database import init_db; init_db()"
echo Starting Flask Server on http://localhost:5000
python app.py
pause
