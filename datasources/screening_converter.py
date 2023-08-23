import pandas as pd

import sys

input_path = sys.argv[1]

def make_dataframe(input_path):
    df = pd.read_csv(input_path)
    return df

def convert_showtimes(df):
    df['time_one'] = pd.to_datetime(df['Showtime One'], format='mixed').dt.strftime('%H:%M')
    df['time_one'] = df['time_one'].fillna('')
    df['time_two'] = pd.to_datetime(df['Showtime Two'], format='mixed').dt.strftime('%H:%M')
    df['time_two'] = df['time_two'].fillna('')

    return df

def convert_date_to_iso(df):
    df['iso_date'] = pd.to_datetime(df['Play Date']).dt.strftime('%Y-%m-%d')

    return df

def construct_datetimes(df):
    df['datetime_one'] = df["iso_date"].map(str)+" "+df["time_one"].map(str)
    df['datetime_one'] = pd.to_datetime(df['datetime_one'], format='mixed').dt.strftime('%Y-%m-%dT%H:%M')
    df['datetime_two'] = df["iso_date"].map(str)+" "+df["time_two"].map(str)
    df['datetime_two'] = pd.to_datetime(df['datetime_two'], format='mixed').dt.strftime('%Y-%m-%dT%H:%M')

    # replace any datetimes without times to empty string (we already know the date elsewhere)
    df['datetime_one'] = df['datetime_one'].replace(to_replace=r'^.+T00:00$', value='', regex=True)
    df['datetime_two'] = df['datetime_two'].replace(to_replace=r'^.+T00:00$', value='', regex=True)

    return df

def main():
    df = make_dataframe(input_path)
    df = convert_showtimes(df)
    df = convert_date_to_iso(df)
    df = construct_datetimes(df)
    outpath = "screenings_cleaned.csv"
    df.to_csv(outpath)

if __name__ == "__main__":
    main()
