import pandas as pd

# Create a sample dictionary
data = {
    'Name': ['Alice', 'Bob', 'Charlie'],
    'Age': [25, 30, 35],
    'City': ['New York', 'Los Angeles', 'Chicago']
}

# Create a DataFrame
df = pd.DataFrame(data)

# Print the entire DataFrame
print("Full DataFrame:")
print(df)

# Print only the names column
print("\nNames:")
print(df['Name'])

# Get some basic statistics
print("\nBasic Statistics:")
print(df.describe())
