import time;
import os;

def add_quiz():
    if not os.path.exists("Quiz"):
            os.makedirs("Quiz")
    os.chdir("Quiz")
    sub=input("\n\n Enter subject's name:")
    id=time.strftime("%d")
    id=sub+"_"+str(id)
    #print(id)

    que_n=int(input("enter the no of questions:"))
    k=1
    while(k<=que_n):
            que=input("Enter question no. "+str(k)+":")
            opt1=input("Enter 1st option:")
            opt2=input("Enter 2nd option:")
            opt3=input("Enter 3rd option:")
            opt4=input("Enter 4th option:")
            ans=int(input("Enter the option no."))

            """f="\\"+id+".txt"
            print(f)
            if not os.path.exists("\\" + id + ".txt"):
                count=0
            else:
                count=3
                
            print(count)"""
            file=open(id+".txt",'a')
           # if(count>0):
            file.write("\n")
            file.write(que)
            file.write("\n")
            file.write(opt1)
            file.write("\n")
            file.write(opt2)
            file.write("\n")
            file.write(opt3)
            file.write("\n")
            file.write(opt4)

            file.write("\n")
            file.write(str(ans))
            file.close()
            k=k+1

    os.chdir("..")


def sign():
	fo = open("login.txt", "a")
	name = input("Enter your Username :")
	password = input("Enter your password :")
	entry = name +"<>" + password 
	fo.write(entry )
	fo.write("\n")
	fo.close()


def Login(n):
        name = input("Enter Your Username: ")
        password = input ("Enter Your Password:")
        query=name+"<>"+password
        datafile = open('login.txt',"r")
        for line in datafile:
                if query in line:
                        print("Login succesfully")
                        if(n==1):
                            teachers()
                        else:
                            students(name)
                        return True
                        
        print("First Create your account")
        return False
    

def teachers():
    j=5
    while(j!=0):
        print("\n\n1.Add a quiz    2.Review Quiz     3.Home")
        choice2=int(input("Select an option:"))

        if(choice2==1):
            add_quiz()
        elif(choice2==2):
            review_quiz()
        elif(choice2==3):
            j=0
        else:
            print("\nSelect a valid choice!")


def review_quiz():
    os.chdir("Attempts")
    p=[]
    p.append("")
    k=1
    for subdir, dirs, files in os.walk('./'):
        for file in files:
          print(str(k)+"."+file)
          p.append(file)
          k=k+1
    n=int(input("Enter the quiz number to attempt:"))

    file=open(p[n],'r')
    for line in file:
        print(line)

    os.chdir("..")


def students(std):

    if not os.path.exists("Attempts"):
            os.makedirs("Attempts")
    os.chdir("Quiz")

    
    p=[]
    p.append("")
    k=1
    for subdir, dirs, files in os.walk('./'):
        for file in files:
          print(str(k)+"."+file)
          p.append(file)
          k=k+1
    n=int(input("Enter the quiz number to attempt:"))

    file=open(p[n],'r')
    name=p[n]
    del(p)
    p=[]
    score=0
    for line in file:
        p.append(line)

    length=len(p)
    k=1
    while (k<length):
        print("\n\nQuestion:"+p[k])
        k=k+1
        print("Option 1:"+p[k])
        k=k+1
        print("Option 2:"+p[k])
        k=k+1
        print("Option 3:"+p[k])
        k=k+1
        print("Option 4:"+p[k])
        k=k+2

        val=int(input("Select your option:"))
        

        print("debug:")
        print(str(val))
        print(p[k-1])
        if(str(val)==p[k-1]):
               score=score+1
    print("\nFinal score:"+str(score))

    os.chdir("..")
    os.chdir("Attempts")

        
    file=open(name,'a')
    file.write("\n")
    file.write(std+"    "+str(score))
    file.close()
    os.chdir("..")


    
print("Welcome to Exam Portal!!!")
print()
print()
i=5
while(i!=0):
    print("\n\n1.Teachers    2.Students     3.SignUp    4.Exit")
    choice=int(input("Select an option:"))

    if(choice==1):
        Login(1)
    elif(choice==2):
        Login(2)
    elif(choice==3):
        sign()
    elif(choice==4):
        print("\n\nThanks for using!!!\n")
        i=0
    else:
        print("\nSelect a valid choice!")


