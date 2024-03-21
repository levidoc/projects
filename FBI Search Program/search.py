#FBI Wanted API
import requests
import json
import os

wanted_list_pagnation = 1
api_page_link = 'https://api.fbi.gov/wanted/v1/list'; 


def clear_console(): 
    # For Windows
    if os.name == 'nt':
        _ = os.system('cls')

    # For Unix/Linux/MacOS
    else:
        _ = os.system('clear')

#Retrieve The Main Menu 
def main_menu(): 
    clear_console()

    global api_page_link; 

    print('\nFBI Wanted List\n\n')
    #WANTED LIST

    line1 = ["#    #    #", "######", "#    #", "#######", "######","######"]
    line2 = ["#   # #   #", "#    #", "##   #", "   #   ", "#     ","#    #"]
    line3 = ["#  #   #  #", "######", "# #  #", "   #   ", "######","#    #"]
    line4 = ["# #     # #", "#    #", "#  # #", "   #   ", "#     ","#    #"]
    line5 = ["#         #", "#    #", "#   ##", "   #   ", "######","######"]
    print('\nSearch Wanted People\n')

    w_list = [line1, line2, line3, line4, line5]

    for line in w_list:
        print(" ".join(line))

    print('1) Search Name \n2) Wanted List \n99) Exit\n\n')

    main_menu_index = input('Select Your Option: \n')
    if (main_menu_index == "1"): 
        search_name_menu()
        #Search The Search Name

    elif (main_menu_index == "2"):
        wanted_list_menu(1) #Retrieve The Wanted List 

    else: 
        input('Terminating The Program')
        exit(); 

def search_name_menu():
    clear_console()

    print('Search Civilian Name'); 
    print('1)Basic Search \n2)Profile Search \n99)Back\n\n')

    search_name_menu_index = input('Select Your Option: \n')
    if (search_name_menu_index == "1"):
        search_name = input('\n\nWanted List Keyword Search\n')

        response = requests.get(api_page_link, params={
            'title': search_name
        })
        data = json.loads(response.content)
        print(data['items'][0]['title'])

        input('Press Enter To Reload')
        search_name_menu()
 
        #Individual Search For Users 
    elif (search_name_menu_index == "2"): 
        search_keyword = input('\n\nBIO Profile Search')

        
        response = requests.get(api_page_link, params={
            'title': search_name
        })
        data = json.loads(response.content)

        for array_val in data['items']:
            name = array_val['title']
            details = array_val['details']
            url = array_val['url']

            print('NAME: '+name+'\nBIO:'+details+'\nWEBSITE URL:'+url)
        #Complex Search For User
        
        input('Press Enter To Reload')
        search_name_menu()
    else: 
        main_menu()
        #Return The Users To The Main Menu          

def wanted_list_menu(page_nation): 
    global wanted_list_pagnation

    clear_console()

    response = requests.get(api_page_link, params={
        'page': page_nation
    })
    print('\n\nFBI Wanted List: \n'); 
    data = json.loads(response.content)

    #print(data['page'])
    print(data['items'][0]['title'])

    wanted_list_index = input('\n\n1)Next Page \n 99)Exit Search\n'); 

    if (wanted_list_pagnation == "1"):
        wanted_list_pagnation = wanted_list_pagnation + 1
        #Increment The Pagnation List 

        wanted_list_menu(page_nation+1)
        #Load the next Search List 
    else :
        main_menu(); 
        #Return to the main menu 


#Start The Program 
main_menu(); 

#We do it for Harambe
#CREATED BY THE_LOST_KID
