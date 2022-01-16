# Exam Revision



## Week 5



- Velocity is a quantity that has both magnitude (or size) and a direction.

- A quantity with maginitude without direction is a scalar.

- Two vectors are the same if the magnitude and direction of both is the same.

- Magnitude of a vector |a| = $\sqrt(x_1^2+y_1^2)$

- Dot product of 2 vectors: $|X|\cdot|Y| = |X| * |Y| * cos\theta$

  - Where $\theta$ is the angle between the vectors

- Vector space model

  ```
  Length = sqrt ( a2 + b2 + c2 …. )
  Length {3, 4} = 5;
  Length { 3, 4, 12 } = Length {5, 12} = 13
  Length { 3, 4, 12 } = sqrt ( 9 + 16 + 144 ) = 13
  Length {3, 4, 12, 84} = sqrt( 9 + 16 + 144 + 7056 ) = 85
  Length {13, 84} = sqrt( 169 + 7056 ) = 85
  ```

- Manhattan difference - absolute length of a line that would connect two vectors

  ```
  {3,4}, {5,12} = {2,8} = 2 + 8 = 10
  ```

- Eudlicean distance - distance of a line that would connect 2 vectors directly

  ```
  {3,4}, {5,12} = {2,8} = sqrt(68) = 8.24
  ```

- We can determine how close texts are using cosine: as cosine approaches 1, more similar.

  ```
  For 2 texts, A and B, "located" at x1 y1, x2 y2: dot product / product of length vectors.
  
  A · B = |A||B| cos θ
  
  cosine θ = A · B / |A||B| 
  
  cosine θ = (x1 * x2 + y1 * y2 ) / ( sqrt(x1^2 + y1^2) * sqrt(x2^2 + y2^2) )
  
  Example:
  
  Words = {xbox, 360, microsoft, p2p, cheat, lawsuit}
  
  Two text vectors:
  t_1 = {20,10,5,0,5,0}
  t_2 = {0,5,5,5,2,5}
  
  Dot product: 
  {20*0, 10*5, 5*5, 5*2, 0*5} = {0, 50, 25, 10, 0} = 50 + 25 + 10 = 85
  
  Vector length:
  |A| = sqrt( 20^2 + 10^2 + 5^2 + 5^2) = sqrt( 550 )
  |B| = sqrt( 5^2, 5^2, 5^2, 2^2, 5^2 ) = sqrt( 104 )
  
  Cosine sim = 85 / ( sqrt(550) * sqrt(104) ) = 0.355
  
  Not similar.
  ```

- Ways to measure performance of an IR system:

  - Precision: "How many of n documents retrieved are relavent" R = rel docs returned / total rel documents. 

  - **Precision** = tp / (tp + fp). Where TP = True Positive and FP = False Positive

  - Recal: "How many of the relavent documents where retrieved" rel docs returned / documents returned.

  - **Recal** = tp / (tp + fn) .Where TP = True Positive and FN = False Negative

    

## Week 6

- Evaluating IR systems using the f-measure

  - Traditional f = 2PR / (P + R) 
  - Generalised f = f - f0.5 / f(0.5) and f2 / f(2): f(b) = (b+1)PR / (bP + R)
  - When b = 1, P&R weighted equally, b < 1, weighted preference towards **Precision**, b > 1, weighted preference towards **Recal**

- Example

  ```
  Amanda and Alex each need to choose an information retrieval system.
  Amanda works for an intelligence agency, so getting all possible information
  about a topic is important for the users of her system. Alex works for a
  newspaper, so getting some relevant information quickly is more important
  for the journalists using his system.
  
  (Amanda wants recal and Alex wants precision)
  
  Given below are statistics for two information retrieval systems (Search4Facts
  and InfoULike) when they were used to retrieve documents from the same
  document collection in response to the same query: note, there were 100,000
  documents in the collection, of which 50 were relevant to the given
  query.
  
  Which system would you advise Amanda to choose and which would you
  advise Alex to choose? Your decisions should be based on precision and
  recall, and the traditional f-measure and the appropriately weighted
  alternative..
  
  								Relevant Retrieved 		Total Retrieved
  Search4Facts		12 										15
  InfoULike 			48 										295
  
  Precision = tp / (tp + fp)
  Recal = tp / (tp + fn)
  Traditional f-measure = f(b) = (b+1) PR / bP + R
  
  Search4Facts
  tp = 12
  tp + fp = 15
  fp = 3
  fn = (50 - 12) = 38
  
  Precision = 12 / (15) = 0.8 = 80%
  Recal = 12 / (12 + 38) = 0.24 = 24%
  f-measures:
  f(1) = (2*0.8*0.24) / ((1*0.8) + 0.24) = 0.369
  f(0.5) = (1.5*0.8*0.24) / ((0.5*0.8) + 0.24) = 0.45
  f(2) = (3*0.8*0.24) / ((2*0.8) + 0.24) = 0.31
  
  InfoULike
  tp = 48
  tp + fp = 295
  fp = 247
  fn = 2
  
  Precision = 48 / (295) = 0.162 = 16.2%
  Recal = 48 / (48 + 2) = 0.96 = 96%
  f(1) = (2*0.162*0.96) / ((1*0.162) + 0.96) = 0.278
  f(0.5) = (1.5*0.162*0.96) / ((0.5*0.162) + 0.96) = 0.225
  f(2) = (3*0.162*0.96) / ((2*0.162) + 0.96) = 0.364
  ```

- Recal is referred to as sensitivity or true positive rate and precision is the positive predictive value

- Contingency table

  ```
  More generally:
  - Consider medical diagnosis
  - 200 people evaluated, 100 with a certain condition and 100 without.
  - Using a certain test, 80 people are correctly diagnosed, but 25 people
  	without the condition are diagnosed to have it. 
  	What does this look like?
  	
  						Predict:Y		Predict:N
  	Actual:Y		TP=80				FN=20
  	Actual:N		FP=25				TN=75				= 200
  	
  - You’d be giving unnecessary treatment to 25 people (without the
  	condition), who could suffer side effects, and would have missed 20
  	people.
  
  - Precision (predictive value) = tp/(tp+fp) = 80 / (80+25) = 0.76
  - Recall (sensitivity) = tp/(tp+fn) = 80 / (80+20 ) = 0.80
  - Specificity = tn/(tn+fp) = 75 / (75+25) = 0.75
  ```

- Accuracy: tp+tn / (tp+tn+fp+fn)

- Describe how you think stemming, synonymy, and polysemy will each affect precision and recall?

  - Stemming will increase the recall and reduce precision. Recall increases as the number of words that will be indexed in a query increases because the number of word variations have reduced due to stemming, as well as synonymy, and polysemy meaning that words will be used in more than one context therefore can be returned for queries in the wrong context.
  - Precision will fall for the same reason as there will be more false positives as polysemy means there are words with differnet meanings therefore documents that are not relavent will be returned in a query as they contain a word that is being used in another context, therefore the document is being returned when it is not needed therefore reducing the precision of the search.



## Week 7

- Different Analyzers:

  - WhitespaceAnalyzer - find tokens
  - SimpleAnalyzer - as above, and all to lowercase
  - StopAnalyzer - as above, and remove stopwords
  - SnowballAnalyzer - for stemming

- TF-IDF: Term frequency-inverse document frequency (tf * idf)

  - Tf - use relative frequency  to adjust for document length effects

    'aardvarck' in 20 documents, out of 1,000; in D5 (twice) in 100 words; D16 (7 times) in 200 wordfs, then:

    - tf = 2/100 for document d5
    - tf = 7/200 for document d16
    - idf = log(1000,20)

- Hadoop

  - A distributed data management system, with built in redundancy

  - Data is split into blocks and programs applied to blocks - batch oriented

  - Data big, code small - so put computation near to data

  - Not a database and good for low-latency retrieval and update of a relatively small amount of data.

    ````
    										Traditional RDBMS 								MapReduce
    										
    Data size 					Gigabytes 												Petabytes
    
    Access							Interactive and batch 						Batch
    
    Updates				 			Read and write many times 				Write once, read many times
    
    Structure 					Static schema 										Dynamic schema
    
    Integrity 					High 															Low
    
    Scaling 						Nonlinear 												Linear
    ````

- Hadoop components
  - MapReduce: distributed (cluster) data processing model and executing environment
  - HDFS: distributed filesystem
    - A java built filesystem **distributed across a cluster where each cluster node offers some quantity of storage**.
    - Data replicated so that a node in the cluster can disappear without data loss. default typically = 3 nodes.
  
- MapReduce
  - **map**: <the:1,cat:1, sat:1, on:1, the:1, mat:1>
  - **shuffle** - collect the keys: <the:1, the:1, cat:1, sat:1, on:1, mat:1>
  - **reduce**: <the:2, cat:1, sat:1, on:1, mat:1>
  
- Hadoop summary:
  
  - data oriented clulster computing
  - you have to convert your problem to MapReduce (or to sets of maps and reduces)
  - put code on a node where data resides in (HDFS)
  - Produce some key-value pairs from the data (Map) - line up first tab character is the key, rest of the line beyond the tab character is the value.
  - Derive overall set of keys and bring together values associated with each key (Reduce).
  - If a processing node fails, run that part again.
  
- Page rank

  - Page rank = 0.15 + 0.85 * (some of the PageRank of every page that links to it - given as a proportion of the number of outbound links).

    ```
    PR(tx) = (1-d) + d(PR(t1)/C(t1) + ... + PR(tn)/C(tn))
    - tx is the page for whcih we wish to calculate PageRank
    - d is a damping factor, usually 0.85 (so 1-d = 0.15)
    - t1 ... tn are the pages that link to A
    - C is the number of outbound links
    ```

  - Can only calculate PR(tx) if know PR(t1) ... PR(tn)

    - $PR(A) = 0.15 + 0.85 * PR(B) / C(B)$
    - $PR(B) = 0.15 + 0.85 * PR(A) / C(A)$
    - Solution for large numbers of pages requires iterations, takes time and is beyond the current sope of the module.

  - Problems:

    - Dead end - no links out of a page, and likes to self just inflate the of self-importance.
    - Memory - this can be treated as a large matrix


  

## Week 8

- Seo

  - Addresses page content, and other factors - attempting to improve organic rating and e.g PageRank
  - Text containing the right words in the right places such as <h1> <h2> even <b> and <strong>, meaningful alts for images that correctly describe images being shown helps.

- Defeating PD (Plagerism Detection) systems

  - Test 1: Change Latin o,c,p,y,a,e to similar Cryillic and Greek letters.
  - Test 2: Change Latin i and v to similar Vav and Greek letters; 
  - Test 3:Test 1 plus change Latin A,B,C,E,H,I,J,K,M,N,O,P,T,Y to similar Greek and Cyrillic letters;

- Plagiarism Detection - techniques

  - Entire document duplicate detection: MD5 hash (129bits = 32 hex digits)

  - Near duplicates: break documents into sub documents and find matches, String match on subdocuments, MD5 has the subdocuments

  - Fingerprints: Select features with certain characteristics

    - pair of words or triples and perform string match

      ````
      Source: “the quick brown fox jumps over the lazy dog” → (“quick brown fox”)
      
      Suspicious: “the quicker brown fox jumps over the lazier dog”
      
      NO MATCH, unless …..
      (can verify extent of match as a second pass)
      ````

  -  Shingles:

    - Like exhaustive fingerprinting

    - Select a window size, step size

    - String match

    - Less brittle to minor variations

      ```
      Source: “the quick brown fox jumps over the lazy dog”
      
      Suspicious: “the quicker brown fox jumps over the lazier dog”
      
       - shingles (4, 1): (“the quick brown fox”, “quick brown fox jumps”,
      	“brown fox jumps over”, “fox jumps over the”, “jumps over the
      	lazier”, “over the lazier dog”).
      	
       - Success depends on match threshold. – simple match here is 2/6 
       	[Jaccard similarity – previously seen as stemming alt.]
      ```

  - Stitching looks at maximal extents of matches for a suspicious document:

    - Find (document, start, end) for all matching n-grams

    - Sort by document, and for a document, by start.

    - Where positions overlap or are close, merge one longer segment.

      ```
      [d50] : [start 27, end 40], [start 48, end 68] → [start 27, end 68].
      ```

- N-grams

  - Lucene - PhraseQuery: keep and use word position information but could store n-grams (q-grams in DBs)
    - Unigram, bigram, trigram, four-gram, five-gram
    - As characters, useful for DNA sequence matching 
    - Google offers n-gram data for language research

## Week 9

- Metadata has important notions of **conceptual domain** and **value domain**

  - Conceptual domain has **concepts** and value domain has **values**

- Why do we need metadata standards?

  - Short answer - interoperability 
  - Long answer - interoperability between people and services and systems, including the automatic composition of computer programs for undertaking novel tasks.
  - Standards often have a **value domain** only; growing use of the **conceptual domain** to support interoperability.
  - Databases address **value domain** in relation to **data element**

- Problems with metadata

  - Consistent usage: how to represent a person’s name
  - Context-sensitive: date (of …?)
  - Time variant: Czechslovakia? Serbia and/or Montenegro? Allowable values for US President.
  - Culturally and linguistically-variant: Miss/Mrs/Ms; madame or mademoiselle?

- Databases

  - Guidlines for a good database design: small, efficient, minimal redundancy, easy to maintain
  - Formal concepts for good database design: functional dependencies
  - Normalisation: 1NF, 2NF, 3NF, higher NF

  ```
  Informal terms 														Formal terms
  (for users)																(for specialists/theorists)
  
  Table                           					Relation
  
  Column                          					Attribute (Field)
  
  All possible column values                Domain
  
  Row                           						Tuple (Record)
  
  Number of columns                         Degree of a relation
  
  Number of rows                          	Cardinality of a relation instance
  
  Table definition                          Relation schema
  
  Populated table                           Relation instance
  ```

- Recal ISO 1179
  - A **data element** results when associating a representation to a **data element** concept (DEC)
  - Value domains are sets of permissible values for data elements
  - Database / files are composed of records, segments, tuples etc. which are in turn composed of **data elements**

- COM1025 reminder

  - A primary key is an attribute (or combination of attributes) that uniquely identifies a tuple (record) in a relation, and we can use underlining to indicate: 
    - e.g. EMPLOYEE(Emp_ID,Name,Dept,Salary)
  - A foreign key (FK) is used as a reference to a primary key (PK) of another relation. 
  - A composite key is a key consisting of more than one attribute. 
  - A primary key can be a composite key, as can a foreign key
  - A foreign key can be part of a composite primary key

  ```
  Four relations:
  
  CUSTOMER(Customer_ID, Customer_Name, Address, City, State, Zip)
  ORDER(Order_ID, Order_Date, Customer_ID*)
  ORDER_LINE(Order_ID*, Product_ID*, Quantity)
  PRODUCT(Product_ID, Product_Description, Product_Finish,Standard_Price, On_Hand)
  
  Customer_ID is a foreign key in the ORDER relation that implements a 1:N relationship between customer and order.
  
  The primary key for ORDER_LINE is a composite primary key consisting of the attributes Order_ID and Product_ID that uniquely identifies the order line
  
  Order_ID and Product_ID in ORDER_LINE are, individually, foreign keys for an M:N relationship (order and product).
  ```

- Redundancy and update anomalies
  - Avoid problems by:
    - Storing each 'fact' within the database only once.
    - Putting data into a form that conforms to the relational principles.
    - Putting the data into a form that is more able to accurately accommodate change.
    - Avoiding **update anomalies**
    - facilitating enforcement of data constraints.

## Week 10
