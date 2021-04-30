# CodeBook

## Source Data

The original DataSource can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Attributes

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Steps performed during datatransformation

1. Download ZIP file and extract datasets inside
2. Load Subject datasets and merge them into one single column
3. Same step 2 for Features dataset (xTest,xTrain) and Prediction dataset (yTest,yTrain)
4. Filtered desired features from features dataset (mean,std)
5. Merged everything into one single dataframe
6. Renamed columns for more explicit names
7. Reordered rows using Subject and Activity cols
8. Save Tidy Data into tidydata.txt
