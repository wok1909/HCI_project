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

