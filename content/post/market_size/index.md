---
title: "An Interactive Dashboard for Market Sizing"
subtitle: []
authors: ["Katie Saund"]
tags: []
categories: []
date: "2019-11-19T00:00:00Z"
lastmod: "2019-11-19T00:00:00Z"
featured: false
draft: false

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal point options: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight
image: []

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: []
---

# Market Sizing 
I created an [interactive dashboard](https://katiesaund.shinyapps.io/market_size_app/) to facilitate with market sizing. Here is a static image of the dashboard:
![](img/market_size_screen_shot.png)  
  
Users can estimate the market size of a product, company or industry using a bottom up approach. The dashboard dynamically generates the plot with the relative sizes of the total available market (TAM), serviceable available market (SAM), and serviceable obtainable market (SOM). Users can download a `.png` of the plot.    

This dashboard was created to streamline market sizing efforts I undertake as a member of the University of Michigan's [Wolverine Venture Fund](http://zli.umich.edu/wolverine-venture-fund). 

The dashboard was created using the shiny package in R. If you use R, but haven't tried to make a shiny app yet I recommend that you give it a try. Some of the formatting seems clunky compared to base R, but there are great [tutorials](https://shiny.rstudio.com/tutorial/) so it won't take too long to implement a simple app. 
