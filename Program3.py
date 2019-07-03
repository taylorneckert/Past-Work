#MSBA Purple Team
#Program3
#MSBA 605
#Due: 9/11/18
#Description: We seek to pass the list of student grades to the function described below.
# This should will tabulate and display a bar chart summarizing
# the number students earning each grade (A, B, C, D, F).

def calcGrade(score): # Calculate letter grade given score
    if (score >= 90):
        grade = "A"
    elif (score >= 80):
        grade = "B"
    elif (score >= 70):
        grade = "C"
    elif (score >= 60):
        grade = "D"
    else:
        grade = "F"
    
    return grade

# Test grade function
numScores = int(input("How many test scores to grade? "))
gradebook = { } #Initializing the dictionary as an empty set.

for i in range(numScores):
    name = str(input("What is the student's name?")) # Take in the student's name.
    score = float(input("Score " + str(i+1) + ": "))
    grade = calcGrade(score)
    gradebook.update({name:grade}) # This is the item that actually adds a name and an associated grade to my gradebook.

print("Gradebook Results (sorted alphabetically):") #This is purely cosmetic, but it gives information about how results will be returned.

for key in sorted(gradebook.keys()) :   # This 'for' loop sorts my gradebook.
    print(key , " :: " , gradebook[key]) # This prints the key, as well as the associated value with that key.


# Part 1: Tablulate count of each letter grade

lettertot = {"A":0,"B":0,"C":0,"D":0,"F":0} # This initializes the list of letter grades and totals. 

for key in gradebook:
    if gradebook[key] is "A":     # If the letter grade is an A...
         lettertot["A"] += 1         # Then Add 1 to the value for A
    elif gradebook[key] is "B":
        lettertot["B"] += 1
    elif gradebook[key] is "C":
        lettertot["C"] += 1
    elif gradebook[key] is "D":
        lettertot["D"] += 1
    elif gradebook[key] is "F":
        lettertot["F"] += 1

print("The array of total grades is",lettertot)

# Part 2: Create chart

import matplotlib.pyplot as plt 
    #Above, We are importing matplotlib as a function we'll call plt later.

labels = lettertot.keys() 
    # I am setting our labels for the "x axis" as the lettergrades from our above established dictionary.
heights = lettertot.values()
    # I am setting the frequency/heights for our values as the values from our dictionary above.
plt.bar(labels, heights)
plt.title("Grade distribution") #Titling our plot.
plt.xlabel("Lettergrades")
plt.ylabel("Frequency")
plt.show()
