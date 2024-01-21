
Taxable income analysis
==========================

# Exploratory and predictive analyses

This project aims at drawing insightful knowledge from income dataset on over 12,000 clients responding to a variety of questions about their work activities, gender, origins and so on. We'll be using  various statistical and machine learning techniques throughout this project to  get the most out of our data.

<img src="https://www.divorcingoptions.com/Blog/wp-content/uploads/2020/01/income.jpg" title="book" width="150" />



## Quick Start

### Setting up your work environment(⚠ tested on windows 11 pro)

You can download the project and run it locally on your computer by either pulling this repository or download it from this [link](https://codeload.github.com/atkamara/processdatabeez/zip/refs/heads/main)
. You will need to extract the zipped file on you working directory.

```bash
    $ git clone https://github.com/atkamara/processdatabeez.git
```    
You should get the following project structure displayed on your favorite IDE(I'm using sublime text by the way): 

![image.png](data:image/png;base64,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)

### Create a virtual environment :

This part is optional but highly recommended if you want to avoid version issues. Virtual environments are very useful tools, especially for data science as we collaborate a lot on a daily basis, they help you make sure you can reproduce your experiments. For the purpose of this tutorial, we will be using the **virtualenv** library available on **pypi**, you can easily download it using **pip** . Here are instructions( if you don't have it already): 

```bash
$  pip install virtualenv
```

When then installation process is done, you can now create a virtual environment called for instance **mlenv** by using the following command line: 
```bash
$ virtualenv -p python3 mlenv
```
***Note that we are using python3 in this project***
	
Now you can activate your virtual environment after that necessary files have been properly installed. Run this command and you should see between brackets (mlenv) at the begining of your shell prompt:
```bash
$ . mlenv/bin/activate
```
or
```bash
$ source mlenv/bin/activate
```
***⚠Do not miss the dot ( . ) at begining of the first command***

### Install python libraries

Now that you have activated your virtual environment, you install all the libraries you will to run this experiment. If you look closer at your working directory you will see at the root of the project a file named ***requirements.txt***. This file lists all python dependencies you'll need, you can install them all at once by using the following command:
```bash
$ pip install -r requirements.txt
```
Now you're set and ready to launch your notebook on localhost at port **8888** by default, run the following command:
```bash
$ jupyter notebook
```

# Getting hands on the notebook

The notebook **taxability.ipynb** will walk you through different kinds of analyses, it is divided into 6 main parts:
* **Setting-up workspace**
* **Loading data**
* **Getting insights from clients distributions**
* **Clustering clients**
* **Predicting non-taxability**
* **Error Analysis**

The two first are focused on preparer your data for analysis. It deals with missing values, preliminary data preparations and checks for irrelevant data to make focus on features that will help us understand more income taxability.
The third section **Getting insights from clients distributions** is a very large section that will analyze distributions in a time and geographic scope and focuses a little on pertinent qualitative variables.
The section on **Clustering clients**, uses various machine learning techniques to get insights from data. In terms of methodology, we found it more convinient on python to seperate data into qualitative and quantitative sets. Unfortunately, we are unaware of implementation of [FAMD](https://rdrr.io/cran/FactoMineR/man/FAMD.html) techniques which are available of R software. Thus you will find in this section:
*  Dimensionality reduction(Pincipal component analysis, stochastic neighbour embedding(tSNE)) for quantitative variables like wage, capital gains and losses or year
* Clustering using k-means, DBscan and hierarchical agglomerative classification(HAC)
* Clusters Labelling : we give names to our cluster based on more relevant variables


Finally, we dive into the most interesting part which is learning on data to predict the fact of not declaring taxable income. Since our sample data is unbalance, accuracy is less relevant than statistics like specificity. That's why we came up with an evaluation index that would favor specificity over accuracy just like this :
$$\gamma=\frac{1}{3}accuracy+\frac{2}{3}specificity$$

We have save all models in the m-**model/** directory with the pickle extension(**.pkl**) so that we will use them for prediction. 
Our final pipeline for both feature engineering and prediction looks like this:



# Want to run this project using a Docker image?
## Prerequisites

Follow the instructions on [Install Docker](https://docs.docker.com/engine/installation/)  in order to install it on your device or server. The docker desktop software is also very convinient to help you manage you system without having to use command lines.

Some general knowledge about `docker` infrastructure might be useful (that's an interesting topic on its own) but is not strictly *required* to just run this  notebook.




# FAQ



## Contributors