# db.py
import mysql.connector
import os

def get_connection():
    conn = mysql.connector.connect(
        host=os.getenv("DB_HOST", "localhost"),       # default = localhost
        user=os.getenv("DB_USER", "root"),            # default = root
        password=os.getenv("DB_PASSWORD", "NewPassword123"),  # default = your local pwd
        database=os.getenv("DB_NAME", "heart_patient"),       # default = your local DB
        port=int(os.getenv("DB_PORT", 18222))          # default = 3306
    )
    return conn
