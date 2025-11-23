# db.py
import mysql.connector

def get_connection():
    conn = mysql.connector.connect(
    host="localhost",       # your MySQL host
    user="root",            # your MySQL username
    password="NewPassword123",            # your MySQL password
    database="heart_patient"
    )
    return conn