# Build the bookdown


## install bookdown


```{r }
install.packages("bookdown")

```

## open project

open the .Rproj file and in the history panel of Rstudio you will see the ```build``` tab. ```Build Book``` from there.


# Add boxes in your pages

write your code in a block assigning any style described in style.css file. The options available are ``rational`` or ``challenge`` but you can add any other style you want. Write your code as follow

```

#### Why do we need to do this?  {- .rational}

Clustering the cells will allow you to visualise the variability of your data, can help to segregate cells into cell types.   

####  {-}
```