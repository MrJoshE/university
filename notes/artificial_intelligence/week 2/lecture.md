# Week 2



## Training a Machine Learning Model

- Traning a machine learning model is a matter of closing the gap between the model's predictions and the observed training data labels.

  

## Linear Regression and Gradient Decent

#### Regression Problem

Predict real-value output

#### Example: Model trained to predict house prices

Training set of housing prices:

| Size in feet ^2 (x) | Price ($) in 1000's (y) |
| ------------------- | ----------------------- |
| 2104                | 460                     |
| 1416                | 232                     |
| 1534                | 315                     |
| 852                 | 178                     |
| ...                 | ...                     |

```
Notation:
n = number of training examples
x's = 'input' variables / features
y's = 'output' variables / target
```

![Screenshot 2022-02-13 at 19.27.48](lecture/Screenshot 2022-02-13 at 19.27.48.png)



#### Linear Regression and Gradient Decent

- The goal of linear regression is to fit a line to a set of points
- Let's suppose we want tot model this set of points with a line, we can use y=mx+b
- We need to **measure** how **good** a given line is
- We will define an **error** function (also called a **cost function** or **loss function**)
- This function will take in a (m,b) pair and return an error value based on how well the line fits our data.
  - To compute this error for a given line, we'll iterate through each (x,y) point in our data set and sum the square distances between! each points y value and the candidate lines y value (computed at mx +b).

![Screenshot 2022-02-13 at 19.31.51](lecture/Screenshot 2022-02-13 at 19.31.51.png)

```python
# y = mx + b
# m is the slope, b is the y-intercept

def computeErrorForLineGivenPoints(b,m,points):
  totalError = 0
  for i in range (0, len(points)): 
    totalError += (points[i].y - (m*[points[i].x + b])) ** 2
  return totalError / float(len(points))
  
```

- Lines that fit our data better will result in lower error values
- If we minimize this function, we will get the best line for our data
- Since our error function consists of two parameters (m and b) we can visualize it as a two-dimensional surface:

![Screenshot 2022-02-13 at 19.36.37](lecture/Screenshot 2022-02-13 at 19.36.37.png)



- Each point in this two-dimensional space represents a line (a model or hypothesis)
- The height of the function at each point is the error value for that line.
- Some lines yield smaller error values than others (i.e that fit our data better)
- When running the gradient decnet search, we will start from some location on this surface and move downhill to find the line with the lowest error.

## 