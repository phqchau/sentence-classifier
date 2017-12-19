# sentence-classifier
<b>A classifier that finds the problem sentence(s) in scientific abstracts</b>

With references to the material of the <a href="https://www.coursera.org/learn/machine-learning">Machine Learning course</a> taught by Andrew Ng on Coursera, especially the programming material of Week 7: Support Vector Machines.

The labeled training data used is found in the data folder. Obtained from the <a href="https://archive.ics.uci.edu/ml/datasets/Sentence+Classification">UC Irvine Machine Learning Repository</a>.

The data is used to train a linear SVM to identify problem sentences (purpose sentences) in a scientific abstract.

abstractsample1.txt is a sample unlabeled file.

<b>HOW TO USE</b>

<i>Step 1:</i> Install and run <a
href="http://wiki.octave.org/Octave_for_Microsoft_Windows">Octave</a>.

<i>Step 2:</i> Run the command <b>trainSvm('data/\*.txt')</b> if you want to train the SVM yourself. This could take up to 5 minutes to finish. Otherwise the extracted data already exist in senTrain.mat and will be loaded to the SVM in the next step.

<i>Step 3:</i> Run <b>sentenceClassifier</b> and the program will analyze the abstractsample1.txt file, outputting the result to the screen. If you would like to use your own file, simply put it in the directory and change line 35 in sentenceClassifier.m to the right file name.
