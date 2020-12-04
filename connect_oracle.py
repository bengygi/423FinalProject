import cx_Oracle
import pandas as pd

"""
Some quick start guides:
* cx_Oracle 8: https://cx-oracle.readthedocs.io/en/latest/user_guide/installation.html
* pandas: https://pandas.pydata.org/pandas-docs/stable/user_guide/10min.html
"""
# TODO change path of Oracle Instant Client to yours
cx_Oracle.init_oracle_client(lib_dir = "C:\\Users\\bengy\\Downloads\\python_tutorial\\instantclient_19_9")

# TODO change credentials
# Connect as user "user" with password "mypass" to the "CSC423" service
# running on lawtech.law.miami.edu

connection = cx_Oracle.connect(
        "begycsc423", "c07971", "lawtech.law.miami.edu/CSC_423")
cursor = connection.cursor()
    

def query1():
    
    print("\nQuery 1: Display the names and studentIDs of all students enrolled in 'Spanish Level 2' who have yet to pay their enrollment fee")

    cursor.execute("""
    SELECT s.StudentID, firstName, lastName
    FROM EnrollmentLog e, Student s, Course c
    WHERE e.studentID = s.studentID AND e.courseCode = c.courseCode AND courseName = 'Spanish Level 2' AND feePaid = 0

    """)
    # get column names from cursor
    columns = [c[0] for c in cursor.description]
    # fetch data
    data = cursor.fetchall()
    # bring data into a pandas dataframe for easy data transformation
    df = pd.DataFrame(data, columns = columns)
    print(df) # examine
    print(df.columns)
    # print(df['FIRST_NAME']) # example to extract a column

def query2():
    
    print("\nQuery2: Display the names and tutor numbers of all tutors who teach a section of the course 'Spanish Level 1'")
    cursor.execute("""

    SELECT DISTINCT t.tutorNo, firstName, lastName 
    FROM  Tutor t, CourseSection s, Course c
    WHERE s.tutorNo = t.tutorNo AND s.courseCode = c.courseCode AND courseName = 'Spanish Level 1'

    """)


    # get column names from cursor
    columns = [c[0] for c in cursor.description]
    # fetch data
    data = cursor.fetchall()
    # bring data into a pandas dataframe for easy data transformation
    df = pd.DataFrame(data, columns = columns)
    print(df) # examine
    print(df.columns)
    # print(df['FIRST_NAME']) # example to extract a column


def query3():
    
    print("\nQuery3: Display the names and phone numbers of all students in the section of ‘Spanish Level 1’ that meets on Monday mornings at 8AM")
    cursor.execute("""

    SELECT firstName, lastName, phoneNumber
    FROM EnrollmentLog e, Course c, CourseSection f, Student s
    WHERE e.studentID = s.studentID AND f.courseCode= e.courseCode AND e.courseCode=c.courseCode AND e.sectionNo = f.sectionNo AND c.courseName = 'Spanish Level 1' AND f.startTime='008:00:00'


    """)


    # get column names from cursor
    columns = [c[0] for c in cursor.description]
    # fetch data
    data = cursor.fetchall()
    # bring data into a pandas dataframe for easy data transformation
    df = pd.DataFrame(data, columns = columns)
    print(df) # examine
    print(df.columns)
    # print(df['FIRST_NAME']) # example to extract a column

def query4():
    
    print("\nQuery4: Display all classes that meet only on Tuesdays with the course name, section number, start date, and the name of the tutor")
    cursor.execute("""

    SELECT s.sectionNo, courseName, firstName, lastName, startDate
    FROM CourseSection s, Course c, Tutor t
    WHERE c.courseCode = s.courseCode AND s.tutorNo = t.tutorNo AND daysOfWeek = 'Tu'

    """)


    # get column names from cursor
    columns = [c[0] for c in cursor.description]
    # fetch data
    data = cursor.fetchall()
    # bring data into a pandas dataframe for easy data transformation
    df = pd.DataFrame(data, columns = columns)
    print(df) # examine
    print(df.columns)
    # print(df['FIRST_NAME']) # example to extract a column

def query5():
    
    print("\nQuery5: Find the total number of students enrolled in ‘Spanish Level 1’ across all sections")
    cursor.execute("""

    SELECT  COUNT(*) AS NumStudent
    FROM EnrollmentLog e, CourseSection s, Course c
    WHERE s.courseCode=e.courseCode AND e.sectionNo = s.sectionNo AND c.courseCode = s.courseCode AND c.courseName = 'Spanish Level 1'


    """)


    # get column names from cursor
    columns = [c[0] for c in cursor.description]
    # fetch data
    data = cursor.fetchall()
    # bring data into a pandas dataframe for easy data transformation
    df = pd.DataFrame(data, columns = columns)
    print(df) # examine
    print(df.columns)
    # print(df['FIRST_NAME']) # example to extract a column


query1()
query2()
query3()
query4()
query5()


