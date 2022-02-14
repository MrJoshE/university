# Exam revision



## Crawler Module



#### Depth First

Will traverse down from a starting node, to a child node then to its child node 

[Link to depth first image](depth first.png)





#### Bredth first

[Link to depth first image](bredth first.png)



## Zipf's Law

- Rank of a word, i.e its position in a list ordered according to its frequency, is inversly proportional to its frequency
- Rand multiplied by frequency produces a constant that is one tenth of the number of tokens.
- So rank multiplied by relative frequency produces a constant approximate to 0.1
- $y=kx^c$ where y is frequency and x is rank, 
  - c ~= -1 where c ~= frequency = k / rank
  - k ~= 0.1 * T
- Example
- Test with data: com2034texts, "technology" has rank 19 and frequency 43.
- frequency * rank = 19 * 43 = 817
- 0.1 * 817 = 711 ~= k