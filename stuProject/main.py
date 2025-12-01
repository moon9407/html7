# import db_lastConn
from stuConnect import *
from stuFunc import *

# conn = db_lastConn.getConnection()
#conn= getConnection()


#------------------------------
while True:
    print("[ 학생성적처리프로그램 ]")
    print("[ 1. 성적입력 ]")
    print("[ 2. 성적출력 ]")
    print("[ 3. 성적수정 ]")
    print("[ 4. 성적삭제 ]")
    print("[ 5. 학생검색 ]")
    print("[ 6. 학생정렬 ]")
    print("[ 7. 등수처리 ]")
    print("[ 0. 프로그램 종료 ]")
    print("-"*50)
    choice = (input("원하는 번호를 입력하세요.>> "))
    if choice == "1":       # 성적입력
        stuInput()
    elif choice == "2":     # 성적출력
        stuOutput()
    elif choice == "3":     # 성적수정
        stuupdate()
    elif choice == "4":     # 성적삭제
        stuDelete()
    elif choice == "5":     # 학생검색
        stuSearch()
    elif choice == "6":     # 학생정렬
        stuOrder()
    elif choice == "7":     # 등수처리
        stuRank()
    else:                   # 종료
        print("[ 프로그램 종료 ]")
        break



