# Week 5 - Convolutional Neural Networks



CNNs power in object recognition, object detection, image search services, self-driving cards, automatic video classification systems, and more.

They are not restricted to visual perceptron:

- Voice / speech recognition
- Natural language processing



## CNN Architecture



![Screenshot 2022-05-21 at 10.25.08](lecture/Screenshot 2022-05-21 at 10.25.08.png)

- A conv net arranges its neurons in three dimensions (w,h,d).
- Red input layer holds the image, so its width and height will be the dimensions of the image and the depth would be the number of channels (RGB = 3, Greyscale =1)
- A conv net is made up of layers. Each transform

### Types of layers



#### Convolution Layer

Suppose you have an image 32 x 32 x 3 and a filter 5 x 5 x 3 (w)



### Learned weights

Example 1.

Input volume has [32x32x3], filter size [5x5], then each neuron in the COnv Layer will habe weights to a [5x5x3] region in the input volume, for a total 5\*5*3 = 75 weights plus 1 bias. Notice that the extent of the connectivity along the depth axis must be 3, since this is the depth of the input volume.

Example 2.

Input volume had size of [16x16x20], filter size 3x3, every neuron in the Conv layer would now have a total of 3 * 3 * 20 = 180 connections to the input volume (plus 1 bias). Notice that, again, the connectivity is local in space (e.g 3x3), but full along the input depth (20).



### Parameter sharing

No parameter sharing:

55 * 55* 96 = 290,400 neurons in the first conv layer and each has 11 * 11 * 3 = 363 weights and 1 bias = 290400 * 364 = 105,705, 600 parameters

Parameter sharing:

- Only 96 unique set of weights (one for each depth slice), for a total of 96 * 11* 11 * 3 = 34,848 unique weights, or 34,944 parameters (+ 96 biases)
- All 55*55 neurons in each depth slice will now be using the same parameter.

### Hyperparameters control the size of the output volume

- depth (number of filters)
- size of filters
- stride 
- zero-padding

### Pooling layer

- We should periodically insert a Pooling layer in-between successive Conv layers

  - To progressively reduce the spatial size of the representation
  - To reduce the amount of parameters of computation
  - Control overfitting

- Operates independently on every depth slice of the input and resizes it

- Common filter of 2x2 applied with a stride of 2 downamples every depth slice int he input by 2 along both width and height, discarding 75% of the actications.

  
