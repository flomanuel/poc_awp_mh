# Based on https://stackoverflow.com/questions/10526579/use-scikit-learn-to-classify-into-multiple-categories
import glob
import os

import numpy as np
from sklearn.pipeline import Pipeline
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.svm import LinearSVC
from sklearn.feature_extraction.text import TfidfTransformer
from sklearn.multiclass import OneVsRestClassifier
from sklearn.preprocessing import MultiLabelBinarizer, LabelBinarizer

def read_files_from_folder(folder_path):
    regulation_list = []
    file_contents = []
    for file_path in glob.glob(os.path.join(folder_path, '*')):
        if file_path.endswith('.html'):
            if "regulation" in file_path or "reach" in file_path:
                regulation_list.append(["Regulation"])
            else:
                regulation_list.append(["No Regulation"])
            with open(file_path, 'r', encoding='utf-8', errors='ignore') as file:
                file_contents.append(file.read())
    return [file_contents, regulation_list]


# Setup training data
trainingData = read_files_from_folder('./trainingData')
trainingDataArray = trainingData[0]
X_train = np.array(trainingDataArray)

mlb = MultiLabelBinarizer()
training_data_type = trainingData[1]
Y = mlb.fit_transform(training_data_type)

classifier = Pipeline([
    ('vectorizer', CountVectorizer()),
    ('tfidf', TfidfTransformer()),
    ('clf', OneVsRestClassifier(LinearSVC()))])
classifier.fit(X_train, Y)

# Setup test data
restDataArray = read_files_from_folder('./input')[0]
X_test = np.array(restDataArray)

predicted = classifier.predict(X_test)
all_labels = mlb.inverse_transform(predicted)

for item, labels in zip(training_data_type, all_labels):
    print('{0} => {1}'.format(item, ', '.join(labels)))
