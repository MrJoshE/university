### Week 3



##### About 'aboutness'



###### Key Terms

- **Structured** Data: fixed sets – e.g. Uploaded = Today | This Week | This Month | Anytime
  - Fixed field with fixed set of selections with a known meaning. 

- **Semistructured** Data: fixed field, unique, open content, suitable for restrictions

- **Unstructured** Data: no readily discerned structure
  - Typically consider **unstructured text** here – language (written text) and other data may have some kind of structure, but this may not be overtly explicit or readily and reliably accessible.



###### Relating Key Terms

- For user information needs relating to unstructured text (rather than metadata specifically), users may implicitly, make queries like: 

  - Find *all* documents about X / with the topic X.
  - Find *all* documents with worc C near word D.
  - Find *all* documents containing the word / phrase P.

- User information needs (search intent) cannot be easily satisied in the above form. Therefore they are transformed into **keywords** that might be useful and have been used to index the items of interest.

- So **'aboutness'** is equated / translated to the words of the text.

  - Information Retrieval system (search engine) matches query keywords against keywords for the documents.

- Text keywords 'may' be extracted automatically.

  

##### Indexing and Indexes

###### Initial considerations

If **full-index** indexing, i.e using  ***ALL*** words in the text for matching a query, need an efficient data structure.

- We assume a **tokenization** step in the **Indexing Module** that breaks texts down to **tokens** by spaces and punctionation.
- Language detection module feeds relavent tokenization module
  - Have to know what is valid as a word
  - Also, in unicode, there are many 'space' characters



##### A Boolean Index



##### The Inverted Index and its use for ranking with TFIDF



##### Solution to the TFIDF