#MSBA Purple Team: 
#Program2
#MSBA 605
#Purple Team
#Due: 9/4/18
#Description: This is an interactive application that returns a letter grade when the user inputs a score.
# We use a nested if/elif within a "for" statement to allow for multiple entries.

def main():
   n = int(input("Number of scores you wish to grade?")) #Here, we are getting a count of the number of grade letters to return.
   lettergrade="" #this needs to be outside of the loop so it is not continuously evaluated
   if n <= 0:   # If, for some reason, someone enters 0 as the number of scores to evaluate.
       print("Then why did you wake me up in the middle of my nap?")
   else:
       for n in range(1, n+1): #We use n+1 here because we want the range to be inclusive of the last value.
           score = float(input("Enter score to get lettergrade: ")) #We want this as a float rather than an integer to allow for decimal grades.
           if score >= 90.0:
               lettergrade = "A"
               print("A")
           elif score >= 80.0 or score >= 89.0:
               lettergrade = "B"
               print("B")
           elif score >= 70.0 or score >= 79.0:
               lettergrade = "C"
               print("C")
           elif score >= 60.0 or score >= 69.0:
               lettergrade = "D"
               print("D")
           elif score <= 59:
               lettergrade = "F"
               print("F")
       return lettergrade
main() #This actually runs the function above (titled "Main").