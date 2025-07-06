# service-python (Python - CRUD karyawan)
# app.py
from flask import Flask, request, jsonify
import mysql.connector

app = Flask(__name__)

db = mysql.connector.connect(
    host="db",
    user="root",
    password="rootpass",
    database="perusahaan"
)
cursor = db.cursor(dictionary=True)

@app.route('/karyawan', methods=['GET'])
def get_karyawan():
    cursor.execute("SELECT * FROM karyawan")
    result = cursor.fetchall()
    return jsonify(result)

@app.route('/karyawan', methods=['POST'])
def tambah_karyawan():
    data = request.json
    cursor.execute("INSERT INTO karyawan (nama, jabatan, gaji) VALUES (%s, %s, %s)",
                   (data['nama'], data['jabatan'], data['gaji']))
    db.commit()
    return jsonify({'message': 'Karyawan ditambahkan'})

@app.route('/karyawan/<int:id>', methods=['PUT'])
def update_karyawan(id):
    data = request.json
    cursor.execute("UPDATE karyawan SET nama=%s, jabatan=%s, gaji=%s WHERE id=%s",
                   (data['nama'], data['jabatan'], data['gaji'], id))
    db.commit()
    return jsonify({'message': 'Karyawan diperbarui'})

@app.route('/karyawan/<int:id>', methods=['DELETE'])
def delete_karyawan(id):
    cursor.execute("DELETE FROM karyawan WHERE id=%s", (id,))
    db.commit()
    return jsonify({'message': 'Karyawan dihapus'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)