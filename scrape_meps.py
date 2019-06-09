import requests
import pprint
from bs4 import BeautifulSoup

pp = pprint.PrettyPrinter(indent  = 4)

#
# Parse Wiki page 'Liste der Mitglieder des 8. Europaischen Parlaments'
wiki_page = requests.get('https://de.wikipedia.org/wiki/Liste_der_Mitglieder_des_8._Europ%C3%A4ischen_Parlamentes')
soup = BeautifulSoup(wiki_page.text, 'html.parser')
# print(wiki_page.text)

# Get actual list
# The tables 4 and 5 contain the meps
all_tables = soup.find_all("tbody")
all_tables_string = str(all_tables)
all_tables_list = all_tables_string.split('</tbody>')

rows_list = str(all_tables_list[4]).split('<tr>')
rows_list = rows_list + str(all_tables_list[5]).split('<tr>')

meps = []

i = 0
for row in rows_list[1:]:
    col = row.split('<td>')

    print("")
    pp.pprint(col)

#    print(i, col[0].split('title="')[1].split('"')[0].split('(')[0])
#    print(col[1].split('>')[1].split('<')[0])
#    print(col[2].split('>')[1].split('<')[0])
#    try:
#        print(col[4].split('>')[1].split('<')[0])
#    except:
#        print('ERROR')
#    print('')

    i += 1
