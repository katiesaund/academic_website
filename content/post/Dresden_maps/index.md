---
title: "Using Maps in R: Tutorial with locations from The Dresden Files"
subtitle: []
authors: ["Katie Saund"]
tags: []
categories: []
date: "2019-09-019T00:00:00Z"
lastmod: "2019-09-19T00:00:00Z"
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
# Locations in The Dresden Files

## Getting location data
I had a ton of fun clicking around this [interactive map](https://www.google.com/maps/d/u/0/viewer?mid=1EVEViVHIuS8nXzhz66b7rEwwRqo&hl=en_US&ll=41.88792118153663%2C-87.69842410058595&z=9
) of The Dresden Files locations. I wanted to expand on it by including more locations and adding metadata onto the locations. I've grabbed many of the locations from this map, those curated on two pages on The Dresden Files Wiki [all locations](http://dresdenfiles.wikia.com/wiki/Category:Locations?display=page&sort=mostvisited) and [just Chicago](http://dresdenfiles.wikia.com/wiki/Chicago), then finally added a few of my own for a total of 60 locations. I excluded most of the invented locations for which there is little to no description of the approximate location such as Harry's office and  McAnally's Pub, but I included locations with fuller descriptions such as the Carpenter's home near Wrigely Field and Thomas Raith's apartment in the Gold Coast area.    

Once I had the names of locations (ex: "Shedd Aquarium, Chicago") I used the package ggmap to obtain latitude and longitude information. 

#### Obtaining latitude and longitude with ggmap

I learned to create maps using a helpful [tutorial](https://eriqande.github.io/rep-res-web/lectures/making-maps-with-R.html) and to make animations using the vignette for the package [magick](https://cran.r-project.org/web/packages/magick/vignettes/intro.html).

Importantly, since Eric's tutorial was written an update to Google's Maps Platform now meads that `ggmap::geocode` requires that you have an API key from Google. I went to this [registration page](https://cloud.google.com/maps-platform/#get-started) to sign up for an API key. I "Enabled Google Maps Platform" by following the on screen wizard (selected Maps, generated a project name, and gave billing info). Linking a credit card was less than ideal, so if you have other mapping tools that you prefer please let me know about them! Once I signed up for the Google Maps Platform account, I navigated to APIs & Services and then Credentials. I clicked "Create Credentials" > "API Key." In doing so I was able to generate an API key, which is a string of alphanumeric gobbledegook. 

Back in R, here's how you use your API key and then __finally__ get to search for latitude and longitude. 

```
install.packages("ggpmap")
library(ggmap)
register_google(key = "paste_your_API_key_here")
geocode("Chicago, Illinois")
# A tibble: 1 x 2
    lon   lat
  <dbl> <dbl>
1 -87.6  41.9
```

Now that we can get locations, we can get to plotting on maps! 


I cleaned up my data into a tibble and added some information about the book in which the location first appears and if there is a character or group particularly associated with the location. Here's what some of my data looks like: 

```
> head(dresden_locations)
# A tibble: 6 x 6
  Name                                     First_Appearance Character     Group   Lat  Long
  <chr>                                    <chr>            <chr>         <chr> <dbl> <dbl>
1 Burnham Harbor, Chicago                  Death Masks      Thomas Wraith NA     41.9 -87.6
2 Chicago Botanic Gardens                  Cold Days        Summer Lady   NA     42.1 -87.8
3 Cook County Hospital, Chicago            Fool Moon        NA            NA     41.9 -87.7
4 Field Museum of Natural History, Chicago Dead Beat        NA            NA     41.9 -87.6
5 Carbon & Carbide Building, Chicago       Skin Game        NA            NA     37.4 -94.8
6 Graceland Cemetery, Chicago              Grave Peril      NA            NA     42.0 -87.7
```

Other tools you may want to plot this data: 

```
install.packages("tidyverse")
library(tidyverse)
```

A [color palette I made](https://github.com/katiesaund/DresdenColor) based on the very same book series: 
```
install.packages("devtools")
devtools::install_github("katiesaund/DresdenColor")
library(DresdenColor)
```

## The most basic of maps
First things first, let's make a map of all of the data! 

```
world_map <- borders("world", 
                       fill = "white", 
                       colour = "white", 
                       bg = "light blue")
  
dresden_locations %>% 
    select(Lat, Long) %>% 
    filter(!is.na(Lat)) %>%
    ggplot() + 
    world_map + 
    coord_fixed(1.3) + 
    geom_point(aes(x = Long, y = Lat), 
               size = 1.5, 
               color = "black", 
               fill = dresden_palette("skingame", type = "discrete")[4],
               alpha = 1, 
               shape = 21) +
    theme(panel.background = 
            element_rect(fill = dresden_palette("colddays", 
                                                type = "discrete")[4], 
                         size = 0.0),
          panel.border = element_rect(colour = "black", fill = NA, size = 2),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          text = element_blank(), 
          axis.ticks = element_blank())
```

This code yields a plot of every Dresden Files location: 
![All Dresden Files Locations](img/all_locations.png) 

If you didn't know it already, this map makes is pretty clear that The Dresden Files are set in the Midwest. This map is fine, but it doesn't clue us into much else about the marvelous world created by Jim Butcher. 

## Plotting the locations by their order of appearance  
Next, I plotted as many of the Chicago locations from Books 1-15 + *Side Jobs* + *Brief Cases* that I could assemble. Each image in the animation adds locations from each book, sequentially. We can see how much more rich the Chicago environment beomes with each new adventure.  
![Dresden Files Locations by Book](img/including_book_maps_animation.gif) 

To make the gif I first made a map for Book 1 (Storm Front), saved it. Then I made a second map for locations from books 1 and 2 (Storm Front & Fool Moon). I continued until I had all of the locations included on the final map. Then I saved the individual pictures into a gif. 

Here's an outline for how to build it yourself: 


## Red Court vs. White Council  
I've recently been listening to the audiobook for Changes so the war between the Red Court and the White Counil is fresh in my mind. Here I have some of their relevant locations by faction. White Council locations include HQ in Edinborough, Camp Kaboom, and Archangel. For the Red Court I focused on just Chichen Itza and Casaverde; we're told they control much of South America but without any specifics listed in the novels I'll leave that to your imagination.    
![Red Court and White Council Map](img/red_court_and_white_council.png) 

## Paranet  
Finally, I've compiled all of the Paranet locations explicitly listed. For locations where only a state or country was mentioned rather than a specific city I simply assigned the location to the relevant capital. The Paranet is such a wonderful concept and I love everytime we get to meet new Netters. Hopefully. we get to hear about some more of the global paranet locations in the future. Where do you think will be next?  
![Paranet Map](img/paranet_map.png) 

Be sure to let me know about all of the locations I have forgotten to include. 

