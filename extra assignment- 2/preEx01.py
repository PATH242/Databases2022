# create db
# psql -d template1
import psycopg2
from faker import Faker


con = psycopg2.connect(database="customers", user="postgres",
                       password="path2357", host="127.0.0.1", port="5432")

print("Database opened successfully")
cur = con.cursor()
cur.execute('''CREATE TABLE CUSTOMER
       (ID INT PRIMARY KEY     NOT NULL,
       Name           TEXT    NOT NULL,
       Address            TEXT     NOT NULL,
       review        TEXT);''')
print("Table created successfully")
fake = Faker()
for i in range(100000):
    print(i)
    cur.execute("INSERT INTO CUSTOMER (ID,Name,Address,review) VALUES ('" + str(
        i) + "','" + fake.name() + "','" + fake.address() + "','" + fake.text() + "')")
    con.commit()


