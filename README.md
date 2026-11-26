# IPL Data Wrangling & toss Impact Analysis

## Objective
The goal of this micro-project was to extract and clean unstructured raw CSV data from Cricsheet using R, and analyze a specific question: **Does winning the toss actually help in winning an IPL match?**

## Skills & Tools Used
* **Language:** R
* **Libraries:** `dplyr`, `tidyr`, `ggplot2`
* **Techniques:** Data Wrangling, Custom R Functions, Handling Unequal Data Frames, Data Visualization.

## Methodology
1. Created a custom R function to read through 1200+ heterogeneous CSV files containing both match metadata and ball-by-ball details.
2. Extracted only the relevant metadata (Toss Winner, Match Winner) using Regex and text parsing.
3. Cleaned and reshaped the data using `pivot_wider` and handled duplicate column structures.
4. Merged all seasons' data into a single clean dataframe.

## Conclusion
Based on the visualized data (see attached plot), winning the toss does not provide a massive asymmetrical advantage in IPL matches. The win rate for the toss-winning team is 50.52377 , indicating that match outcomes rely heavily on actual gameplay rather than the initial coin toss.
