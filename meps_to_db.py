from xml.dom.minidom import parse
import xml.dom.minidom
import mysql.connector

eptwitter_config = {
    'user': 'atomizer',
    'password': 'atomizer_password',
    'host': '127.0.0.1',
    'database': 'eptwitter',
    'charset': 'utf8mb4',
    'raise_on_warnings': True
}

connection = mysql.connector.connect(**eptwitter_config)
cursor = connection.cursor()

dom_tree = xml.dom.minidom.parse("meps.xml")
collection = dom_tree.documentElement
meps = collection.getElementsByTagName("mep")
for mep in meps:
    name = mep.getElementsByTagName("fullName")[0].childNodes[0].data
    country = mep.getElementsByTagName("country")[0].childNodes[0].data
    politicalGroup = mep.getElementsByTagName("politicalGroup")[0].childNodes[0].data
    nationalPoliticalGroup = mep.getElementsByTagName("nationalPoliticalGroup")[0].childNodes[0].data
    
    print(name, country, politicalGroup, nationalPoliticalGroup)
    cursor.execute(
            "INSERT IGNORE INTO meps (name, party, country, ep_fraction) VALUES (%s, %s, %s, %s)",
            (name, nationalPoliticalGroup, country, politicalGroup))

connection.commit()
print(len(meps))
