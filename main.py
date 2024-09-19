# main.py

#import libs (it works only after installation!)
import sys
import os
import requests
from PIL import Image
from io import BytesIO

#define the main process to download a pic from wiki and show in terminal
def main():
    url = os.environ.get('WEBPIC')
    if not url:
        print("A 'WEBPIC' környezeti változó nincs beállítva.", file=sys.stderr)
        sys.exit(1)
    try:
        response = requests.get(url)
        response.raise_for_status()
        image = Image.open(BytesIO(response.content))
        image = image.convert('L')  # Szürkeárnyalatos konvertálás

        # Kép átméretezése az ASCII megjelenítéshez
        image = image.resize((80, 40))
        pixels = image.getdata()
        chars = [" ", ".", ":", "-", "=", "+", "*", "#", "%", "@"]

        new_pixels = [chars[pixel // 25] for pixel in pixels]
        new_pixels = ''.join(new_pixels)

        # Karakterlánc felosztása sorokra
        ascii_image = [new_pixels[index:(index + 80)] for index in range(0, len(new_pixels), 80)]
        for line in ascii_image:
            print(line)
    except Exception as e:
        print(f"Hiba történt: {e}", file=sys.stderr)
        sys.exit(1)

#if you import a python file into an other, you just 
#run all the codes if you jus throw here the commands! 
#use the following pattern in python code, define an if statement to
#determine the "purpose": 
if __name__ == "__main__":
    main()
