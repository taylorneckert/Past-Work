library (rvest)
library (stringr)
library(readr)

url <- "http://www.stat.cmu.edu/~cshalizi/statcomp/13/labs/10/rich-1.html"
page <- read_html(url)

# Variable Naming

person.rank <- html_nodes(page, ".rank")
person.rank <- html_text(person.rank)
head(person.rank)

person.name <- html_nodes(page, ".company")
person.name <- html_text(person.name)
person.name <- gsub("\n","",person.name)
person.name <- gsub("\t","",person.name)
head(person.name)

person.worth <- html_nodes(page, ".worth")
person.worth <- html_text(person.worth)
person.worth <- readr::parse_number(person.worth)
head(person.worth)

person.age <- html_nodes(page, ".worth+ td")
person.age <- html_text(person.age)
person.age <- as.numeric(person.age)
head(person.age)

person.residence <- html_nodes(page, "td:nth-child(5)")
person.residence <- html_text(person.residence)
person.residence <- sapply(strsplit(person.residence, split = ",", fixed = TRUE), function(x) (x[2]))
person.residence <- gsub(" ","",person.residence)
head(person.residence)

person.source <- html_nodes(page, "td:nth-child(6)")
person.source <- html_text(person.source)
head(person.source)

rich1 <- data.frame(person.rank, person.name, person.worth, person.age, person.residence, person.source)

url <- "http://www.stat.cmu.edu/~cshalizi/statcomp/13/labs/10/rich-2.html"
page <- read_html(url)

person.rank <- html_nodes(page, ".rank")
person.rank <- html_text(person.rank)
head(person.rank)

person.name <- html_nodes(page, ".company")
person.name <- html_text(person.name)
person.name <- gsub("\n","",person.name)
person.name <- gsub("\t","",person.name)
head(person.name)

person.worth <- html_nodes(page, ".worth")
person.worth <- html_text(person.worth)
person.worth <- readr::parse_number(person.worth)
head(person.worth)

person.age <- html_nodes(page, ".worth+ td")
person.age <- html_text(person.age)
person.age <- as.numeric(person.age)
head(person.age)

person.residence <- html_nodes(page, "td:nth-child(5)")
person.residence <- html_text(person.residence)
person.residence <- sapply(strsplit(person.residence, split = ",", fixed = TRUE), function(x) (x[2]))
person.residence <- gsub(" ","",person.residence)
head(person.residence)

person.source <- html_nodes(page, "td:nth-child(6)")
person.source <- html_text(person.source)
head(person.source)

rich2 <- data.frame(person.rank, person.name, person.worth, person.age, person.residence, person.source)

url <- "http://www.stat.cmu.edu/~cshalizi/statcomp/13/labs/10/rich-3.html"
page <- read_html(url)

person.rank <- html_nodes(page, ".rank")
person.rank <- html_text(person.rank)
head(person.rank)

person.name <- html_nodes(page, ".company")
person.name <- html_text(person.name)
person.name <- gsub("\n","",person.name)
person.name <- gsub("\t","",person.name)
head(person.name)

person.worth <- html_nodes(page, ".worth")
person.worth <- html_text(person.worth)
person.worth <- readr::parse_number(person.worth)
head(person.worth)

person.age <- html_nodes(page, ".worth+ td")
person.age <- html_text(person.age)
person.age <- as.numeric(person.age)
head(person.age)

person.residence <- html_nodes(page, "td:nth-child(5)")
person.residence <- html_text(person.residence)
person.residence <- sapply(strsplit(person.residence, split = ",", fixed = TRUE), function(x) (x[2]))
person.residence <- gsub(" ","",person.residence)
head(person.residence)

person.source <- html_nodes(page, "td:nth-child(6)")
person.source <- html_text(person.source)
head(person.source)

rich3 <- data.frame(person.rank, person.name, person.worth, person.age, person.residence, person.source)

url <- "http://www.stat.cmu.edu/~cshalizi/statcomp/13/labs/10/rich-4.html"
page <- read_html(url)

person.rank <- html_nodes(page, ".rank")
person.rank <- html_text(person.rank)
head(person.rank)

person.name <- html_nodes(page, ".company")
person.name <- html_text(person.name)
person.name <- gsub("\n","",person.name)
person.name <- gsub("\t","",person.name)
head(person.name)

person.worth <- html_nodes(page, ".worth")
person.worth <- html_text(person.worth)
person.worth <- readr::parse_number(person.worth)
head(person.worth)

person.age <- html_nodes(page, ".worth+ td")
person.age <- html_text(person.age)
person.age <- as.numeric(person.age)
head(person.age)

person.residence <- html_nodes(page, "td:nth-child(5)")
person.residence <- html_text(person.residence)
person.residence <- sapply(strsplit(person.residence, split = ",", fixed = TRUE), function(x) (x[2]))
person.residence <- gsub(" ","",person.residence)
head(person.residence)

person.source <- html_nodes(page, "td:nth-child(6)")
person.source <- html_text(person.source)
head(person.source)

rich4 <- data.frame(person.rank, person.name, person.worth, person.age, person.residence, person.source)

richpeople <- rbind(rich1, rich2, rich3, rich4)
