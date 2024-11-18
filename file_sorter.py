path = r'C:\Users\larso\OneDrive\Desktop\AB Python\Auto_file_sorter\\'

folder_names = ['CSV Files','Text Files','Image Files', 'Json Files', 'Py Files', 'Excel Files']

#C:\Users\larso\OneDrive\Desktop\AB Python\\'

for folder in folder_names:
    if not os.path.exists(path + folder):
        os.makedirs(path + folder)


file_names = os.listdir(path)

for file in file_names:
    if ".csv" in file and not os.path.exists(path + "CSV Files\\" + file):
        shutil.move(path + file, path + "CSV Files\\" + file)
    elif ".txt" in file and not os.path.exists(path + "Text Files\\" + file):
        shutil.move(path + file, path + "Text Files\\" + file)
    elif ".png" in file and not os.path.exists(path + "Image Files\\" + file):
        shutil.move(path + file, path + "Image Files\\" + file)
    elif ".py" in file and not os.path.exists(path + "Py Files\\" + file):
        shutil.move(path + file, path + "Py Files\\" + file)
    elif ".json" in file and not os.path.exists(path + "Json Files\\" + file):
        shutil.move(path + file, path + "Json Files\\" + file)
    elif ".xlsx" in file and not os.path.exists(path + "Excel Files\\" + file):
        shutil.move(path + file, path + "Excel Files\\" + file)
    
