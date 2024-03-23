from flask import Flask
import os

from dotenv import load_dotenv
import psycopg2

dbname = os.getenv("POSTGRESQL_DB")
user = os.getenv("POSTGRESQL_USERNAME")
password = os.getenv("POSTGRESQL_PASSWORD")

app = Flask(__name__)

load_dotenv

@app.route('/')
def index():
    # Connect to PostgreSQL
    connection = psycopg2.connect(
        dbname=dbname,
        user=user,
        password=password,
        host='localhost',
        port='5432'
    )
    cursor = connection.cursor()
    
    # Example query
    cursor.execute("SELECT version();")
    db_version = cursor.fetchone()[0]
    
    # Close the connection
    cursor.close()
    connection.close()
    
    return f"PostgreSQL Version: {db_version}"

if __name__ == '__main__':
    app.run(debug=True)
