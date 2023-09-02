from datetime import datetime
import requests
import os

url = "http://www.islamicfinder.us/index.php/api/prayer_times/?latitude=29.8403&longitude=31.2982&timezone=Africa/Cairo&method=5&time_format=0"
endday = True
try:
   data = requests.get(url).json()

   now = datetime.now()
   current_time = int(now.strftime("%H"))*60 + int(now.strftime("%M"))
   remain_time = 0
   current_prayer = ""

   for prayer in data["results"]:
      time = data['results'][prayer]
      prayer_time = int(time[:2])*60 + int(time[3:])
      if(prayer_time >= current_time):
         remain_time = prayer_time - current_time
         endday = False
         print(f"{int(remain_time/60):02d}:{remain_time%60:02d}")
         current_prayer = prayer
         break
   if endday:
      time = data["results"]["Fajr"]
      prayer_time = int(time[:2])*60 + int(time[3:])
      remain_time = (current_time - prayer_time - 24*60) * -1
      print(f"{int(remain_time/60):02d}:{remain_time%60:02d}")
   if remain_time == 0:
      command = f'notify-send "It\'s {current_prayer} time." -i ~/.config/polybar/mosque.png'
      os.system(command)

except:
   print("**:**")
