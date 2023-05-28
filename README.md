## Finding A Parking Space

## 1. Members

```jsx
김종순 박두현 안지원 옥준용 우옥균 임건호
```

## 3. Background

### 3-1 problems

```markdown
Since the COVID-19 situation has come to an end, a lot of students have returned to school and the number of vehicles increased accordingly. Therefore, an insufficient parking lot problem aroused. To solve this problem, we came up with the idea to show up parking spaces for the users so that they can park more efficiently.The problem is that there a e not enough parking spaces to accommodate the increase in vehicles, which is causing i convenience for students, faculty, and staff. This problem is impacting the school's operations, as it is creating delays and frustration for those who are unable to find a pa king space, especially in the crowded morning.

```

### 3-2 existing cases, examples, similar studies

```markdown
There are already various services available that provide real-time parking space infor ation. Some well-known examples include "ParkWhiz", "SpotHero", "ParkMobile", and "Park e". These services provide information on available parking spots and allow users to re erve a parking space in their desired location. Companies such as "Park Assist" and "Smart Parking" use cameras within parking lots to detect available parking spaces in real- ime and provide this information to users. In addition to providing real-time parking space information, there are also similar studies being conducted. For example, "ParkNet" is a research project that uses deep learning models for real-time parking space detection. The model detects available parking spaces based on the video input from cameras in the parking lot. "ParkEyes" is another service that combines cameras, IoT sensors, and AI technology to provide real-time information on the location of parked cars and availa le parking spaces within a parking lot. This service helps users easily find their parked car within the parking lot. By referring to similar approaches used in these existing cases, this project can be developed further.
```

### 3-3 objectives

```markdown
The goal of this project is to create a parking service that enables drivers to easily
locate available parking spots in Handong Global University's parking lots. This service aims to reduce the time and effort required for drivers to find a parking spot upon arrival.

```

## 4. Methods

### 4-1 Target user

```markdown
Our target users are Handong students and faculty who use the Handong Smart campus application and drive to school and look for a parking space in the crowded morning. The Handong Smart campus application, which all Handong students use, allows students to access diverse information in Handong. Since every Handong student has access to this applicat on, it will be great for our service to provide parking information through this existing application. Through this application, we can solve the lack of parking lots.

```

### 4-2 technologies

```
AI model : SSD MobileNet (<https://github.com/qfgaohao/pytorch-ssd>)
Input Data : Last image frame from Youtube live stream
Used Library : Youtube-dl, FFMPEG
Databaase : Firebase
Sever : 24 / 7 always activated which run our code unstoppable
Flutter : a frame work which work with dart code and developing ios and android application simultaneously

```

### 4-4 Run

1. git clone

`git clone https://github.com/wok1909/HCI_project.git`

1. download git submodules

`git submodule update --init --recursive`

1. Download pytorch-ssd models and pretrained parameters through github page.

link : https://github.com/qfgaohao/pytorch-ssd

1. Run Demo (Using Recorded video)
    1. Prepare a video at `HCI_project/demo`
    2. Run `HCI_project/demo/demo.sh`

1. Run Live (Using Youtube Live Stream)
    1. Prepare a live youtube stream link
    2. Put the link in the shell script code and run
    
    ```c
    #!/bin/bash
    
    rm -f /home/c02002/HCI_project/live/input.jpg
    
    youtube-dl -g -f 95 "YOUTUBE_LIVE_LINK" > ../videos/stream-url
    ffmpeg -i $(cat ../videos/stream-url) -f image2 -frames:v 1 /home/c02002/HCI_project/live/input.jpg
    
    python /home/c02002/HCI_project/pytorch-ssd/run_ssd_db.py \
    			 mb1-ssd \
    			 /home/c02002/HCI_project/pytorch-ssd/models/mobilenet-v1-ssd-Epoch-99-Loss-2.2184619531035423.pth \
    			 /home/c02002/HCI_project/pytorch-ssd/models/open-images-model-labels.txt \
    			 /home/c02002/HCI_project/live/input.jpg \
    			 /home/c02002/HCI_project/live/output.jpg
    ```
    

- Changing the number of total parking lot
    - Change the number of `totalSpace` or you can change the `placeIndex`  in `run_ssd_db.py`

```c
totalSpace = [15, 20, 35, 50]
placeIndex = 0
```
