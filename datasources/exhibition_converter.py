import pandas as pd
import daterangeparser

import sys

input_path = sys.argv[1]

def make_dataframe(input_path):
    df = pd.read_csv(input_path)
    return df

def main():
    df = make_dataframe(input_path)
    try:
        df['isoDates'] = df['exhibitionDates'].map(daterangeparser.parse, na_action='ignore')
        df['Start Date'] = df['isoDates'].values[0][0]
        df['End Date'] = df['isoDates'].values[0][1]
    except KeyError:
        df['Start Date'] = pd.to_datetime(df['Date Start']).dt.strftime('%Y-%m-%d')
        df['End Date'] = pd.to_datetime(df['Date End'], format='mixed').dt.strftime('%Y-%m-%d')
    outpath = "exhibitions_cleaned.csv"
    df.to_csv(outpath)

if __name__ == "__main__":
    main()
