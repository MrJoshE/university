# Information Retrieval 2020-2021 Paper



https://www.coursehero.com/file/78213919/COM2034-main2020-21canswer-templatepdf/



### 1. This question, for 50 marks, is about keyword-based retrieval systems:



a) Briefly explain, using a sketch, how a depth-first search would work with a webpage containing links to 5 pages, each of which contains links to 5 further pages.



[Link to depth first image](depth first.png) - **an example of depth first not the answer**

b) Briefly explain a problem that exists for depth-first search with very large numbers of webpages.



A problem with depth-first search is that it can take a very long time to find all the webpages. A solution is to add a limit to the depth of the search.

c) A frequency analysis of 265,339 tokens results in 8855 types. Based on Zipf’s law, how many types would be estimated to remain when those with frequencies of 12 and below are removed? *State answers to the nearest whole number.*



d) A frequency analysis of 265,339 tokens results in 8855 types. Using Heaps law with b=0.4, and assuming the growth rate remains constant, how many types would be expected at 1,200,000 tokens? *State answers to the nearest whole number.*



e) The following code snippet is a partial implementation of the Porter stemmer.

```
if (word.ends("s")) {
  if (word.ends("sses"))
      word.removeEnd("es");
  else if (word.ends("ies"))
    word.removeEnd("es");
  else if (word.charAt(word.length()-2) != 's')
      word.removeEnd("s");
}
if ((word.ends("ed") || word.ends("ing")) {
  if(word.ends("ed"))
  	word.removeEnd("ed");
  if(word.ends("ing"))
  	word.removeEnd("ing");
	if (word.ends("at") || word.ends("bl") || word.ends("iz")) 
		word.addEnd("e");
}
```

Show clearly what is *added* or *removed* at each step by this code for the following *six* words: mass, patting, disambiguated, ponies, berating, meetings.

mass: 

Does word end with 's': yes, does word end in 'sses': no, does word end in 'ies': no, is the second last letter not 's': no. Therefore final word is **mass**

patting: patt

disambiguated: disambigue

ponies: poni

berating: bere

meetings: meetings



f) The following descriptions relate to images, and can be considered as the complete documents for the purpose of the following questions:



- **Doc 1** – “Fish leaping through the waves, paddle steamer and rowing boat beside the pier, with warehouse, boathouse, hotel, and cottage on quay; snowcapped mountain summit behind.”

- **Doc 2** – “Holidaymakers on sandy beach, with people in pleasure boats and fishing boats near the shore and in the bay; buildings, pavilion and amusement arcade above opposite sea wall.”

- **Doc 3** – “Pebble beach with people and beached fishing boats; pier and people with wave breaking over; promenade, hotels, cottages and painted houses behind.”



i) Assuming case-folding and removal of punctuation, and that all stopwords are removed *and* remaining words are stemmed, draw a *binary term- document incidence matrix* which shows 4 ‘keywords’ where each occurs in no more than 2 of these documents.



ii) Assuming case-folding and removal of punctuation, and with all stopwords removed *and* remaining words stemmed, draw a diagram for an inverted index, which **must** be comparable to that of Belew (2000), fully labelled, for *three* ‘keywords’. These ‘keywords’ must occur in *two* or more of the descriptions.



iii) Use the inverted index from (ii) above to show the steps involved with calculating TF-IDF values using *log**10* and *relative frequency*, and using sum of the TF-IDF values to rank documents for a query that comprises *two* keywords. State, also, the ranking that this produces.

One of keywords you use must occur in *two* of the documents but not the third; the other keyword must occur in the third document *and* in one of the two documents containing the first keyword (use further keywords from the above documents if necessary).

