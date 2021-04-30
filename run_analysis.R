#pwd <- getwd()
#url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(url, file.path(pwd, "data.zip"))
#unzip(zipfile = "data.zip")

# Load Subject Datasets and Merge them into one single column
subjTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
subjTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
subj <- rbind(subjTest, subjTrain)
names(subj) <- c("Subject")

# Load Features Datasets and Merge them into one single column
xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
x <- rbind(xTest, xTrain)
fNames <- read.table("UCI HAR Dataset/features.txt", head=FALSE)
names(x) <- fNames$V2
# Filters Desired Features (mean/std)
filteredFeatures <- fNames$V2[grep('-(mean|std)\\(\\)', fNames$V2)]
x <- subset(x, select=filteredFeatures)

# Load Prediction Datasets and Merge them into one single column
yTest <- read.table("UCI HAR Dataset/test/y_test.txt")
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
y <- rbind(yTest, yTrain)
names(y) <- c("Activity")

# Merge all the columns in one single dataframe
dataset <- cbind(subj, x, y)

# Expand Names of the Columns with descriptive names
names(dataset) <- gsub("Gyro", "Gyroscope", names(dataset))
names(dataset) <- gsub("^t", "Time", names(dataset))
names(dataset) <- gsub("Acc", "Accelerometer", names(dataset))
names(dataset) <- gsub("^f", "Frequency", names(dataset))
names(dataset) <- gsub("Mag", "Magnitude", names(dataset))

dataset

tidy <- aggregate(.~Subject + Activity, dataset, mean)
tidy <- tidy[order(tidy$Subject, tidy$Activity), ]
write.table(tidy, file = "tidydata.txt", row.name = FALSE)