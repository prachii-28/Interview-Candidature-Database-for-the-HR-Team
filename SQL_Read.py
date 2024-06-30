import pyodbc

connection = pyodbc.connect ('Driver={SQL Server};'
                             'Server=LAPTOP-HASKGEO3\SQLEXPRESS;'
                             'Database=SAMPLE_DB;'
                             'Trusted_Connection=yes;')
cursor=connection.cursor()
cursor.execute ('SELECT *FROM dbo.Sheet1$')

for row in cursor:
    print('row = %r' % (row,))
    #print(row)








# import pandas as pd
# df = pd.read_sql_query("SELECT * FROM dbo.Sheet1$", connection)
# pd.set_option('display.max_columns', None)
# print(df)























