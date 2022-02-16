# Summary



## Linear Regression

#### What

An attempt to model the relationship between two variables by fitting a linear equation to observed data.

#### What for

Situations when there is a a clear input and output of results for example calculating house prices ... where the input is the size of the house, and the output is the price

#### Why

We can use the model to predict the outcome of events by using the linear equation provided by the trained model.

#### How

To measure how good a given line is we can use an error function to determine this

```python
# y = mx + b
# m is the slope, b is the y-intercept

def compute_error_for_line_given_points(b,m,points):
  totalError = 0
  for i in range (0, len(points)): 
    totalError += (points[i].y - (m*[points[i].x + b])) ** 2
  return totalError / float(len(points))
```



## What is Gradient Decent

#### What

An algorithm that minimizes functions

#### Why

We can use this with linear regression by minimising the error functions output which would give us the best equation for the line for the given scenario allowing us to predict with higher accuracy.

#### How

```python
def step_gradient(b_current, m_current, points, learning_rate):
  b_gradient = 0
  m_gradient = 0
  N = float(len(points))
  for i in range(0,N):
    b_gradient += -(2/N) * (points[i].y - ((m_current*points[i].x) + b_current)) 
    m_gradient += -(2/N) * points[i].x * (points[i].y - ((m_current * points[i].x) +b_current))
  new_b = b_current - (learning_rate * b_gradient)
  new_m = m_current - (learningRate * m_gradient)
  return [new_b, new_m]
```

