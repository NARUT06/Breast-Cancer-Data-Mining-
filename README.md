# Breast Cancer Data Mining Assignment

**Author:** Mohammed Geahd

**Id:** 2023010080

**Course:** Bioinformatics / Data Mining  

**Date:** 2026/03/06

---

## Table of Contents
1. [Introduction](#introduction)
2. [Methods](#methods)
3. [Results](#results)
4. [Discussion](#discussion)
5. [Conclusion](#conclusion)
6. [Appendix](#appendix)

---

## Introduction

Breast cancer diagnosis is a critical medical problem. Early and accurate detection improves patient survival.  
This assignment uses the Breast Cancer Wisconsin (Diagnostic) dataset to explore the data, train a k-Nearest Neighbors (k-NN) classifier, and evaluate its performance.

---

## Methods

### Dataset Description
- 569 instances, 32 attributes (ID + Diagnosis + 30 Features)
- Features are computed from FNA images (mean, SE, worst)
- Diagnosis: Benign (B) or Malignant (M)

### Data Preprocessing
- ID column removed
- Diagnosis converted to factor
- Checked for missing values (none found)

### Model Building
- Split dataset: 70% training, 30% testing
- k-NN classifier (`k = 5`) using `kknn` package
- Kernel used: rectangular

### Evaluation Metrics
- Confusion Matrix
- Accuracy, Precision, Recall, F1-Score

---

## Results

### Data Exploration
- Benign cases: 357, Malignant cases: 212
- Example features ranges:
  - Radius_mean: 6.981 – 28.11
  - Texture_mean: 9.71 – 39.28
  - Perimeter_mean: 43.79 – 188.5

### Visualizations
![Diagnosis Distribution](images/diagnosis_barplot.png)  
*Bar plot showing the number of benign vs malignant cases.*

![Radius vs Texture](images/radius_texture_scatter.png)  
*Scatter plot of Radius_mean vs Texture_mean colored by diagnosis.*

### Model Evaluation
**Confusion Matrix:**

| Actual \ Predicted | Benign | Malignant |
|------------------|--------|-----------|
| Benign            | TN     | FP        |
| Malignant         | FN     | TP        |

**Performance Metrics:**
- Accuracy: 0.9532
- Precision: 0.9714
- Recall: 0.9722
- F1-Score: 0.9718

---

## Discussion

- The model achieves high accuracy and F1-Score, indicating good performance.  
- **Medical context:**  
  - False Negatives (FN) are more critical than False Positives (FP). Missing a malignant tumor can be life-threatening.  
- Feature scaling could be considered in future work.  
- Experimenting with different k values and other classification algorithms may further improve performance.

---

## Conclusion

- The k-NN classifier successfully predicted breast cancer diagnosis with high accuracy.  
- Data exploration and visualization provided insight into feature importance and distribution.  
- Proper evaluation metrics allow understanding of clinical implications and reliability of the model.

---

## Appendix

### R Code
```r
# (Include the R code here, or provide a link to your R script)
