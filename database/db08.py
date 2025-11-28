import oracledb

def getConnection():
    return oracledb.connect(user='ora_user',password='1111',dsn='localhost:1521/xe')

#### 
while(True):
    score = int(input("점수를 입력하세요.>> "))
    
    # db연결실행        
    conn = getConnection()
    cursor = conn.cursor()
    query = f"select count(total) from stuscore where total>={score}"
    cursor.execute(query)
    rows = cursor.fetchone()
    print(rows)
    # stuscore테이블 total컬럼을 비교해서 
    # 입력한 점수보다 점수가 높은 학생이 몇명인지 출력하시오.
    # query = "select count(total) from stuscore where total>=120"
    print("입력점수 :",score)
    print("입력한 점수보다 높은 학생수 : ",rows[0])

conn.close()    
    




# 월급   년봉   원화 천단위표시해서 출력하시오.
#---------------------------------
# 2000  2000*12 2000*12*1743
# print(f"월급\t년봉\t원화")
# print("-"*50)
# for row in rows:
#     print("{}\t{}\t{}".format(*row))
