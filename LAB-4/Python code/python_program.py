
import os

import pyscreenshot as ImageGrab

import pyaudio
import wave

import cv2
import numpy as np

def info():
	os.system("echo "   " > system_information_discovery.txt")
	os.system("uname -a >> system_information_discovery.txt")
	os.system("echo "   " >> system_information_discovery.txt")
	os.system("lscpu >> system_information_discovery.txt")
	os.system("echo "   " >> system_information_discovery.txt")
	os.system("lsblk >> system_information_discovery.txt")
	os.system("echo "   " >> system_information_discovery.txt")

	
def cmd():
	print("\n Windows command line is open:\n") 
	
	while True:
		
		cmd=input(">")
		
		if cmd!="exit":
			os.system(cmd)
			continue
		elif cmd=="exit":
			break
			
 def deletion():
 	os.system("rm")


def process():
	os.system("pstree")
		
		

def screen():
	im = ImageGrab.grab()
	im.save("fullscreen.png")



def audio():
	# the file name output you want to record into
	filename = "recorded.wav"
	# set the chunk size of 1024 samples
	chunk = 1024
	# sample format
	FORMAT = pyaudio.paInt16
	# mono, change to 2 if you want stereo
	channels = 1
	# 44100 samples per second
	sample_rate = 44100
	record_seconds = 5
	# initialize PyAudio object
	p = pyaudio.PyAudio()
	# open stream object as input & output
	stream = p.open(format=FORMAT,
		        channels=channels,
		        rate=sample_rate,
		        input=True,
		        output=True,
		        frames_per_buffer=chunk)
	frames = []
	print("Recording...")
	for i in range(int(44100 / chunk * record_seconds)):
	    data = stream.read(chunk)
	    # if you want to hear your voice while recording
	    # stream.write(data)
	    frames.append(data)
	print("Finished recording.")
	# stop and close stream
	stream.stop_stream()
	stream.close()
	# terminate pyaudio object
	p.terminate()
	# save audio file
	# open the file in 'write bytes' mode
	wf = wave.open(filename, "wb")
	# set the channels
	wf.setnchannels(channels)
	# set the sample format
	wf.setsampwidth(p.get_sample_size(FORMAT))
	# set the sample rate
	wf.setframerate(sample_rate)
	# write the frames as bytes
	wf.writeframes(b"".join(frames))
	# close the file
	wf.close()



def video():
	# Create a VideoCapture object
	cap = cv2.VideoCapture(0)

	# Check if camera opened successfully
	if (cap.isOpened() == False): 
	  print("Unable to read camera feed")

	# Default resolutions of the frame are obtained.The default resolutions are system dependent.
	# We convert the resolutions from float to integer.
	frame_width = int(cap.get(3))
	frame_height = int(cap.get(4))

	# Define the codec and create VideoWriter object.The output is stored in 'outpy.avi' file.
	out = cv2.VideoWriter('outpy.avi',cv2.VideoWriter_fourcc('M','J','P','G'), 10, (frame_width,frame_height))

	while(True):
	  ret, frame = cap.read()

	  if ret == True: 
	    
	    # Write the frame into the file 'output.avi'
	    out.write(frame)

	    # Display the resulting frame    
	    cv2.imshow('frame',frame)

	    # Press Q on keyboard to stop recording
	    if cv2.waitKey(1) & 0xFF == ord('q'):
	      break

	  # Break the loop
	  else:
	    break  

	# When everything done, release the video capture and video write objects
	cap.release()
	out.release()

	# Closes all the frames
	cv2.destroyAllWindows()



def main():
	while True:
	
		answer=input("Input command: ")
		
		if answer=="info":
			info()
			continue
		elif answer=="process":
			process()
			continue
		elif answer=="cmd":
			cmd()
			continue
		elif answer=="get_screen":
			screen()
			continue
		elif answer=="get_audio":
			audio()
			continue
		elif answer=="get_video":
			video()
			continue
		elif answer=="exit":
			break;
		
main()
