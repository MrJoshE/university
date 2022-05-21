# Week 3 - Introduction to Neural Networks





## Characteristics of Neural Networks



- Biological inspiration
- Brain vs artificial neural network
- The perceptron
- Multilayer neural networks
- Supervised and unsupervised neural networks



## Articial Neural Networks



- An NN consists of a number of very simple processors, also called neurons.
- The neurons are connected by weighted links passing signals from one neuron to another.
- The output signal is transmitted throught the neuron's outgoing connection. The outgoing connection splits into a number of branches that transmit the same signal.
- The outgoing branches terminate at the incoming connections of other neurons in the network.

![Screenshot 2022-02-22 at 17.58.22](lecture/Screenshot 2022-02-22 at 17.58.22.png)

![Screenshot 2022-02-22 at 18.11.47](lecture/Screenshot 2022-02-22 at 18.11.47.png)





## Perception Training Algorithm



Step 1: **Initialization** (assign weights, threshold with random values)

Step 2: **Activation**

Apply input and desired output, and compute the actual output at iteration as p.

![Screenshot 2022-02-22 at 18.13.18](lecture/Screenshot 2022-02-22 at 18.13.18.png)

Step 3: Update the weights of the perceptron

![Screenshot 2022-02-22 at 18.13.53](lecture/Screenshot 2022-02-22 at 18.13.53.png)

Step 4: Increase **p** by 1, go back to step 2 and repeat the process until convergence.





## Supervised Learning - Back-propagation Neural Network



- A training set of inputs is presented to the network
- Feed forward to compute its output, and if there is an error, or a difference between actuakl and desired output patterns - the weights are adjusted to reduce this error.
- Can learn to solve linearly inseparable problems.



## The Multilayer Perceptron and Backpropagation

- For each training instance, the backpropagation algorithm first makes a prediction (forward pass) and measures the error, then goes through each layer in reverse to measure the error contribution from each connection (reverse pass), and finally tweaks the connection weights to reduce the error (Gradient Descent step).



## Feed Forward Network

 ![Screenshot 2022-02-22 at 18.18.56](lecture/Screenshot 2022-02-22 at 18.18.56.png)

![Screenshot 2022-02-22 at 18.19.40](lecture/Screenshot 2022-02-22 at 18.19.40.png)

![Screenshot 2022-02-22 at 18.19.57](lecture/Screenshot 2022-02-22 at 18.19.57.png)

![Screenshot 2022-02-22 at 18.20.09](lecture/Screenshot 2022-02-22 at 18.20.09.png)



## Hyperparameters and Training

- **Hyperparameters**: Number of layers, Number of neurons, learning rate
- **Training**:
  - Stop if the error fails to improve (has reach a minimum)
  - Stop if the rate of improvement drops below a certain level
  - Stop if the error reaches an acceptable level
  - Stop when a certain number epochs have passed
  - Regularization strategies 
  - Cross validation



## Activation Functions



#### **Why do we need activation functions? **

- They transform neuron's input into output.
- If you chain several linear transformations, all you get is a linear transformation.



#### **Commonly used activation functions**

![Screenshot 2022-02-22 at 18.24.28](lecture/Screenshot 2022-02-22 at 18.24.28.png)



## Regression MLPs and Classification MLPs

![Screenshot 2022-02-22 at 18.28.59](lecture/Screenshot 2022-02-22 at 18.28.59.png)

![Screenshot 2022-02-22 at 18.29.32](lecture/Screenshot 2022-02-22 at 18.29.32.png)