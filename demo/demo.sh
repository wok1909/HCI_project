#!/bin/bash

demo_video=VIDEO_PATH

img_path="/home/c02002/HCI_project/demo/frames"
output_path="/home/c02002/HCI_project/pytorch-ssd/generated"


ffmpeg -ss 00:00:0 -i $demo_video -r 1 -f image2 /home/c02002/HCI_project/demo/frames/frame-%d.jpg

for num in {1..22}
do 
  input_path=$img_path/frame-$num.jpg
  echo $input_path

  save_path=$output_path/output-$num.jpg
  

  python /home/c02002/HCI_project/pytorch-ssd/run_ssd_db.py $input_path
  sleep 5
done

