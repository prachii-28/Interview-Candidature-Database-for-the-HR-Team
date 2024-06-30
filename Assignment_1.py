#1.Load the Data (csv or excel) into Dataframe using Pandas.
import pandas as pd
#excel is working
DataFrame = pd.read_excel("Employee Sample Data.xlsx")
#csv is not working
#DataFrame = pd.read_csv("Employee Sample Data.csv")
pd.set_option('display.max_columns', None)
print(DataFrame)

#2.Calculate the Overall Salary retrieved from IT Department
it_df = DataFrame[DataFrame['Department'] == 'IT']
overall_salary_it_department = it_df['Annual Salary'].sum()
print("Overall Salary in IT Department:", overall_salary_it_department)
print()

# #3.Count of people who work for Speciality Products Business Unit.
BU_count = DataFrame.groupby('Business Unit').count()
sp = BU_count.get('Speciality Products', 0)
print("Count of people who work for Speciality Products Business Unit:", sp)

#4.Print the Prime number till 1000 in less number of code lines.
for num in range (1,1001):
    if num > 1:
        for i in range (2,num):
            if (num % i) == 0:
                break
        else:
                print(num)


#5."EY is known for it’s Audit and Taxation Services”. Remove all the Spaces from this string
string = "EY is known for it's Audit and Taxation Services"
print(string.replace(" ", ""))

#6.in the above String Change first and Last word as capital Letter.
words = string.split()
words[0] = words[0].upper()
words[-1] = words[-1].upper()
new_string = ' '.join(words)
print(new_string)


