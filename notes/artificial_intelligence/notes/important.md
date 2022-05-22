## ConvNet



#### Conv layer 

A layer that applies a filter to an input image in order to create a feature map that summarizes the presence of those features in the input.

A **limitation of the feature map** output of convolutional layers is that they record the precise position of features in the input. **This means that small movements in position of featues = different feature map.**

A common way to deal with this problem is **down sampling - a lower resolution version of an input is created that contains important structural elements**. This can be achieved by chaning the striode of the convolution across the image.

Another way to deal with it is to use a pooling layer.

#### Pooling layer

The pooling layer operates upon each feature map (so after a convolutional layer). Pooling involves selecting a "pool operation" much like a filter to be applied to feature maps. The size of the pooling operation or filter is smaller than the size of the feature map.

For example, a pooling layer applied to a feature map of 6x6 (36 pixels) will result in an output pooled feature map of 3x3 (9 pixels)

Types of pooling operations:

- Average pooling: Calculate the average value for each patch on the feature map.

- Maximum pooling: Calculate the maximum value for each patch of the feature map.

  

## Genetic Algorithms + Optimization



#### Stimulated annelaing

Method for solving unconstrained and bound-constrained optimization problems. The method generates random models and uses the formula below to calculate whether it will accept the solution as the new current solution.
$$
P = e\frac{-(highcost -lowercost)}{temperature}
$$

- Begins with a random solution. It uses a variable representing the temperature which starts high and gradually gets lower
- If the new cost is lower, the new solution becomes the current solution. If the cost is higher the new solution can still become the current solution with a certain probability. This is an attempt to avoid the lcoal minimum problem.
- In some cases, its necessary to move to a worse solution before you can get to a better one.
- Its willing to accept a worse solution near the beginning of the process. As the process goes on, the algorithm becomes less and less likely to accept a worse solution until at the end it will only accept a better solution.

```python
def acceptance_probability(old_cost, new_cost, temperature):
	if new_cost < old_cost:
		return 1.0
	else 
		return math.exp((old_cost - new_cost) / temperature)
```

#### Genetic Algorithms

- Initially creates a set of random solutions (known as the population)
- At each step of the optimisation, the cost function for the entire population is calculated to get a ranked list of solutions
- After ranking, a new population known as the next generation is created.
- First, the top solutions int he current population are added to the new population as they are, this process is called *elitism*. The rest of the new population consists of completely new solutions that are created by modifying the best solutions. (selected through a selection algorithm).
- Continue the whole process for many iterations until no change is observed or some other condition is met (the maximum number of generations has been reached).



How do we get these modified solutions to build up the next generation?

Two ways:

- Mutation, which is usually a small, simple, random change to an existing solution. 
- Crossover or breeding. This mehtod involves taking two of the best solutions and combining them in someway. A simple way is to take a random number of elements from one solution and the rest of the elements from another solution.

Pros and cons of GA:

- Advantages

  - Very simple
  - Performs well on many different types of problems 
  - Works well on mixed (continuous and discrete), combinatorial problems. 
  - Attractive for some types of optimisation 
  - Less susceptible to getting 'stuck' at local optima than gradient search methods. 

- Disadvantages

  - Can be computationally expensive

    

## Unsupervised Learning

#### What is supervised learning

Superviesed learning methods: Techniques that use example inputs and outputs to learn how to make predictions.

Examples:

- nearest mean, KNN, nerual networks (supervised NNs), linear regression

#### What is unsupervised learning

Unsupervised learning: Not trained with examples or correct answers. Their purpose is to find structure within a set of data where no one piece of data is the answer.

#### Cluster Analysis

Cluster Analysis or clustering is the task of grouping a set of objects in such a way that objects in the same group / cluster are more similar to each other than those in other groups.

#### Hierachical Clustering

- Hierachical clustering builds up a hierarchy of groups by continuously merging two most similar groups.
- Each of these groups starts as a single item, e.g an individual blog or image. In each iteration this method calculates the distance between every pair of the groups, and the closest ones are merged together to form a new group. This is repeated until there is only one group.

![image-20220522193034798](C:\Users\je00452\AppData\Roaming\Typora\typora-user-images\image-20220522193034798.png)

#### K-Means clustering

- Algorithm will determine the size of the clusters based on the structure of the data
- K-means clustering begins with *k* randomly placed *centroids*, and assigns every item to the nearest one.
- After the assignment, the centroids are moved to the average location of all the ndoes assigned to them, and the assignment process repeats.
- The process repeats until the assignments stop changing.



## 