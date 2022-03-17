from tkinter import *


#Creer une fenetre 
windows = Tk()
#Dimensionnement de la fenetre
windows.geometry("300x300")
#nom de la fenetre
windows.title("Jl APP")
#Taille minimale 
windows.minsize(250, 250)
#changer l'icone d'une application 
#windows.iconbitmap("Logo.ico")
#Changer le backgroudn d'une applciation 
windows.config(background=' ')
#AFFICHER DU TEXTE 
label_title=Label(windows, text="Bienvenue sur l'application", bg = 'red', font = ("courrier",25))
# empacter le contenu afin qu'il puisse s'afficher et le postionner 
label_title.pack(side= LEFT)

# afficher la fenetre 
windows.mainloop()
