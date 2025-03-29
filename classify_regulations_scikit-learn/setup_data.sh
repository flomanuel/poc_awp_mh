#!/bin/bash

echo "Cleaning up directories..."
rm -rf ./trainingData/*
rm -rf ./input/*

echo "Downloading regulations as training data..."

curl https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A02006R1907-20241218 > ./trainingData/reach1.html
curl https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A02006R1907-20230528 > ./trainingData/reach2.html
curl https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A02006R1907-20211001 > ./trainingData/reach3.html
curl https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A02006R1907-20191030 > ./trainingData/reach4.html
curl https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A02006R1907-20161011 > ./trainingData/reach5.html
curl https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A02006R1907-20150101 > ./trainingData/reach6.html
curl https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A02006R1907-20110306 > ./trainingData/reach7.html
curl "https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32014R0422&qid=1743269299985" > ./trainingData/random-regulation1.html
curl "https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32014R0423&qid=1743269299985" > ./trainingData/random-regulation2.html
curl "https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32014R0539&qid=1743269299985" > ./trainingData/random-regulation3.html
curl "https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32015R2120&qid=1743269299985" > ./trainingData/random-regulation4.html
curl "https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32002D0620&qid=1743269299985" > ./trainingData/random-regulation5.html
curl "https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32015R0756&qid=1743269299985" > ./trainingData/random-regulation6.html
curl "https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32012R1217&qid=1743269299985" > ./trainingData/random-regulation7.html
curl "https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32015D0642&qid=1743269299985" > ./trainingData/random-regulation8.html
curl "https://www.google.com/" > ./trainingData/random-webpage1.html
curl "https://www.tagesschau.de/" > ./trainingData/random-webpage2.html
curl "https://law-tracker.europa.eu/homepage?lang=en" > ./trainingData/random-webpage3.html
curl "https://eur-lex.europa.eu/homepage.html" > ./trainingData/random-webpage4.html
curl "https://european-union.europa.eu/index_de" > ./trainingData/random-webpage5.html
curl "https://www.consilium.europa.eu/en/home/" > ./trainingData/random-webpage6.html
curl "https://www.eesc.europa.eu/en" > ./trainingData/random-webpage7.html
curl "https://www.edpb.europa.eu/edpb_en" > ./trainingData/random-webpage8.html
curl "https://european-union.europa.eu/contact-eu/call-us_en" > ./trainingData/random-webpage9.html
curl "https://european-union.europa.eu/contact-eu/meet-us_en" > ./trainingData/random-webpage10.html
curl "https://european-union.europa.eu/legal-notice_en" > ./trainingData/random-webpage11.html
curl "https://european-union.europa.eu/privacy-policy-european-union-website_en" > ./trainingData/random-webpage12.html
curl "https://eur-lex.europa.eu/content/legal-notice/legal-notice.html#5.%20Cookies%20notice" > ./trainingData/random-webpage13.html
curl "https://eur-lex.europa.eu/content/help.html" > ./trainingData/random-webpage14.html
curl "https://eur-lex.europa.eu/contact.html" > ./trainingData/random-webpage15.html
curl "https://eur-lex.europa.eu/content/welcome/about.html" > ./trainingData/random-webpage16.html
curl "https://ted.europa.eu/en/" > ./trainingData/random-webpage17.html
curl "https://data.europa.eu/en" > ./trainingData/random-webpage18.html
curl "https://op.europa.eu/en/web/who-is-who" > ./trainingData/random-webpage19.html
curl "https://op.europa.eu/en/web/eu-law-in-force" > ./trainingData/random-webpage20.html
curl "https://eur-lex.europa.eu/content/news/eu-measures-solidarity-ukraine.html" > ./trainingData/random-webpage21.html

echo "Downloading websites to sort..."
# todo implement crawler

curl "https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32015R0753&qid=1743269612334"  > ./input/random-regulation1.html
curl "https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32024R2803&qid=1743269612334"> ./input/random-regulation2.html
curl "https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32015R0756&qid=1743269612334"> ./input/random-regulation3.html
curl "https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32012R1217&qid=1743269612334"> ./input/random-regulation4.html
curl "https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A31986R0964&qid=1743269612334"> ./input/random-regulation5.html
curl "https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32011R1229&qid=1743269612334"> ./input/random-regulation6.html
curl "https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A31999R1608&qid=1743269612334"> ./input/random-regulation7.html
curl "https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32011R1230&qid=1743269612334"> ./input/random-regulation8.html
curl "https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32013R0517&qid=1743269612334"> ./input/random-regulation9.html
curl "https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32001R1840&qid=1743269612334"> ./input/random-regulation10.html
curl "https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A31970R2555&qid=1743269612334"> ./input/random-regulation11.html
curl "https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A31991R0150&qid=1743269612334"> ./input/random-regulation12.html
curl "https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A31978R0914&qid=1743269612334"> ./input/random-regulation13.html

curl "https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A02006R1907-20071123"> ./input/reach1.html
curl "https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A02006R1907-20090220"> ./input/reach2.html
curl "https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A02006R1907-20101201"> ./input/reach3.html
curl "https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A02006R1907-20120605"> ./input/reach4.html
curl "https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A02006R1907-20130701"> ./input/reach5.html

curl "https://eur-lex.europa.eu/homepage.html" > ./input/random-webpage1.html
curl "https://eur-lex.europa.eu/collection/eu-law/consleg.html" > ./input/random-webpage2.html
curl "https://eur-lex.europa.eu/collection/legislative-procedures.html" > ./input/random-webpage3.html
curl "https://eur-lex.europa.eu/content/legal-notice/legal-notice.html#3.%20protection" > ./input/random-webpage4.html
curl "https://eur-lex.europa.eu/content/links/links.html" > ./input/random-webpage5.html
curl "https://eur-lex.europa.eu/collection/n-law/mne.html" > ./input/random-webpage6.html
curl "https://eur-lex.europa.eu/collection/eu-law/eu-case-law.html" > ./input/random-webpage7.html
curl "https://eur-lex.europa.eu/statistics/statistics.html" > ./input/random-webpage8.html
