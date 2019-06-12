import requests
import json
import argparse
from bs4 import BeautifulSoup as bs
from nltk.sentiment.vader import SentimentIntensityAnalyzer

parser = argparse.ArgumentParser(description="Scrape emojis.")
parser.add_argument("-d", "--download", action="store_true", help="Download emoji list from the internet (https://www.unicode.org/emoji/charts/full-emoji-list.html).")
parser.add_argument("-f", "--file", help="Read emoji list from this file.")
parser.add_argument("-o", "--outfile", help="specify file to store downloaded emoji_list_page. Only has effect if -d.")

args = parser.parse_args()
nltk_sentiment_analyzer = SentimentIntensityAnalyzer()

DEFAULT_OUTFILE = "emoji_list_page.html"

def download_emoji_list_page():
    request = requests.get("https://www.unicode.org/emoji/charts/full-emoji-list.html")
    return request.text

def nltk_sentiment(phrase):
    score = nltk_sentiment_analyzer.polarity_scores(phrase)
    return score 

#
# Main script
if (args.download):
    # print("Downloading emoji list web page...")
    emoji_list_page = download_emoji_list_page()

    if(args.outfile):
        outfile = args.outfile
    else:
        outfile = DEFAULT_OUTFILE

    # print("Writing downloaded emoji list page to " + outfile + "...")
    with open(outfile, "w") as outfile:
        outfile.write(emoji_list_page)

elif(len(args.file) > 0):
    with open(args.file, "r") as emoji_list_page:
        emoji_list_page = emoji_list_page.read()

# print("Stripping newlines from emoji list page...")
stripped_emoji_list_page = emoji_list_page.replace("\n", " ")
soup = bs(emoji_list_page, "html.parser")
table = soup.table

rows = table.find_all("tr")

emojis = {}
for row in rows:
    fields = row.find_all("td")
    # print(len(fields))
    if len(fields) == 15:
        emojis[fields[2].contents[0]] = (fields[14].contents[0], nltk_sentiment(fields[14].contents[0]))

print(json.dumps(emojis))
