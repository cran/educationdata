## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----usage-01, eval=FALSE-----------------------------------------------------
#  library(educationdata)
#  get_education_data(level, source, topic, by, filters, add_labels, csv)

## ----usage-02, message=FALSE--------------------------------------------------
library(educationdata)
 
df <- get_education_data(
   level = 'college-university',
   source = 'ipeds',
   topic = 'student-faculty-ratio'
 )

head(df)

## ----usage-03, message=FALSE--------------------------------------------------
library(educationdata)

df <- get_education_data(level = 'schools', 
                         source = 'ccd', 
                         topic = 'enrollment', 
                         by = list('race', 'sex'),
                         filters = list(year = 2008,
                                        grade = 9:12,
                                        ncessch = '340606000122'),
                         add_labels = TRUE)

head(df)

## ----endpoints, echo=FALSE----------------------------------------------------
source('../R/get-endpoint-info.R')
df <- get_endpoint_info("https://educationdata.urban.org")

df$years_available <- gsub('and' ,'', df$years_available)
df$years_available <- gsub('\u20AC' ,'-', df$years_available)
df$years_available <- gsub('\u00E2' ,'', df$years_available)
df$years_available <- gsub('\u201C' ,'', df$years_available)
df$optional_vars <- lapply(df$optional_vars, 
                           function(x) paste(x, collapse = ', '))
df$required_vars <- lapply(df$required_vars, 
                           function(x) paste(x, collapse = ', '))
df <- df[order(df$endpoint_url), ]

vars <- c('section', 
          'class_name', 
          'topic', 
          'optional_vars',
          'required_vars',
          'years_available')

knitr::kable(df[vars], 
             col.names = c('Level', 
                           'Source', 
                           'Topic', 
                           'By',
                           'Main Filters',
                           'Years Available'),
             row.names = FALSE)

## ----example-endpoints, echo = FALSE------------------------------------------
df <- df[df$section == 'schools' & df$topic == 'enrollment', ]

knitr::kable(df[vars], 
             col.names = c('Level', 
                           'Source', 
                           'Topic', 
                           'By',
                           'Main Filters',
                           'Years Available'),
             row.names = FALSE)

## ----example-01, eval=FALSE---------------------------------------------------
#  library(educationdata)
#  df <- get_education_data(level = 'schools',
#                           source = 'ccd',
#                           topic = 'enrollment')

## ----example-02, eval=FALSE---------------------------------------------------
#  df <- get_education_data(level = 'schools',
#                           source = 'ccd',
#                           topic = 'enrollment',
#                           by = list('race', 'sex'))

## ----example-03, eval=FALSE---------------------------------------------------
#  df <- get_education_data(level = 'schools',
#                           source = 'ccd',
#                           topic = 'enrollment',
#                           by = list('race', 'sex'),
#                           filters = list(year = 1988:1990,
#                                          grade = 6:8))

## ----example-04, eval=FALSE---------------------------------------------------
#  df <- get_education_data(level = 'schools',
#                           source = 'ccd',
#                           topic = 'enrollment',
#                           by = list('race', 'sex'),
#                           filters = list(year = 1988:1990,
#                                          grade = 6:8,
#                                          ncessch = '010000200277'))

## ----example-05, eval=FALSE---------------------------------------------------
#  df <- get_education_data(level = 'schools',
#                           source = 'ccd',
#                           topic = 'enrollment',
#                           by = list('race', 'sex'),
#                           filters = list(year = 1988:1990,
#                                          grade = 6:8,
#                                          ncessch = '010000200277'),
#                           add_labels = TRUE)

## ----example-06, eval=FALSE---------------------------------------------------
#  df <- get_education_data(level = 'schools',
#                           source = 'ccd',
#                           topic = 'enrollment',
#                           by = list('race', 'sex'),
#                           filters = list(year = 1988:1990,
#                                          grade = 6:8,
#                                          ncessch = '010000200277'),
#                           add_labels = TRUE,
#                           csv = TRUE)

