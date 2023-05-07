# app.py
from flask import Flask, render_template, request, redirect, url_for, flash
import psycopg2  # pip install psycopg2
import psycopg2.extras

app = Flask(__name__)
app.secret_key = "whoami"

DB_HOST = "localhost"
DB_NAME = "Formula1_CRUD"
DB_USER = "postgres"
DB_PASS = "linux"

conn = psycopg2.connect(dbname=DB_NAME, user=DB_USER, password=DB_PASS, host=DB_HOST)

@app.route('/')
def Index():
    cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
    s = "SELECT * FROM pilotos"
    cur.execute(s)  # Execute the SQL
    list_users = cur.fetchall()
    return render_template('index.html', list_users=list_users)


@app.route('/add_pilot', methods=['POST'])
def add_pilot():
    cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
    if request.method == 'POST':
        primer_nombre = request.form['nombreCompleto']
        apellido = request.form['apellido']
        equipo = request.form['equipo']
        cur.execute("INSERT INTO pilotos (nombreCompleto, apellido, equipo) VALUES (%s,%s,%s)", (primer_nombre, apellido, equipo))
        conn.commit()
        flash('Pilot Added successfully')
        return redirect(url_for('Index'))


@app.route('/edit/<id>', methods=['POST', 'GET'])
def get_employee(id):
    cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)

    cur.execute('SELECT * FROM pilotos WHERE id = %s', (id))
    data = cur.fetchall()
    cur.close()
    print(data[0])
    return render_template('edit.html', piloto=data[0])


@app.route('/update/<id>', methods=['POST'])
def update_pilot(id):
    if request.method == 'POST':
        primer_nombre = request.form['nombreCompleto']
        apellido = request.form['apellido']
        equipo = request.form['equipo']

        cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        cur.execute("""
            UPDATE pilotos
            SET nombreCompleto = %s,
                apellido = %s,
                equipo = %s
            WHERE id = %s
        """, (primer_nombre, apellido, equipo, id))
        flash('Pilot Updated Successfully')
        conn.commit()
        return redirect(url_for('Index'))


@app.route('/delete/<string:id>', methods=['POST', 'GET'])
def delete_pilot(id):
    cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)

    cur.execute('DELETE FROM pilotos WHERE id = {0}'.format(id))
    conn.commit()
    flash('Pilot Removed Successfully')
    return redirect(url_for('Index'))


if __name__ == "__main__":
    app.run(debug=True)
