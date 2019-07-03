# This program explores the use of files for
# data storage, statistical correlation, and
# matplotib for simple data visualization. It
# demonstrates Correlate Arcade Revenue and CS Doctorates
# of Arcade CSV file and shows a graph.

import math #imports the math functions
import matplotlib.pyplot as plt

def mean(alist): #defines the mean
    mean = sum(alist) / len(alist)
    return mean

def standardDev(alist): #defines the standard deviation
    theMean = mean(alist)
    
    sum = 0
    for item in alist: #sum the difference
        difference = item - theMean
        diffsq = difference ** 2
        sum = sum + diffsq
        
    sdev = math.sqrt(sum/(len(alist)-1))
    return sdev

def correlation(xlist, ylist): #defines variables int he graph
    xbar = mean(xlist)
    ybar = mean(ylist)
    xstd = standardDev(xlist)
    ystd = standardDev(ylist)
    num = 0.0
    for i in range(len(xlist)): #beginning of the for loop here 
        num = num + (xlist[i]-xbar) * (ylist[i]-ybar)
    corr = num / ((len(xlist)-1) * xstd * ystd) 
    return corr

# Start making edits here

def correlateArcadeDoctorates(filename): #gets the file
    arcadeFile = filename
    
    headerLine = arcadeFile.readline() # Read headers
    
    headerList = headerLine.split(',')
    arcadeIndex = headerList.index("Arcade Revenue") # Find Arcade Revenue column
    doctoratesIndex = headerList.index("CS Doctorates\n") #pull in CS Doctorates from file
    
    arcadeList = []
    doctoratesList = []
    for aLine in arcadeFile:
        rowData = aLine.split(',')
        arcadeList.append(float(rowData[arcadeIndex])) #data must be type float
        doctoratesList.append(float(rowData[doctoratesIndex]))
        
    arcadeFile.close() #remember to close the file when done
    
    corr = correlation(arcadeList, doctoratesList)
    
    plt.scatter(arcadeList, doctoratesList) #makes the final scatter plot
    plt.title("Arcade Revenue vs CS Doctorates\nr = %.5f" % (corr))
    plt.xlabel("Arcade Revenue")
    plt.ylabel("CS Doctorates")
    plt.show()
    
    return corr
    
# Test correlation function
filename = open("C:/Users/Brian/Documents/University of Louisville Classes/MSBA 605/Arcade-CSphd.csv", "r") #pulls specifically from this location
corr = correlateArcadeDoctorates(filename)