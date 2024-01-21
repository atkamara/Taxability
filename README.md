
Taxable income analysis
==========================

# Exploratory and predictive analyses

This project aims at drawing insightful knowledge from income dataset on over 12,000 clients responding to a variety of questions about their work activities, gender, origins and so on. We'll be using  various statistical and machine learning techniques throughout this project to  get the most out of our data.

<img src="https://www.divorcingoptions.com/Blog/wp-content/uploads/2020/01/income.jpg" title="book" width="150" />



## Quick Start

### Setting up your work environment(⚠ tested on windows 11 pro)

You can download the project and run it locally on your computer by either pulling this repository or downloading it directly from this [link](https://codeload.github.com/atkamara/processdatabeez/zip/refs/heads/main) or github, you will only have to extract the zipped file on you working directory.
```bash
    $ git clone https://github.com/atkamara/processdatabeez.git
```    
You should get the following project structure displayed on your favorite IDE(I'm using sublime text by the way): 

<a href="https://imgbb.com/"><img src="https://i.ibb.co/G7mrymY/Screenshot-2024-01-21-191908.png" alt="Screenshot-2024-01-21-191908" border="0"></a>

### Creating a virtual environment :

This part is optional but highly recommended if you want to avoid version issues. Virtual environments are very useful tools, especially for data science as we collaborate a lot on a daily basis and we share codes from time to time. Setting up a virtual environment will help you make sure you can reproduce your experiments on any computer. For the purpose of this tutorial, we will be using the **virtualenv** library available on **pypi** and that you can easily download using **pip** command . Here are the instructions( if you don't have it already) to follow: 

```bash
$  pip install virtualenv
```

When then installation process is done, you can now create a virtual environment that you can call for instance **mlenv** by using the following command line: 
```bash
$ virtualenv -p python3 mlenv
```
***Note that we are using python3 in this project***
	
Now you can activate your virtual environment after that the necessary files have been properly installed. Run this command and you should see between brackets (mlenv) at the begining of your shell prompt:
```bash
$ . mlenv/bin/activate
```
or
```bash
$ source mlenv/bin/activate
```
***⚠Do not miss the dot ( . ) at begining of the first command***

### Install python libraries

Now that you have activated your virtual environment, you can install all the libraries you will need to run this experiment. If you look closer at your working directory, you will see at the root of the project a file named ***requirements.txt***. This file lists all python dependencies you'll need, you can install them all at once by using this single command:
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

The two first sections are focused on preparing your data for analysis. It deals with missing values, preliminary data preparations and checks for irrelevant data to make focus on features that will provide you with useful information on income taxability.
The third section (**Getting insights from clients distributions**) is a very large section that will analyze distributions on time and geographic scopes and will lay emphasis a little on pertinent qualitative variables.
The section on (**Clustering clients**), uses various machine learning techniques to get insights from data. In terms of methodology, we found it more convinient on **Python** to seperate data into qualitative and quantitative sets. We are unfortunately unaware of implementations of algorithms that would deal with both qualitative and quantitative measures like [FAMD](https://rdrr.io/cran/FactoMineR/man/FAMD.html) which is only available on R software. Thus you will find in this section:
*  Dimensionality reduction(Pincipal component analysis, stochastic neighbour embedding(tSNE)) for quantitative variables like wage, capital gains and losses or year
* Clustering using k-means, DBscan on quantitative data
* Hierarchical agglomerative classification(HAC) on qualitative data using Jaccard index
* Clusters Labelling : we give names to our cluster based on more relevant variables


Finally, we dive into the most interesting part which is learning on data to predict the fact of not declaring taxable income. Since our sample data is unbalanced, accuracy is less relevant than statistical measures like specificity. That's why we came up with an evaluation strategy which favors specificity over accuracy defined as follows :
$$\gamma=\frac{1}{3}accuracy+\frac{2}{3}specificity$$

We have saved all our models in the **model/** directory with the pickle extension(**.pkl**) so that we will be able to reuse them at any time for prediction. 
Our final pipeline for both feature engineering and prediction looks like this:



# Want to run this project using a Docker image?
## Prerequisites

Follow the instructions on [Install Docker](https://docs.docker.com/engine/installation/)  in order to install it on your device or server. The [Docker Desktop](https://www.docker.com/products/docker-desktop/) software is also a very convinient tool I highly recommend to help you manage your systems with runtime statistics and easy management services





# FAQ



## Author
Abdourahmane T. KAMARA(Data Scientist)