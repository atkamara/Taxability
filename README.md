


Taxable income analysis
==========================
<a href="https://ibb.co/hmpsJ30"><img src="https://i.ibb.co/LZ4SXVK/Income-Tax-for-Foreigners.jpg" alt="Income-Tax-for-Foreigners" border="0"></a>

# Exploratory and predictive experiments


This project aims to derive deep insights from an income dataset of over 12,000 customers answering various questions about their professional activities, gender, backgrounds, etc. We will use various statistical and machine learning techniques throughout this project to get the most out of our data.



## Quick Start

Follow the instructions bellow to run the experiments

You can also run the code online by using google's Colab service or binder, click on the links bellow to get access to those services 

* <a href="https://colab.research.google.com/drive/1z4xkXOPvoBFpTKPmZ3ekElxvQd3veJNm?usp=sharing" target="_parent"><img src="https://colab.research.google.com/assets/colab-badge.svg" alt="Open In Colab"/></a>
* [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/atkamara/processdatabeez/main?labpath=taxability.ipynb)

### Setting up your work environment(⚠ tested on windows 11 pro)

You can download the project and run it locally on your computer by either pulling this repository or downloading it directly from this [Download Link](https://codeload.github.com/atkamara/processdatabeez/zip/refs/heads/main) or github, you will only have to extract the zipped file on to your working directory.
```bash
    $ git clone https://github.com/atkamara/processdatabeez.git
```    
You should get the following project structure displayed on your favorite IDE(I'm using sublime text by the way): 

<a href="https://imgbb.com/"><img src="https://i.ibb.co/G7mrymY/Screenshot-2024-01-21-191908.png" alt="Screenshot-2024-01-21-191908" border="0"></a>

### Creating a virtual environment :

This part is optional but highly recommended if you want to avoid version conflicts. Virtual environments are very useful tools, especially for data science because we collaborate a lot on a daily basis and we share codes from time to time. Setting up a virtual environment will help ensure that you can replicate your experiments on any computer. For the purpose of this tutorial, we will use the **virtualenv** library available on **pypi** and which you can easily download using the **pip** command. Here are the instructions (if you don't have it installed already) to follow:

```bash
$  pip install virtualenv
```

When then installation process is done, you can now create a virtual environment that you can call for instance **mlenv** by using the following command line: 
```bash
$ virtualenv -p python3 mlenv
```
***Note that we are using python3 in this project***
	
Now you can activate your virtual environment after that the necessary files have been properly installed. Run this command and you should see between brackets (mlenv) at the begining of your shell prompt:

for windows: 

```bash
$ . mlenv/Scripts/activate
```
On windows 11, you may run into restriction issues. if so, you have to allow script execution by using the following command(at your own risk) ```$ Set-ExecutionPolicy Unrestricted``` you can set it back to restricted mode by using the following command ```$  Set-ExecutionPolicy restricted``` you can also check your execution policy by using the command ```$  Get-ExecutionPolicy``` 

Linux, Mac: 

```bash
$ source mlenv/bin/activate
```
or
```bash
$ . mlenv/bin/activate
```

***⚠ The dot ( . ) at the begining is an essential part of the code; it's the same as using the source command in bash shell***

Confirm that you are using mlenv

```bash
$ which python 
```


### Installing python libraries

Now that you have activated your virtual environment, you can install all the libraries you will need to run this experiment. If you look closer at your working directory, you will see at the root of the project a file named ***requirements.txt***. This file lists all python dependencies you'll need, you can install them all at once by using this single command:
```bash
$ pip install -r requirements.txt
```
**Note**: this may take a while depending on the speed of your internet connection(approximately 10 mins on standard wifi network)

Now you're set and ready to launch jupyter notebook service on your localhost at port **8888** by default, run the following command:
```bash
$ jupyter notebook
```
### Runtime 

It may take a while to run all cells( roughly 30 ~ 40 mins) on 16Gb Memory machine

The slowest parts of the code are undoubtedly:
* points linkage in HCA clustering
* Grid search for random forest
* TSNE on quantitative data

# Hands on the notebook

The notebook **taxability.ipynb** will walk you through different kinds of analyses, it is divided into 6 main parts:
* **Setting-up workspace**
* **Loading data**
* **Getting insights from clients distributions**
* **Clustering clients**
* **Predicting non-taxability**
* **Error Analysis**

The two first sections are focused on preparing your data for analysis. They deal with missing values, preliminary data preparations and check for irrelevant data and choose the right features that can provide us with useful information about income taxability.

The third section (**Getting insights from clients distributions**) is a very large one. It analyzes distributions on time and geographic scopes and lays emphasis on pertinent qualitative variables.

The section on (**Clustering clients**), uses various machine learning techniques to get insights from data. In terms of methodology, we found it more convenient on **Python** to seperate data into qualitative and quantitative sets. Currently, we are unfortunately unaware of implementations of algorithms in python that can deal with both qualitative and quantitative measures like [FAMD](https://rdrr.io/cran/FactoMineR/man/FAMD.html) which is only available on R software. Thus you will find in this section:

*  Dimensionality reduction(Pincipal component analysis, stochastic neighbour embedding(tSNE)) for quantitative variables like wage, capital gains and losses or year
* Clustering using k-means, DBscan on quantitative data : you can preview clusters online at this [visualization link](https://projector.tensorflow.org/?config=https://gist.githubusercontent.com/atkamara/af578844509b0402135f635734a1fbe9/raw/b5d93e71c4fcc25d41b3cb2b3d66410ea0d886a1/beez_config.json), you can enable cluster coloring by labels just as in picture below. On the right panel you can compute distances between clients to see how close they relate individually.
<a href="https://ibb.co/wybsB44"><img src="https://i.ibb.co/b1yJQXX/clust.png" alt="clust" border="0"></a><br /><br />

* Hierarchical agglomerative classification(HAC) on qualitative data using Jaccard index of dissimilarities
* Clusters Labelling : we give names to our clusters based on the most relevant variables


Finally, we dive into the most interesting part which is learning on data to predict the fact of not declaring taxable income. Since our sample data is unbalanced, accuracy is less relevant than statistical measures like specificity. That's why we came up with an evaluation strategy which favors specificity over accuracy defined as follows:
$$\gamma=\frac{1}{3}accuracy+\frac{2}{3}specificity$$

We have saved all our models in the **model/** directory with the pickle extension(**.pkl**) so that we will be able to reuse them at any time for predictions. 

Our final Decision Architecture for both feature engineering and prediction looks like this:

<a href="https://ibb.co/HGXRyPg"><img src="https://i.ibb.co/p4nNTKX/model.png" alt="model" border="0"></a>

In the final section on (**Error Analysis**) we challenge our model on new unseen data in order to have a good grasp of our **generalization error**

# Running this project using python image for Docker
## Prerequisites

Follow the instructions on [Install Docker](https://docs.docker.com/engine/installation/)  in order to install docker container management system on your device or server. Check out also [Docker Desktop](https://www.docker.com/products/docker-desktop/) software which is a very convenient tool that I highly recommend to help you manage your containers.

Once you have installed docker, you can now move to the project folder where the Dockerfile is located and run the following command to build your image:

```bash
$ docker build -t income_image .
```

This process may take a while since there is a lot of packages to install(for example last build took me \~20mins)

When the process is done, you can check if the image is correctly listed:
```bash
$ docker images
```

Now you can start a new container to run the experiment
```bash
$ docker run --name income_container -p 8888:8888 income_image
```

You can now visit the localhost link displayed on the terminal

**Note** you can add the ```-v```  to persist your data in a volume that your local device will have in common with the container

# FAQ



## Author
Abdourahmane T. KAMARA(Data Scientist)