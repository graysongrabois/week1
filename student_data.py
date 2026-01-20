import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# Load the CSV file into a DataFrame
df = pd.read_csv('student_performance.csv')

# ===== BASIC EDA FUNCTIONS =====

# 1. Display basic info about the dataset
print("Dataset Shape:")
print(df.shape)  # Returns (rows, columns)
print("\n" + "="*50 + "\n")

# 2. First few rows
print("First 5 rows:")
print(df.head())
print("\n" + "="*50 + "\n")

# 3. Last few rows
print("Last 5 rows:")
print(df.tail())
print("\n" + "="*50 + "\n")

# 4. Dataset Info (data types, non-null counts)
print("Dataset Info:")
df.info()
print("\n" + "="*50 + "\n")

# 5. Statistical Summary
print("Statistical Summary:")
print(df.describe())


print("\n" + "="*50 + "\n")

# 6. Missing Values
print("Missing Values:")
print(df.isnull().sum())
print("\nMissing Values (%):")
print((df.isnull().sum() / len(df) * 100).round(2))
print("\n" + "="*50 + "\n")

# 7. Data Types
print("Data Types:")
print(df.dtypes)
print("\n" + "="*50 + "\n")

# 8. Duplicate Rows
print(f"Number of Duplicate Rows: {df.duplicated().sum()}")
print("\n" + "="*50 + "\n")

# 9. Column Names
print("Column Names:")
print(df.columns.tolist())
print("\n" + "="*50 + "\n")

# 10. Correlation Matrix (for numerical columns)
print("Correlation Matrix:")
print(df.corr(numeric_only=True))
print("\n" + "="*50 + "\n")

# 11. Value Counts for categorical columns
print("Value Counts for Categorical Columns:")
for col in df.select_dtypes(include=['object']).columns:
        print(f"\n{col}:")
        print(df[col].value_counts())
    