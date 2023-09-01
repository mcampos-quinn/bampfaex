import pandas as pd
import pathlib
import daterangeparser

import sys

input_path = pathlib.Path(sys.argv[1])

def make_dataframe(input_path):
    df = pd.read_csv(input_path)
    return df

def main():
    df = make_dataframe(input_path)
    try:
        df['isoDates'] = df['exhibitionDates'].map(daterangeparser.parse, na_action='ignore')
        df['series_start_date'] = df['isoDates'].map(lambda x: x[0])
        df['series_end_date Date'] = df['isoDates'].map(lambda x: x[1])
    except:
        df['series_start_date'] = pd.to_datetime(df['Date Start']).dt.strftime('%Y-%m-%d')
        df['series_end_date'] = pd.to_datetime(df['Date End'], format='mixed').dt.strftime('%Y-%m-%d')
    outpath = input_path.stem + "_cleaned.csv"
    df.to_csv(outpath)

if __name__ == "__main__":
    main()
