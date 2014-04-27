run_analysis Code Book
========================================================

The run_analysis function first reads the various text files into data frames:
* test_set - test cases main data set
* test_cat - test cases activity description data
* train_set - train cases main data set
* traincat - train cases activity description data
* activity - text descriptions of the activites performed
* features - text descriptions for column heading in main data set

The (test/train)_cat and (test/train)_set are merged to provide an anchor column.
The two datasets are then merged to form the complete dataset.

Columns are removed that do not contain mean() or std() and then the columns are averaged, seperated by activity.

The column headings and activity descriptions are then replaced with test descriptions, as described in activity and features