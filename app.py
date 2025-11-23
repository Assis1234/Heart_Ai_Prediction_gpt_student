import numpy as np
import pickle
import pandas as pd
from flask import Flask, render_template, request, redirect, session, flash, url_for
from db import get_connection

app = Flask(__name__)


app.secret_key = "any_secret_key_here"  # needed for sessions

file = open('final_model.pkl','rb')
ml_model = pickle.load(file)

@app.route('/')

@app.route('/index') 
def index():
	return render_template('index.html')
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']

        conn = get_connection()
        cur = conn.cursor(dictionary=True)
        cur.execute("SELECT * FROM patients WHERE username=%s AND password=%s", (username, password))
        user = cur.fetchone()
        conn.close()

        if user:
            if user:
                session['user_id'] = user['id']
                session['age'] = user['age']
                session['gender'] = user['gender']
                session['username'] = user['username']  # must be set
            print("LOGIN SUCCESS, USER ID =", session['username'])
            return redirect('/home')

        else:
            return render_template('login.html', error="Invalid Email or Password")

    # GET REQUEST → Just show the login page
    return render_template('login.html')
@app.route('/register', methods=['GET','POST'])
def register():
    if request.method == 'POST':
        data = request.form
        try:
            conn = get_connection()
            cur = conn.cursor()
            sql = """INSERT INTO patients
            (first_name, second_name, dob, age, gender, height, weight, diabetic, alcoholic, exercise, username, password)
            VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
            """
            cur.execute(sql, (
                data['first_name'],
                data['second_name'],
                data['dob'],
                data['age'],
                data['gender'],
                data['height'],
                data['weight'],
                data['diabetic'],
                data['alcoholic'],
                data['exercise'],
                data['username'],
                data['password']
            ))
            conn.commit()
            conn.close()

            flash("✅ Account created successfully!", "success")
            return redirect('/login')

        except Exception as e:
            flash(f"❌ Error creating account: {str(e)}", "error")
            return redirect('/register')

    return render_template('patient.html')
@app.route('/profile')
def profile():
    if 'user_id' not in session:
        return redirect('/login')

    conn = get_connection()
    cur = conn.cursor(dictionary=True)

    # Get user info
    cur.execute("SELECT * FROM patients WHERE id=%s", (session['user_id'],))
    user = cur.fetchone()

    # Get user predictions
    cur.execute("SELECT * FROM predictions WHERE user_id=%s ORDER BY created_at DESC", (session['user_id'],))
    predictions = cur.fetchall()

    # Get appointments for this user from patient table, join with doctors
    cur.execute("""
        SELECT p.appointment_date, d.first_name, d.last_name
        FROM patient p
        JOIN doctors d ON p.doctor_id = d.id
        WHERE p.username = %s AND p.appointment_date IS NOT NULL
        ORDER BY p.appointment_date ASC
    """, (session.get('username'),))
    appointments = cur.fetchall()

    conn.close()

    return render_template("profile.html", user=user, predictions=predictions, appointments=appointments)

@app.route('/logout')
def logout():
    session.clear()
    return redirect('/')
@app.route('/abstract') 
def abstract():
    if 'user_id' not in session:
        return redirect('/login')
    else:
	    return render_template('abstract.html') 
@app.route('/elements') 
def elements():
	return render_template('elements.html')
  
@app.route('/chart') 
def chart():
	return render_template('chart.html')     
@app.route('/upload') 
def upload():
	return render_template('upload.html') 
@app.route('/preview', methods=["POST"])
def preview():
    if request.method == 'POST':
        dataset = request.files['datasetfile']
        df = pd.read_csv(dataset, encoding='unicode_escape')

        # Check if 'Id' column exists
        if 'Id' in df.columns:
            df.set_index('Id', inplace=True)

        return render_template("preview.html", df_view=df)
 
# Doctor Login
@app.route('/doctor/login', methods=['GET', 'POST'])
def doctor_login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']

        conn = get_connection()
        cur = conn.cursor(dictionary=True)
        cur.execute("SELECT * FROM doctors WHERE email=%s AND password=%s", (email, password))
        doctor = cur.fetchone()
        conn.close()

        if doctor:
            session['doctor_id'] = doctor['id']
            session['doctor_name'] = f"{doctor['first_name']} {doctor['last_name']}"
            return redirect('/doctor/view_patients')
        else:
            flash("Invalid email or password", "error")
            return redirect('/doctor/login')

    return render_template('doctor_login.html')



@app.route('/doctor/view_patients')
def doctor_view_patients():
    if 'doctor_id' not in session:
        return redirect(url_for('doctor_login'))
    
    conn = get_connection()
    cur = conn.cursor(dictionary=True)
    # Fetch patients for this doctor
    cur.execute("SELECT * FROM patient WHERE doctor_id=%s ORDER BY patient_id DESC", (session['doctor_id'],))
    patients = cur.fetchall()
    conn.close()
    
    return render_template("doctor_view.html", shared_data=patients)

    # If you want to filter by doctor_id, add a doctor_id column to patient table
    # For now, fetch all patients
    conn = get_connection()
    cur = conn.cursor(dictionary=True)
    cur.execute("SELECT * FROM patient ORDER BY patient_id DESC")
    patients = cur.fetchall()
    conn.close()

    return render_template("doctor_view.html", shared_data=patients)

@app.route('/doctor/logout')
def doctor_logout():
    session.pop('doctor_id', None)
    session.pop('doctor_name', None)
    return redirect('/doctor/login')

# app.py (Make sure to add necessary imports like flask, redirect, url_for, request, flash, session, and your DB library/get_connection function)
# Assuming you have an initialization like:
# app = Flask(__name__)
# app.secret_key = 'your_secret_key' 

@app.route("/sending", methods=["POST"])
def sending():
    if 'user_id' not in session:
        return redirect('/login')
    print("Instialing Started")
    

    username = request.form.get('user')
    age = request.form.get('age')
    gender = request.form.get('gender')
    cp_text = request.form['cp']           # e.g., "Typical Angina"
        # numeric
              # numeric
    fbs_text = request.form['fbs']         # e.g., "Fasting BP > 120 mg/dl"
    restecg_text = request.form['restecg'] # e.g., "Normal"
         # numeric
    exang_text = request.form['exang']     # "Yes" or "No"
    result = request.form['result']
    
    cp_list = [
    "Typical Angina",      # 0
    "Atypical Angina",     # 1
    "Non-Anginal Pain",    # 2
    "Asymptomatic"         # 3
    ]

# 2️⃣ Fasting Blood Sugar (fbs)
    fbs_list = [
    "Fasting BP > 120 mg/dl",  # 0
    "Fasting BP < 120 mg/dl"   # 1
    ]

# 3️⃣ Resting ECG (restecg)
    restecg_list = [
    "Normal",                   # 0
    "ST-T Abnormality",         # 1
    "Left Ventricular Hypertrophy"  # 2
    ]

# 4️⃣ Exercise Induced Angina (exang)
    exang_list = [
    "Yes",   # 0
    "No"   # 1
    ]   
    trestbps_str = request.form.get('trestbps', '').strip()
    chol_str = request.form.get('chol', '').strip()
    thalach_str = request.form.get('thalach', '').strip()

    if not trestbps_str or not chol_str or not thalach_str:
        flash("❌ Please fill all numeric fields before submitting.", "error")
        return redirect(url_for('home'))

    restbps = int(trestbps_str)
    chol = int(chol_str)
    thalach = int(thalach_str)

    # 2️⃣ Map text to numeric codes for ML prediction only
    cp_map = {"Typical Angina":0,"Atypical Angina":1,"Non-Anginal Pain":2,"Asymptomatic":3}
    fbs_map = {"Fasting BP > 120 mg/dl":0,"Fasting BP < 120 mg/dl":1}
    restecg_map = {"Normal":0,"ST-T Abnormality":1,"Left Ventricular Hypertrophy":2}
    exang_map = {"No":0,"Yes":1}

    cp_value = cp_map.get(cp_text,0)
    fbs_value = fbs_map.get(fbs_text,0)
    restecg_value = restecg_map.get(restecg_text,0)
    exang_value = exang_map.get(exang_text,0)




    


    

    # Basic validation
    if not all([  age, gender, chol, restbps, chol, fbs_list[fbs_value], restecg_list[restecg_value], thalach, exang_list[exang_value], result]):
        print("Erooooororororororo")
        return redirect(url_for('home'))


    try:
        conn = get_connection()
        cur = conn.cursor()
        sql = """INSERT INTO patient
                (username, age, gender, chest_pain_type, resting_bp, cholesterol, fbs, ecg, max_hr, ex_angina, result, appointment_date,doctor_id)
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s )"""
        cur.execute(sql,
            (
            username,
            age,
            gender,
            cp_list[cp_value],
            restbps,
            chol,
            fbs_list[fbs_value],
            restecg_list[restecg_value],
            thalach,
            exang_list[exang_value],
            result,
            None,
            session['doctor_id']
        ))
        conn.commit()
        flash("✅ Report sent to doctor successfully!", "success")

    except Exception as e:
        print("ERROR sending report:", e)
        flash(f"❌ Failed to send report: {str(e)}", "error")

    finally:
        cur.close()
        conn.close()
            # ... (rest of the error handling) ...# Or redirect back to the prediction result page
    return render_template('result.html')  # or wherever you want


# @app.route('/profile')
# def profile():
#     username = session.get('username')  # get logged-in username

#     if not username:
#         return redirect('/login')

#     conn = get_connection()
#     cur = conn.cursor(dictionary=True)

#     # Patient info
#     cur.execute("SELECT * FROM patient WHERE username=%s", (username,))
#     user = cur.fetchone()

#     # Heart predictions
#     cur.execute("SELECT * FROM predictions WHERE user_id=%s ORDER BY created_at DESC", (user['patient_id'],))
#     predictions = cur.fetchall()

#     # Only appointments scheduled by doctor
#     # Only appointments scheduled by doctor
#     cur.execute("""
#     SELECT a.appointment_date, d.first_name, d.last_name
#     FROM patient a
#     JOIN doctors d ON a.doctor_id = d.id
#     WHERE a.username=%s AND a.appointment_date IS NOT NULL
#     ORDER BY a.appointment_date ASC
# """, (username,))
#     appointments = cur.fetchall()

#     cur.close()
#     conn.close()

#     return render_template('profile.html', user=user, predictions=predictions, appointments=appointments)

@app.route('/home')
def home():
    if 'user_id' not in session:
        return redirect('/')
    else:
        return render_template('heart.html')
    
# @app.route('/create_appointment', methods=['POST'])
# def create_appointment():
    if 'doctor_id' not in session:
        return redirect('/doctor/login')

    patient_id = request.form.get('patient_id')
    appointment_time = request.form.get('appointment_time')  # this may be None

    if not patient_id or not appointment_time:
        flash("❌ Patient ID or appointment time missing.", "error")
        return redirect(url_for('doctor_view_patients'))

    doctor_id = session['doctor_id']
    conn = get_connection()
    cur = conn.cursor()
    try:
        sql = "UPDATE patient_shared_data SET appointment = %s WHERE patient_id = %s AND doctor_id = %s"
        cur.execute(sql, (appointment_time, patient_id, doctor_id))
        conn.commit()
        flash("✅ Appointment set successfully.", "success")
    except Exception as e:
        conn.rollback()
        flash(f"❌ Failed to set appointment: {str(e)}", "error")
    finally:
        cur.close()
        conn.close()

    return redirect(url_for('doctor_view_patients'))

@app.route("/predict", methods=["POST"])
def predict():
    if 'user_id' not in session:
        return redirect('/login')
    print("Data has been uploaded to patient_prediction database")
# 1️⃣ Chest Pain Type (cp)
    cp_list = [
    "Typical Angina",      # 0
    "Atypical Angina",     # 1
    "Non-Anginal Pain",    # 2
    "Asymptomatic"         # 3
    ]

# 2️⃣ Fasting Blood Sugar (fbs)
    fbs_list = [
    "Fasting BP > 120 mg/dl",  # 0
    "Fasting BP < 120 mg/dl"   # 1
    ]

# 3️⃣ Resting ECG (restecg)
    restecg_list = [
    "Normal",                   # 0
    "ST-T Abnormality",         # 1
    "Left Ventricular Hypertrophy"  # 2
    ]

# 4️⃣ Exercise Induced Angina (exang)
    exang_list = [
    "Yes",   # 0
    "No"   # 1
    ]   



    # 1️⃣ Get text values from form
    cp_text = request.form['cp']           # e.g., "Typical Angina"
    trestbps = int(request.form['trestbps'])    # numeric
    chol = int(request.form['chol'])            # numeric
    fbs_text = request.form['fbs']         # e.g., "Fasting BP > 120 mg/dl"
    restecg_text = request.form['restecg'] # e.g., "Normal"
    thalach = int(request.form['thalach'])      # numeric
    exang_text = request.form['exang']     # "Yes" or "No"

    # 2️⃣ Map text to numeric codes for ML prediction only
    cp_map = {"Typical Angina":0,"Atypical Angina":1,"Non-Anginal Pain":2,"Asymptomatic":3}
    fbs_map = {"Fasting BP > 120 mg/dl":0,"Fasting BP < 120 mg/dl":1}
    restecg_map = {"Normal":0,"ST-T Abnormality":1,"Left Ventricular Hypertrophy":2}
    exang_map = {"No":0,"Yes":1}

    cp_value = cp_map.get(cp_text,0)
    fbs_value = fbs_map.get(fbs_text,0)
    restecg_value = restecg_map.get(restecg_text,0)
    exang_value = exang_map.get(exang_text,0)

    # 3️⃣ ML prediction
    pred_args = [cp_value, trestbps, chol, fbs_value, restecg_value, thalach, exang_value]
    pred_args_arr = np.array(pred_args).reshape(1, -1)
    output = ml_model.predict(pred_args_arr)[0]

    prediction_text = ("You have Symptoms of heart disease. Please consult the Doctor"
                       if int(output) == 1 else
                       "You do not have any Symptoms of heart disease")
    # 4️⃣ Insert human-readable text into predictions table
    try:
        conn = get_connection()
        cur = conn.cursor()
        sql_insert = """INSERT INTO predictions
                            (user_id, cp, trestbps, chol, fbs, restecg, thalach, exang, result)
                            VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)"""
        cur.execute(sql_insert, (
                session['user_id'],
                cp_list[cp_value],        # text, not numeric code
                trestbps,
                chol,
                fbs_list[fbs_value],       # text
                restecg_list[restecg_value],   # text
                thalach,
                exang_list[exang_value],     # text
                prediction_text
            ))
        conn.commit()
    except Exception as e:
        conn.rollback()
        print("ERROR inserting prediction:", e)
    finally:
        cur.close()
        conn.close()

        # 5️⃣ Fetch doctors for result page
    conn = get_connection()
    cur = conn.cursor(dictionary=True)
    cur.execute("SELECT * FROM doctors")
    doctors = cur.fetchall()
    conn.close()
    
    return render_template(
    "result.html",
    prediction_text=prediction_text,
    cp=cp_list[cp_value],
    trestbps=trestbps,
    chol=chol,
    fbs=fbs_list[fbs_value],
    restecg=restecg_list[restecg_value],
    thalach=thalach,
    exang=exang_list[exang_value]
)




from datetime import datetime

@app.route('/create_appointment', methods=['POST'])
def create_appointment():
    if 'doctor_id' not in session:
        return redirect('/doctor/login')

    doctor_id = session['doctor_id']
    patient_id = request.form.get('patient_id')
    appointment_time = request.form.get('appointment_time')

    if not patient_id or not appointment_time:
        flash("❌ Patient ID or appointment time missing.", "error")
        return redirect(url_for('doctor_view_patients'))

    try:
        conn = get_connection()
        cur = conn.cursor()
        sql = """
            UPDATE patient
            SET appointment_date = %s, doctor_id = %s
            WHERE patient_id = %s
        """
        cur.execute(sql, (appointment_time, doctor_id, patient_id))
        conn.commit()
        flash("✅ Appointment set successfully.", "success")
    except Exception as e:
        conn.rollback()
        flash(f"❌ Failed to set appointment: {str(e)}", "error")
    finally:
        cur.close()
        conn.close()

    return redirect(url_for('doctor_view_patients'))

if __name__ == "__main__":
    app.run(debug=True)
