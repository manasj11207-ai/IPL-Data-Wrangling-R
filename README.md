# IPL Data Wrangling & toss Impact Analysis

## Objective
The goal of this micro-project was to extract and clean unstructured raw CSV data from Cricsheet using R, and analyze a specific question: **Does winning the toss actually help in winning an IPL match?**

## Skills & Tools Used
Language: R

Libraries: tidyverse (dplyr, tidyr, ggplot2)

Techniques: Programmatic File Iteration, Text Parsing (regex), Data Reshaping, Feature Engineering.

## Methodology
1. Automated Ingestion: Processed over 1,200 heterogeneous CSV files across multiple IPL seasons using list.files() and lapply().

2. Text Parsing: Used readLines() and grepl("^info") to scan raw text and extract only the relevant match metadata, skipping unnecessary ball-by-ball rows to optimize processing.

3. Data Reshaping: Converted the unstructured rows into a clean tabular format using read.csv() on text inputs, followed by pivot_wider() to handle unequal data structures.

4. Aggregation: Combined the processed lists into a single master dataframe using bind_rows() and engineered a binary feature to track toss impact

## Conclusion
Based on the visualized data (see attached plot), winning the toss does not provide a massive asymmetrical advantage in IPL matches. The win rate for the toss-winning team is 50.52377 , indicating that match outcomes rely heavily on actual gameplay rather than the initial coin toss.
