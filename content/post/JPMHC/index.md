---
title: 'J. P. Morgan Healthcare Conference'
subtitle: 'Evaluating correlation between JPMHC week and healthcare stock prices'
authors: ["Katie Saund"]
tags: []
categories: []
date: "2019-06-04T00:00:00Z"
lastmod: "2019-06-04T00:00:00Z"
featured: false
draft: false

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal point options: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight
image: [2019-06-04_NASDAQ_vs_SP500.jpg]

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: []
---
## What is JPMHC? What does it have to do with biotech stocks?  

The J. P. Morgan Healthcare Conference is an annual get together of pharma and biotech bigwigs in San Francisco, CA. During JPMHC week 2019 (#JPMHC2019) I wondered how much of an impact this conference has on healthcare stock values. It's considered common knowledge that stocks change in response to the speeches, deals, and data presented at the meeting. I've found some sources that attempt to quantify the impact of the meeting on stocks (see below), but I wanted to (a) evaluate the data myself, (b) work with financial data for the first time in R, and (c) practice using tidyverse approaches.

Here's a [source that tries to quantify the impact of JPM week on biotech stocks](https://www.cnbc.com/2017/01/04/betting-on-biotech-during-jpmorgans-big-health-care-conference-pays-off-history-shows.html). Quotes from the article include: 

* "Biotech has historically outperformed the broader market during The J.P. Morgan Healthcare Conference"
* "In the past 16 years, the NYSE Arca Biotechnology index (BTK), which measures the performance of 30 biotechnology firms, has outperformed the S&P 500 index by nearly 3 percent during JPMorgan's conference"

Given this, I hypothesized that:

1. Healthcare stock prices tend to fluctuate more during JPM week than any other week in the same year.
2. The biotech sector outperforms the S&P 500 during JPM week more often than is expected by chance.

The analysis presented in the accompanying [**R Code**](https://github.com/katiesaund/JPM_Healthcare_2019/blob/master/2019-05-27_JPM_week.Rmd) preliminary. Advice from people familiar with analyzing finanical data is most welcome.

## Conclusions: If JPMHC affects biotech stocks, its within the noise of the market

Try to insert image here: 

{{< figure library="1" src="2019-06-04_NASDAQ_vs_SP500.jpg">}}
{{< figure src="https://github.com/katiesaund/academic_website/tree/master/content/post/JPMHC/2019-06-04_NASDAQ_vs_SP500.png" >}}
{{< figure src="https://github.com/katiesaund/academic_website/tree/master/content/post/JPMHC/2019-06-04_NASDAQ_vs_SP500.jpg" >}}

How about this: 
![alternative text for search engines](/2019-06-04_NASDAQ_vs_SP500.jpg)
![alternative text for search engines](/content/post/JPMHC/2019-06-04_NASDAQ_vs_SP500.jpg)
![alternative text for search engines](/master/static/img/2019-06-04_NASDAQ_vs_SP500.jpg)
![alternative text for search engines](https://github.com/katiesaund/academic_website/tree/master/content/post/JPMHC/2019-06-04_NASDAQ_vs_SP500.jpg)

Did the figure appear?



