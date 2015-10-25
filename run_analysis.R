## run_analysis.R

library(plyr)
library(dplyr)
library(readr)
library(reshape2)

run_analysis <- function() {
    # Row widths for reading X_test.txt and X_train.txt
    row_widths <- rep(c(16), times = 561)
    
    # Loading FEATURES data
    df_features <- read.table("features.txt", sep=" ", row.names = NULL, as.is = TRUE)
    df_features <- rbind("activity", select(df_features, V2))
    df_features <- rbind("subjectID", df_features)
    
    # Loading ACTIVITIES data
    df_activities <- read.table("activity_labels.txt", sep=" ", row.names = NULL, as.is = TRUE)
    
    # Loading TEST data
    df_subj_test <- read.table("subject_test.txt", sep=" ", as.is = TRUE)
    df_act_test <- read.table("y_test.txt", sep=" ", as.is = TRUE)
    df_act_test$V1 <- as.factor(df_activities$V2[df_act_test$V1])
    df_data_test <- read_fwf("X_test.txt", fwf_widths(row_widths))
    
    # Loading TRAIN data
    df_subj_train <- read.table("subject_train.txt", sep=" ", as.is = TRUE)
    df_act_train <- read.table("y_train.txt", sep=" ", as.is = TRUE)
    df_act_train$V1 <- as.factor(df_activities$V2[df_act_train$V1])
    df_data_train <- read_fwf("X_train.txt", fwf_widths(row_widths))
    
    # Inserting columns with subjectIDs and activities to source datasets
    df_data_test <- cbind(df_subj_test, df_act_test, df_data_test)
    df_data_train <- cbind(df_subj_train, df_act_train, df_data_train)    

    # Setting names for variables
    names(df_data_test) <- df_features[,1]
    names(df_data_train) <- df_features[,1]
    
    # Merging test and train datasets to main dataset
    df_data <- rbind(df_data_test, df_data_train)
    
    # Masking required columns
    to_save <- grepl("activity", names(df_data)) | grepl("subjectID", names(df_data))
    to_save <- to_save | grepl("mean()", names(df_data), fixed = TRUE) | grepl("std()", names(df_data), fixed = TRUE)
    
    # Removing unnesessary data (columns)
    df_data <- df_data[, to_save]

    # Generating a new dataset for mean values
    melted_data <- melt(df_data, id.vars=c("subjectID", "activity"))
    ddplyed_data <- ddply(melted_data, c("subjectID", "activity", "variable"), summarise, mean = mean(value))
    
    # Writing final dataset to the file
    write.table(ddplyed_data, file = "final_data.txt", row.names = FALSE)
    #write.csv(ddplyed_data, file = "final_data.csv", row.names = FALSE)
    
}
